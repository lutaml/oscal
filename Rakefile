# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

namespace :oscal do
  desc "Generate pre-built Ruby source for OSCAL models"
  task :generate, [:version] do |_t, args|
    require "metaschema"

    version = args[:version] || "1.2.1"
    version_module = "V#{version.gsub('.', '_')}"
    version_dir = File.join(__dir__, "lib", "oscal", "v#{version.gsub('.', '_')}")

    puts "Generating OSCAL #{version}..."
    puts "  Module: Oscal::#{version_module}"
    puts "  Output: #{version_dir}/"

    # Find the metaschema
    metaschema_dir = if File.exist?(File.join(__dir__, "spec", "fixtures", "oscal", "src", "metaschema"))
      File.join(__dir__, "spec", "fixtures", "oscal", "src", "metaschema")
    else
      File.join(__dir__, "..", "metaschema", "spec", "fixtures", "oscal", "src", "metaschema")
    end
    complete_path = File.join(metaschema_dir, "oscal_complete_metaschema.xml")

    unless File.exist?(complete_path)
      abort "Metaschema not found at #{complete_path}. Ensure the OSCAL submodule is initialized."
    end

    files = Metaschema::ModelGenerator.to_ruby_source(
      complete_path,
      module_name: "Oscal::#{version_module}"
    )

    FileUtils.mkdir_p(version_dir)
    files.each do |name, source|
      path = File.join(version_dir, name)
      File.write(path, source)
      puts "  Created #{path}"
    end

    puts "Done! Generated #{files.size} files."
  end
end

task default: :spec
