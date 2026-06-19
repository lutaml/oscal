# OSCAL Cross-Format: Namespace + Element-Ordering Fix Implementation Plan

> **For agentic workers:** Execute task-by-task. Steps use checkbox (`- [ ]`) syntax. This continues the markup round-trip work (see `oscal-scalar-field-modeling.md`, which fixed GAP 1 + top-level assembly ordering). KEEP all existing uncommitted changes in the metaschema worktree and oscal. **NO GIT COMMANDS of any kind** — leave everything uncommitted; the main agent commits later after Codex review + user approval.

**Goal:** Drive `cd /Users/umerhassan/lutaml/oscal && bundle exec rspec` to **0 failures** by (a) emitting the OSCAL default namespace on every generated element and on the OSCAL markup inline/block types, and (b) preserving metaschema declaration order for `<choice>` children so `<param>` emits `label` before `select`.

**Architecture:** The 3 remaining cross-format failures stem from generator gaps, NOT lutaml-model or Canon bugs. Two root causes, verified by bounded probes:
1. **Namespace (47 `namespace_declarations` diffs + most of the 56 `element_structure` diffs).** Generated assembly/field `xml do` blocks emit no `namespace`, so `to_xml` produces elements with no `xmlns`. Worse, generated markup fields reference the SHARED `Metaschema::InlineMarkupType`/`AnchorType`/`CodeType`/`ImageType`/`InsertType` whose `xml do` hardcodes `namespace ::Metaschema::Namespace` (`.../metaschema/1.0`). PROBE RESULT: an OSCAL-namespaced parent mapping `map_element "em"` to a `metaschema/1.0`-namespaced child DROPS the `<em>` entirely on round-trip (`a <em>b</em> c` → `a  c`). When parent AND child share one OSCAL `Namespace` class, the round-trip is byte-perfect (`<p xmlns="...oscal/1.0">a <em>b</em> c</p>`). Many "element_structure" diffs are Canon failing to pair `<label xmlns="oscal">` with `<label>` (no ns) — they should collapse once namespaces match.
2. **`<choice>` child ordering (residual `element_position`/`element_structure` on `param`).** Confirmed via metaschema source: the `parameter` model declares `define-field label` at position 3, then a `<choice>` (containing `field value`, `assembly select`) later. `ChoiceType`/`GroupedChoiceType` are NOT `ordered` in the metaschema gem, so per-instance child order inside a `<choice>` is not recorded; after a JSON/YAML hop, `to_xml` falls back to mapping order. The generated Parameter mapping order is already `label … value, select` (correct), so this cause is SECONDARY to namespace and may fully resolve once (1) lands — re-measure before doing extra work.

The namespace fix is implemented in the generator (metaschema worktree) and surfaces through regeneration of oscal's `all_models.rb`. The OSCAL markup types are emitted as OSCAL-LOCAL copies (in the generated module, with the OSCAL `Namespace`) instead of referencing the shared `Metaschema::*` types — this leaves the shared metaschema types untouched (no risk to the metaschema gem's own behavior).

**Tech Stack:** Ruby 3.x, lutaml-model (`namespace <NamespaceClass>` DSL — requires an `Lutaml::Xml::Namespace` SUBCLASS, NOT a URI string), metaschema generator + emitter, RSpec, Canon (`be_xml_equivalent_to`).

## Global Constraints

- **NO GIT COMMANDS.** No commit/add/push/reset/checkout/stash. Leave all changes uncommitted. (Overrides the prior plan's commit steps — do NOT run them.)
- Generator/emitter changes ONLY in `/Users/umerhassan/lutaml/metaschema-worktrees/fix-kv-scalar` (branch `fix/key-value-scalar-fields`). DO NOT touch `/Users/umerhassan/lutaml/metaschema`.
- DO NOT modify the SHARED `Metaschema::*` markup type definitions (`lib/metaschema/inline_markup_type.rb`, `anchor_type.rb`, `code_type.rb`, `image_type.rb`, `insert_type.rb`, `namespace.rb`). The OSCAL namespace is applied only to NEWLY EMITTED OSCAL-local copies.
- `oscal/lib/oscal/v1_2_1/all_models.rb` is GENERATED. Never hand-edit; regenerate via `cd /Users/umerhassan/lutaml/oscal && bundle exec rake 'oscal:generate[1.2.1]'` (quote the brackets).
- Leave oscal's `Gemfile` path-pin to the worktree as-is.
- Regeneration must be deterministic: two consecutive regens produce byte-identical `all_models.rb`.
- DO NOT run ad-hoc Ruby that loads the full oscal model set (`require "oscal"` + full serialize) — consumes ~11 GB and hangs. Verify via the bounded RSpec suite and tiny metaschema-only unit specs that build minimal hand-rolled classes and force-load shared types in this order before defining anonymous classes: `Metaschema::CodeType; Metaschema::AnchorType; Metaschema::InlineMarkupType` (there is a pre-existing circular-autoload ordering quirk; this order works).
- Do NOT re-skip/re-pend the 3 cross-format specs. The 3 pre-existing `pending` lines in `spec/cross_format_spec.rb` are out of scope; leave them.
- Memoize any anonymous test class in a `let` (calling a class-building method twice yields two different anonymous classes and lutaml raises `IncorrectModelError` on cross-class serialize).

## Verified Facts (from probes)

- `metaschema.namespace` returns the URI string `"http://csrc.nist.gov/ns/oscal/1.0"` (read from the metaschema `<namespace>` element). The generator already captures it: `@namespace = metaschema.namespace` (`lib/metaschema/model_generator.rb:51`) but never stores/exposes/uses it.
- lutaml-model `namespace` DSL (`lutaml/xml/mapping.rb:354`) accepts an `Lutaml::Xml::Namespace` subclass, `:inherit`, or `:blank`. A String URI RAISES. PROBED: `:inherit` produced `<p xmlns="">` (empty ns, WRONG) even when the document ROOT declared the default namespace — so `:inherit` does NOT pull the default ns down; it is not a viable shortcut. PROBED: per-element `map_element "em", namespace: ns` is EXPLICITLY REJECTED by lutaml-model (`IncorrectMappingArgumentsError`: "Namespaces must be declared on the MODEL CLASS itself"). CONCLUSION: the ONLY way to OSCAL-namespace markup elements (incl. recursively nested ones) is for the markup type CLASSES themselves to declare the OSCAL namespace. Since the shared `Metaschema::*` types are locked to `metaschema/1.0` and shared, OSCAL MUST get its own OSCAL-namespaced markup type classes (Task 3). This duplication is necessary, not incidental.
- A shared OSCAL `Namespace` class on both parent and an OSCAL-namespaced child produced the correct `<em>` with inherited default ns (byte-perfect `<p xmlns="...oscal/1.0">a <em>b</em> c</p>`).
- `Metaschema::Namespace < Lutaml::Xml::Namespace` (uri `metaschema/1.0`, `prefix_default "m"`) — the shape to mirror for OSCAL (uri `oscal/1.0`, `prefix_default nil`).
- The emitter builds the `xml do` block by introspecting `klass.mappings_for(:xml)` (`ruby_source_emitter.rb:353` `emit_xml_mapping`); it reads `@element_name`, `@mixed_content`, `@ordered`, `@content_mapping`, `@attributes`, `@elements`. It does NOT currently read namespace. The in-memory mapping exposes `@namespace_uri` / `@namespace_class` after `namespace <Class>` runs.
- Generated markup field classes currently reference shared types: `attribute :a, Metaschema::AnchorType` / `attribute :em, Metaschema::InlineMarkupType` etc. (`all_models.rb:12-22`), built by `field_factory.rb` `apply_markup_attributes`/`apply_markup_multiline_attributes` (lines 99-124).
- The `parameter` model (`spec/fixtures/oscal/src/metaschema/oscal_control-common_metaschema.xml:107`): children in order `assembly property`, `assembly link`, `define-field label` (markup-line), `define-field usage` (markup-multiline), `assembly constraint`, `assembly guideline`, `<choice>{ field value, assembly select }`. Generated Parameter XML mapping order is already `prop, link, label, usage, constraint, guideline, value, select, remarks` (correct) — so the param diff is namespace-driven, to be re-measured after Task 3.

## File Structure

Metaschema worktree (`/Users/umerhassan/lutaml/metaschema-worktrees/fix-kv-scalar`):
- Modify: `lib/metaschema/model_generator.rb` — expose the captured namespace URI via `attr_reader :namespace_uri` (set in `generate`).
- Modify: `lib/metaschema/ruby_source_emitter.rb` — emit an `<Module>::Namespace` class in the module header; emit `namespace <Module>::Namespace` inside each emitted assembly/field `xml do` block (keyed purely on `@generator.namespace_uri` — NO in-memory namespace class is built, avoiding a dual source of truth); emit OSCAL-local markup type classes (copies of the shared `Metaschema::*` markup types, OSCAL-namespaced) once per module, via a dedicated `emit_oscal_markup_types` method; remap markup type references to the local names in the emitted source.

Design decision (from review): the generated in-memory classes are NOT given a namespace, and assembly/field factories are NOT touched. Namespace emission is a pure emitter concern keyed on `@generator.namespace_uri`. This keeps the change isolated to the emitter + a one-line generator reader, and avoids building a throwaway runtime namespace class that would have to stay in sync with the emitted one.
- Test: `spec/ruby_source_emitter_spec.rb` — assert the module header emits a `Namespace` class with the OSCAL URI; assert generated `xml do` blocks include `namespace`.
- Test: `spec/markup_namespace_spec.rb` (new) — a bounded round-trip proving an OSCAL-namespaced parent + OSCAL-namespaced markup child preserves `<em>` in the OSCAL default namespace.

oscal repo (`/Users/umerhassan/lutaml/oscal`):
- Regenerate (do not hand-edit): `lib/oscal/v1_2_1/all_models.rb`.
- The cross-format specs (`spec/catalog_round_trip_spec.rb`, `component_definition_round_trip_spec.rb`, `ssp_round_trip_spec.rb`) are the acceptance gate — no new spec files needed unless a residual is isolated.

---

### Task 1: Expose the OSCAL namespace URI from the generator

**Files:**
- Modify: `/Users/umerhassan/lutaml/metaschema-worktrees/fix-kv-scalar/lib/metaschema/model_generator.rb` (`attr_reader` near line 43; `generate` near line 51)

**Interfaces:**
- Produces: `generator.namespace_uri -> String` (e.g. `"http://csrc.nist.gov/ns/oscal/1.0"`), consumed by AssemblyFactory, FieldFactory, and RubySourceEmitter.

- [ ] **Step 1: Expose the reader**

In `lib/metaschema/model_generator.rb`, change the shared-state reader line (currently `attr_reader :classes, :field_defs, :assembly_defs, :flag_defs`) to also expose the namespace:

```ruby
    attr_reader :classes, :field_defs, :assembly_defs, :flag_defs, :namespace_uri
```

In `generate`, change `@namespace = metaschema.namespace` to:

```ruby
      @namespace_uri = metaschema.namespace
```

Then update any later reference to `@namespace` in this file to `@namespace_uri` (grep first: `grep -n "@namespace\b" lib/metaschema/model_generator.rb`). If `@namespace` is unused elsewhere, this is the only change.

- [ ] **Step 2: Sanity check (no behavior change yet)**

Run: `cd /Users/umerhassan/lutaml/metaschema-worktrees/fix-kv-scalar && bundle exec rspec spec/ruby_source_emitter_spec.rb 2>&1 | tail -5`
Expected: same pass/fail as before this task (no regression). NO commit.

---

### Task 2: Emit an OSCAL `Namespace` class + namespace directive in generated `xml do` blocks

**Files:**
- Modify: `/Users/umerhassan/lutaml/metaschema-worktrees/fix-kv-scalar/lib/metaschema/ruby_source_emitter.rb` (`emit_module_header` ~268; `emit_xml_mapping` ~353)
- Test: `/Users/umerhassan/lutaml/metaschema-worktrees/fix-kv-scalar/spec/ruby_source_emitter_spec.rb`

**Interfaces:**
- Consumes: `@generator.namespace_uri` (Task 1).
- Produces: emitted module header contains `class Namespace < Lutaml::Xml::Namespace` with the OSCAL URI; every emitted assembly/field `xml do` block (that has an `element`) contains `namespace <Module>::Namespace`.

This is a PURE EMITTER change — no factory changes, no in-memory namespace class. `emit_module_header` emits the Namespace class when `@generator.namespace_uri` is present; `emit_xml_mapping` emits the `namespace` directive whenever the class has an `element` name AND `@generator.namespace_uri` is present (the OSCAL document default namespace applies to every named OSCAL element).

- [ ] **Step 1: Write the failing emitter test**

Add to `spec/ruby_source_emitter_spec.rb` (match how sibling examples instantiate the emitter — `described_class.new(classes, module_name, generator)`):

```ruby
  describe "OSCAL namespace emission" do
    let(:generator) do
      gen = Metaschema::ModelGenerator.new
      gen.instance_variable_set(:@namespace_uri, "http://csrc.nist.gov/ns/oscal/1.0")
      gen
    end
    let(:emitter) { described_class.new({}, "Oscal::V1_2_1", generator) }

    it "emits a Namespace class with the OSCAL URI in the module header" do
      header = emitter.send(:emit_module_header)
      expect(header).to include("class Namespace < Lutaml::Xml::Namespace")
      expect(header).to include('uri "http://csrc.nist.gov/ns/oscal/1.0"')
    end
  end
```

- [ ] **Step 2: Run to verify it fails**

Run: `cd /Users/umerhassan/lutaml/metaschema-worktrees/fix-kv-scalar && bundle exec rspec spec/ruby_source_emitter_spec.rb -e "OSCAL namespace emission"`
Expected: FAIL (header has no Namespace class).

- [ ] **Step 3: Emit the Namespace class in the module header**

In `ruby_source_emitter.rb` `emit_module_header`, after the `class Base` block and before the closing of the heredoc, append a Namespace class. Replace the method body:

```ruby
    def emit_module_header
      register_id = derive_register_id
      ns = @generator&.namespace_uri
      ns_class = if ns && !ns.empty?
                   <<~NS
                       class Namespace < Lutaml::Xml::Namespace
                         uri "#{ns}"
                         prefix_default nil
                       end
                   NS
                 else
                   ""
                 end
      <<~RUBY
        # frozen_string_literal: true

        module #{@module_name}
          class Base < Lutaml::Model::Serializable
            def self.lutaml_default_register
              :#{register_id}
            end
          end
        #{ns_class}      end
      RUBY
    end
```

(Indentation: the `#{ns_class}` interpolation lands at the module body indent. Verify the emitted text with `ruby -c` later; adjust spacing so the file parses. Keep it deterministic — no hash iteration.)

- [ ] **Step 4: Run to verify the header test passes**

Run: `cd /Users/umerhassan/lutaml/metaschema-worktrees/fix-kv-scalar && bundle exec rspec spec/ruby_source_emitter_spec.rb -e "OSCAL namespace emission"`
Expected: PASS.

- [ ] **Step 5: Emit `namespace` in `emit_xml_mapping`**

In `ruby_source_emitter.rb` `emit_xml_mapping`, after emitting `element` (the `lines << "      element ..."` at ~366) and before `mixed_content`, emit the directive when the class has an element AND the generator has a namespace:

```ruby
      ns = @generator&.namespace_uri
      if element_name && ns && !ns.empty?
        lines << "      namespace #{@module_name}::Namespace"
      end
```

(`element_name` is already read just above. Keyed on `@generator.namespace_uri` — no in-memory namespace state needed. Only elements with a `root`/`element` name get a namespace; type-only mappings without an element do not.)

- [ ] **Step 6: Add a failing test for per-class namespace emission**

Add to `spec/ruby_source_emitter_spec.rb`, under the existing `describe "OSCAL namespace emission"`:

```ruby
    it "emits a namespace directive for a class with an element" do
      klass = Class.new(Lutaml::Model::Serializable) do
        attribute :content, :string
        xml { element "thing"; map_content to: :content }
      end
      joined = emitter.send(:emit_xml_mapping, klass).join("\n")
      expect(joined).to include("namespace Oscal::V1_2_1::Namespace")
    end
```

Run: `cd /Users/umerhassan/lutaml/metaschema-worktrees/fix-kv-scalar && bundle exec rspec spec/ruby_source_emitter_spec.rb -e "OSCAL namespace emission"`
Expected: PASS after Step 5.

- [ ] **Step 7: Run emitter specs for regressions**

Run: `cd /Users/umerhassan/lutaml/metaschema-worktrees/fix-kv-scalar && bundle exec rspec spec/ruby_source_emitter_spec.rb 2>&1 | tail -8`
Expected: 0 failures (existing examples may need updating only if they assert exact header text — update them to allow the Namespace class). NO commit.

---

### Task 3: Emit OSCAL-local markup types (OSCAL-namespaced) and reference them from generated fields

**Files:**
- Modify: `/Users/umerhassan/lutaml/metaschema-worktrees/fix-kv-scalar/lib/metaschema/ruby_source_emitter.rb` (emit OSCAL-local markup classes once per module via `emit_oscal_markup_types`; remap markup type references in `emit_attribute`/type-reference logic)
- Test: `/Users/umerhassan/lutaml/metaschema-worktrees/fix-kv-scalar/spec/markup_namespace_spec.rb` (new)

**Interfaces:**
- Consumes: `@generator.namespace_uri`; `@module_name` for emitted refs.
- Produces: generated module defines `InlineMarkupType`, `AnchorType`, `CodeType`, `ImageType`, `InsertType` (OSCAL-namespaced) and generated markup fields reference `<Module>::InlineMarkupType` etc. The shared `Metaschema::*` types are unchanged. `field_factory.rb` is NOT touched — the in-memory classes keep referencing `Metaschema::*`; only the EMITTED SOURCE remaps to local names.

DESIGN NOTE (from review + implementation): This duplication is NECESSARY, not incidental — probes proved lutaml-model forbids per-element namespaces and `:inherit` blanks the namespace, so the only path is OSCAL-namespaced markup type classes. SCOPE CORRECTION (found during impl): it is not just the 5 INLINE types — the multiline BLOCK types (`ListType`, `OrderedListType`, `ListItemType`, `PreformattedType`, `BlockQuoteType`, `TableType`, `TableRowType`, `TableCellType`) are also referenced by multiline fields (`usage`, `part` prose) and must ALSO be OSCAL-namespaced; otherwise multiline block elements stay in metaschema/1.0 AND a pre-existing circular-autoload quirk crashes loading. That is 13 shared types total.

CODE-JUDO (avoids a ~250-line data constant the review would reject): instead of hand-copying 13 verbatim bodies into the emitter source, `emit_oscal_markup_types` READS the 13 shared type source files at emit time, strips the `module Metaschema … end` wrapper and any `class X < …; end` forward-stub lines, swaps `namespace ::Metaschema::Namespace` → `namespace <Module>::Namespace`, and concatenates: first a block of forward-declaration stubs for all 13 names (so circular `attribute :x, SomeType` references resolve), then the transformed bodies (reopening). The shared type files remain the SINGLE SOURCE OF TRUTH — OSCAL gets a namespace-swapped projection of them, not a fork. Net new emitter code stays small; no giant constant. The 13 file paths are listed in a fixed-order array constant for determinism.

- [ ] **Step 1: Write the failing round-trip test (bounded, metaschema-only)**

Create `/Users/umerhassan/lutaml/metaschema-worktrees/fix-kv-scalar/spec/markup_namespace_spec.rb`:

```ruby
# frozen_string_literal: true

require "spec_helper"

RSpec.describe "OSCAL-namespaced markup round-trip" do
  before(:all) do
    Metaschema::CodeType
    Metaschema::AnchorType
    Metaschema::InlineMarkupType
  end

  let(:oscal_ns) do
    Class.new(Lutaml::Xml::Namespace) do
      uri "http://csrc.nist.gov/ns/oscal/1.0"
      prefix_default nil
    end
  end

  # An OSCAL-namespaced inline markup type (the kind Task 3 emits).
  let(:inline_type) do
    ns = oscal_ns
    Class.new(Lutaml::Model::Serializable) do
      attribute :content, :string, collection: true
      xml do
        element "inlineMarkupType"
        namespace ns
        mixed_content
        map_content to: :content
      end
    end
  end

  let(:parent_class) do
    ns = oscal_ns
    child = inline_type
    Class.new(Lutaml::Model::Serializable) do
      attribute :content, :string, collection: true
      attribute :em, child, collection: true
      xml do
        element "p"
        namespace ns
        mixed_content
        map_content to: :content
        map_element "em", to: :em
      end
    end
  end

  it "preserves <em> in the OSCAL default namespace" do
    src = %(<p xmlns="http://csrc.nist.gov/ns/oscal/1.0">a <em>b</em> c</p>)
    inst = parent_class.from_xml(src)
    out = parent_class.to_xml(inst).gsub(/\n\s*/, "")
    expect(out).to eq(src)
  end
end
```

- [ ] **Step 2: Run to verify it passes already (this proves the namespace MODEL works; it is a guard, not red→green)**

Run: `cd /Users/umerhassan/lutaml/metaschema-worktrees/fix-kv-scalar && bundle exec rspec spec/markup_namespace_spec.rb`
Expected: PASS (this validates the architecture the emitter must reproduce). If it FAILS, the namespace approach is wrong — STOP and re-probe before emitting anything.

- [ ] **Step 3: Read the shared markup types to mirror**

Read in full (no edits): `lib/metaschema/inline_markup_type.rb`, `lib/metaschema/anchor_type.rb`, `lib/metaschema/code_type.rb`, `lib/metaschema/image_type.rb`, `lib/metaschema/insert_type.rb`. These are the exact attribute + `xml do` shapes to reproduce as OSCAL-local copies.

- [ ] **Step 4: Emit OSCAL-local markup type classes via a template constant**

In `ruby_source_emitter.rb`, add a constant `OSCAL_MARKUP_TYPES_TEMPLATE` holding the 5 markup classes (Insert, Image, Anchor, Code, InlineMarkup — FIXED order for determinism) as a single heredoc, derived VERBATIM from Step 3's reads with exactly two mechanical edits per occurrence: (1) `namespace ::Metaschema::Namespace` → `namespace %{ns}`; (2) `Metaschema::InlineMarkupType`/`Metaschema::AnchorType`/`Metaschema::CodeType`/`Metaschema::ImageType`/`Metaschema::InsertType` self-references → the bare local names. Add a thin method:

```ruby
    def emit_oscal_markup_types
      ns = @generator&.namespace_uri
      return "" if ns.nil? || ns.empty?

      format(OSCAL_MARKUP_TYPES_TEMPLATE, ns: "#{@module_name}::Namespace")
    end
```

Call `emit_oscal_markup_types` once in `emit` right after `emit_module_header` (so the types precede classes that reference them) and once per `emit_split` file's header region. Do NOT invent attributes — reproduce each `attribute`/`map_*` line exactly.

- [ ] **Step 5: Remap markup type references in emitted source (emitter only)**

For the emitted field source to reference `<Module>::InlineMarkupType` instead of `Metaschema::InlineMarkupType`, find the emitter method that renders an attribute's type reference (grep `def emit_attribute` / `Metaschema::` / `type_ref` in `ruby_source_emitter.rb`). Add a single mapping step: when the attribute type is one of the 5 shared markup classes (`Metaschema::InlineMarkupType`, `AnchorType`, `CodeType`, `ImageType`, `InsertType`) AND `@generator.namespace_uri` is present, render the bare local name. Implement as a small lookup constant `SHARED_MARKUP_TYPE_LOCAL_NAMES = { Metaschema::InlineMarkupType => "InlineMarkupType", ... }` consulted at the start of the type-reference method — a data lookup, not scattered conditionals. `field_factory.rb` is NOT modified; the in-memory classes still reference `Metaschema::*`. Acceptance is the regenerated oscal suite (Task 4).

- [ ] **Step 6: Run metaschema unit specs for regressions**

Run: `cd /Users/umerhassan/lutaml/metaschema-worktrees/fix-kv-scalar && bundle exec rspec spec/markup_converter_spec.rb spec/markup_namespace_spec.rb spec/ruby_source_emitter_spec.rb 2>&1 | tail -8`
Expected: 0 failures. NO commit.

---

### Task 4: Regenerate oscal, verify determinism, measure namespace impact

**Files:**
- Regenerated: `/Users/umerhassan/lutaml/oscal/lib/oscal/v1_2_1/all_models.rb`

- [ ] **Step 1: Regenerate**

Run: `cd /Users/umerhassan/lutaml/oscal && bundle exec rake 'oscal:generate[1.2.1]' 2>&1 | tail -5`
Expected: `Created .../all_models.rb`, no error.

- [ ] **Step 2: Syntax + namespace presence check**

Run: `cd /Users/umerhassan/lutaml/oscal && ruby -c lib/oscal/v1_2_1/all_models.rb && grep -c "namespace Oscal::V1_2_1::Namespace" lib/oscal/v1_2_1/all_models.rb && grep -c "class Namespace < Lutaml::Xml::Namespace" lib/oscal/v1_2_1/all_models.rb`
Expected: `Syntax OK`, a large namespace count (one per assembly/field), and exactly `1` Namespace class.

- [ ] **Step 3: Determinism**

```bash
cd /Users/umerhassan/lutaml/oscal
cp lib/oscal/v1_2_1/all_models.rb /tmp/gen_a.rb
bundle exec rake 'oscal:generate[1.2.1]' >/dev/null 2>&1
diff -q /tmp/gen_a.rb lib/oscal/v1_2_1/all_models.rb && echo "DETERMINISTIC"
```
Expected: `DETERMINISTIC`. If not, sort the offending emission.

- [ ] **Step 4: Measure the catalog diff (namespace impact)**

Run: `cd /Users/umerhassan/lutaml/oscal && timeout 200 bundle exec rspec spec/catalog_round_trip_spec.rb 2>&1 | grep -E "^\s+Dimension:" | sort | uniq -c`
Expected: `namespace_declarations` count drops to 0 (or near 0); total diffs drop sharply from 104. Record the new counts. NO commit.

---

### Task 5: Resolve residual ordering (choice) ONLY if it remains, then full suite → 0 failures

**Files:**
- Possibly modify: `/Users/umerhassan/lutaml/metaschema-worktrees/fix-kv-scalar/lib/metaschema/choice_type.rb`, `grouped_choice_type.rb` (add `ordered` to their `xml do`) — ONLY if Task 4 leaves a `param` `label`/`select` ordering diff.
- Regenerate `all_models.rb` if the above changes.

- [ ] **Step 1: Re-run all three cross-format specs**

Run:
```bash
cd /Users/umerhassan/lutaml/oscal && timeout 300 bundle exec rspec \
  spec/catalog_round_trip_spec.rb \
  spec/component_definition_round_trip_spec.rb \
  spec/ssp_round_trip_spec.rb 2>&1 | tail -25
```
- If all 3 PASS → skip to Step 4.
- If failures remain, classify each residual via the catalog diff (`grep "Dimension:"`). For each remaining `element_structure`/`element_position` diff, identify the element (read the Location path).

- [ ] **Step 2: If a `<choice>` child ordering diff remains (e.g. `param`: select before label)**

Make `ChoiceType` and `GroupedChoiceType` `ordered` so per-instance child order is recorded on parse and replayed on `to_xml`. In `lib/metaschema/choice_type.rb` and `lib/metaschema/grouped_choice_type.rb`, add `ordered` (and `mixed_content` only if the type is text-bearing — check the existing block; choices are element-only, so `ordered` alone) inside the `xml do` block. Then verify the generator's `ordered_model_children` already threads choice position (it does — `:choice` is in the ordered walk). Re-run Task 4 Steps 1-3 (regenerate + determinism).

(Scope guard: touch ONLY `choice_type.rb`/`grouped_choice_type.rb` and ONLY add `ordered`. Do NOT restructure the choice mapping collectors. If adding `ordered` does not change the output or breaks parsing, REVERT it and instead report the precise residual — do not mask.)

- [ ] **Step 3: Re-run the three cross-format specs**

Run the Step 1 command again. Expected: all 3 PASS. If a TRUE residual is the Canon `attribute_nodes` library bug firing only during diff GENERATION after a real inequivalence, isolate the precise XML difference (dump `xml_final` vs `source_xml` for the smallest failing model and `diff` them directly) and report it precisely — do NOT mask, do NOT re-pend.

- [ ] **Step 4: Full oscal suite**

Run: `cd /Users/umerhassan/lutaml/oscal && timeout 500 bundle exec rspec 2>&1 | tail -12`
Expected: **0 failures**, 3 pending (the pre-existing cross_format_spec pendings). Capture the summary line + a passing cross-format snippet + proof `metadata.title` is a bare Markdown string in JSON (re-run `spec/markup_round_trip_spec.rb`). NO commit.

---

## Out of Scope (do NOT do)

- ANY git command (commit/add/push/reset/etc.). Leave everything uncommitted.
- Modifying the shared `Metaschema::*` markup type definitions or `Metaschema::Namespace`.
- Touching `/Users/umerhassan/lutaml/metaschema` (the non-worktree clone).
- Adding gem dependencies (commonmarker/kramdown).
- Hand-editing `all_models.rb`.
- Re-skipping/re-pending the 3 cross-format specs or the 3 `cross_format_spec.rb` pendings.
- Restructuring choice/choice-group mapping collectors beyond adding `ordered` to the choice types (Task 5 Step 2). If more is needed, report precisely instead of expanding scope.
- Speculative markup elements no fixture exercises (pre/table/blockquote) — only what the catalog/CD/SSP fixtures force.

## Self-Review Notes

- Namespace is the dominant cause (47 direct + most of 56 structure diffs are Canon failing to pair ns-mismatched nodes). Tasks 1-3 give every OSCAL element (assemblies, fields, AND markup inline/block children) one shared OSCAL `Namespace` class — proven by the Task 3 Step 2 probe to produce byte-identical inline round-trips.
- The shared `Metaschema::*` types are NEVER modified — OSCAL gets its own emitted copies — so the metaschema gem's own specs and parsing are untouched (constraint satisfied).
- Choice ordering is gated behind a re-measure (Task 5 Step 1): the param mapping order is already correct, so it likely resolves once namespaces match. Only if a genuine diff remains do we add `ordered` to the choice types — the minimal possible change.
- Determinism: emitted Namespace class + markup types + per-class `namespace` line are fixed strings in fixed order; no unsorted hash iteration introduced. Task 4 Step 3 diffs two regens.
- Risk: lutaml-model mapping inheritance across namespaces is unreliable, so OSCAL-local markup types RE-DECLARE their mappings (Task 3 Step 4) rather than subclassing-and-tweaking. Verified pattern matches `lib/metaschema/inline_markup_type.rb`.
- If Task 3 Step 2's probe fails, the whole namespace strategy is invalid — the plan STOPS there and re-probes rather than emitting broken code.

### Thermo-Nuclear Review resolutions (plan reviewed before implementation)

- **[HIGH] "Task 3 duplicates intricate markup types — find a judo move to delete it."** RESOLVED by direct probing, NOT by hand-waving: (a) `:inherit` produces `xmlns=""` even under an OSCAL-rooted document; (b) lutaml-model EXPLICITLY rejects per-element `namespace:` ("must be declared on the MODEL CLASS"). Therefore OSCAL-namespaced markup type classes are the ONLY viable mechanism — the duplication is necessary. Contained to ONE template constant + one thin `format` method (no new control flow) and a fixed-order emission for determinism.
- **[MEDIUM] "`ruby_source_emitter.rb` already >1k lines; don't sprawl it."** RESOLVED: markup-type source lives in a single data constant; the added METHODS are thin (`emit_oscal_markup_types`, a lookup constant for remapping). No factory changes. Net new logic in the emitter is ~15 lines of code + one data template.
- **[MEDIUM] "dual namespace source of truth (in-memory class + emitted class)."** RESOLVED: Task 2 was rewritten to be EMITTER-ONLY, keyed on `@generator.namespace_uri`. No in-memory namespace class is built; `assembly_factory.rb`/`field_factory.rb` are NOT touched. Single source of truth = the emitter.
