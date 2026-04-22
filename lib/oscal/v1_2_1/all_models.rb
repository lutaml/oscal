# frozen_string_literal: true

module Oscal::V1_2_1
  class Base < Lutaml::Model::Serializable
    def self.lutaml_default_register
      :oscal_1_2_1
    end
  end

  class MetadataTitle < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "title"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class MetadataRevision < Base
    attribute :published, :published
    attribute :last_modified, :last_modified
    attribute :version, :version
    attribute :oscal_version, :oscal_version
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :title, :string

    xml do
      element "revision"
      ordered
      map_element "published", to: :published
      map_element "last-modified", to: :last_modified
      map_element "version", to: :version
      map_element "oscal-version", to: :oscal_version
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "title", to: :title
    end

    key_value do
      map "published", to: :published, with: { to: :json_to_published_published, from: :json_from_published_published }
      map "last-modified", to: :last_modified, with: { to: :json_to_last_modified_last_modified, from: :json_from_last_modified_last_modified }
      map "version", to: :version, with: { to: :json_to_version_version, from: :json_from_version_version }
      map "oscal-version", to: :oscal_version, with: { to: :json_to_oscal_version_oscal_version, from: :json_from_oscal_version_oscal_version }
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "title", to: :title, render_empty: true
      map "props", to: :property, with: { to: :json_to_asm_property_props }
      map "links", to: :link, with: { to: :json_to_asm_link_links }
    end

    def json_from_published_published(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Published.of_json(v) }
        instance.instance_variable_set(:@published, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Published.new(content: "")
          instance.instance_variable_set(:@published, inst)
        else
          instance.instance_variable_set(:@published, Oscal::V1_2_1::Published.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@published, Oscal::V1_2_1::Published.of_json(value))
      end
    end

    def json_to_published_published(instance, doc)
      current = instance.instance_variable_get(:@published)
      if current.is_a?(Array)
        doc["published"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["published"] = Oscal::V1_2_1::Published.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["published"] = val
        end
      end
    end

    def json_from_last_modified_last_modified(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::LastModified.of_json(v) }
        instance.instance_variable_set(:@last_modified, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::LastModified.new(content: "")
          instance.instance_variable_set(:@last_modified, inst)
        else
          instance.instance_variable_set(:@last_modified, Oscal::V1_2_1::LastModified.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@last_modified, Oscal::V1_2_1::LastModified.of_json(value))
      end
    end

    def json_to_last_modified_last_modified(instance, doc)
      current = instance.instance_variable_get(:@last_modified)
      if current.is_a?(Array)
        doc["last-modified"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["last-modified"] = Oscal::V1_2_1::LastModified.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["last-modified"] = val
        end
      end
    end

    def json_from_version_version(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Version.of_json(v) }
        instance.instance_variable_set(:@version, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Version.new(content: "")
          instance.instance_variable_set(:@version, inst)
        else
          instance.instance_variable_set(:@version, Oscal::V1_2_1::Version.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@version, Oscal::V1_2_1::Version.of_json(value))
      end
    end

    def json_to_version_version(instance, doc)
      current = instance.instance_variable_get(:@version)
      if current.is_a?(Array)
        doc["version"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["version"] = Oscal::V1_2_1::Version.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["version"] = val
        end
      end
    end

    def json_from_oscal_version_oscal_version(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::OscalVersion.of_json(v) }
        instance.instance_variable_set(:@oscal_version, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::OscalVersion.new(content: "")
          instance.instance_variable_set(:@oscal_version, inst)
        else
          instance.instance_variable_set(:@oscal_version, Oscal::V1_2_1::OscalVersion.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@oscal_version, Oscal::V1_2_1::OscalVersion.of_json(value))
      end
    end

    def json_to_oscal_version_oscal_version(instance, doc)
      current = instance.instance_variable_get(:@oscal_version)
      if current.is_a?(Array)
        doc["oscal-version"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["oscal-version"] = Oscal::V1_2_1::OscalVersion.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["oscal-version"] = val
        end
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_to_asm_property_props(instance, doc)
      current = instance.instance_variable_get(:@property)
      if current.is_a?(Array)
        doc["props"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["props"] = Oscal::V1_2_1::Property.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["props"] = val
        end
      end
    end

    def json_to_asm_link_links(instance, doc)
      current = instance.instance_variable_get(:@link)
      if current.is_a?(Array)
        doc["links"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["links"] = Oscal::V1_2_1::Link.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["links"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class MetadataRole < Base
    attribute :id, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :title, :string
    attribute :short_name, :string
    attribute :description, :string

    xml do
      element "role"
      ordered
      map_attribute "id", to: :id
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "title", to: :title
      map_element "short-name", to: :short_name
      map_element "description", to: :description
    end

    key_value do
      map "id", to: :id
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "title", to: :title, render_empty: true
      map "short-name", to: :short_name, render_empty: true
      map "description", to: :description, render_empty: true
      map "props", to: :property, with: { to: :json_to_asm_property_props }
      map "links", to: :link, with: { to: :json_to_asm_link_links }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_to_asm_property_props(instance, doc)
      current = instance.instance_variable_get(:@property)
      if current.is_a?(Array)
        doc["props"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["props"] = Oscal::V1_2_1::Property.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["props"] = val
        end
      end
    end

    def json_to_asm_link_links(instance, doc)
      current = instance.instance_variable_get(:@link)
      if current.is_a?(Array)
        doc["links"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["links"] = Oscal::V1_2_1::Link.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["links"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class MetadataLocation < Base
    attribute :uuid, :string
    attribute :email_address, :email_address, collection: true
    attribute :telephone_number, :telephone_number, collection: true
    attribute :remarks, :remarks
    attribute :address, :address
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :title, :string
    attribute :url, :string, collection: true

    xml do
      element "location"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "email-address", to: :email_address
      map_element "telephone-number", to: :telephone_number
      map_element "remarks", to: :remarks
      map_element "address", to: :address
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "title", to: :title
      map_element "url", to: :url
    end

    key_value do
      map "uuid", to: :uuid
      map "email-addresses", to: :email_address, with: { to: :json_to_email_address_email_addresses, from: :json_from_email_address_email_addresses }
      map "telephone-numbers", to: :telephone_number, render_empty: true
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "title", to: :title, render_empty: true
      map "url", to: :url, render_empty: true
      map "address", to: :address, with: { to: :json_to_asm_address_address }
      map "props", to: :property, with: { to: :json_to_asm_property_props }
      map "links", to: :link, with: { to: :json_to_asm_link_links }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_to_asm_property_props(instance, doc)
      current = instance.instance_variable_get(:@property)
      if current.is_a?(Array)
        doc["props"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["props"] = Oscal::V1_2_1::Property.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["props"] = val
        end
      end
    end

    def json_to_asm_link_links(instance, doc)
      current = instance.instance_variable_get(:@link)
      if current.is_a?(Array)
        doc["links"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["links"] = Oscal::V1_2_1::Link.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["links"] = val
        end
      end
    end

    def json_from_email_address_email_addresses(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::EmailAddress.of_json(v) }
        instance.instance_variable_set(:@email_address, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::EmailAddress.new(content: "")
          instance.instance_variable_set(:@email_address, inst)
        else
          instance.instance_variable_set(:@email_address, Oscal::V1_2_1::EmailAddress.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@email_address, Oscal::V1_2_1::EmailAddress.of_json(value))
      end
    end

    def json_to_email_address_email_addresses(instance, doc)
      current = instance.instance_variable_get(:@email_address)
      if current.is_a?(Array)
        doc["email-addresses"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["email-addresses"] = Oscal::V1_2_1::EmailAddress.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["email-addresses"] = val
        end
      end
    end

    def json_to_asm_address_address(instance, doc)
      current = instance.instance_variable_get(:@address)
      if current.is_a?(Array)
        doc["address"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["address"] = Oscal::V1_2_1::Address.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["address"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class MetadataParty < Base
    attribute :uuid, :string
    attribute :type, :string
    attribute :email_address, :email_address, collection: true
    attribute :telephone_number, :telephone_number, collection: true
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :name, :string
    attribute :short_name, :string
    attribute :external_id, :external_id_in_metadata, collection: true
    attribute :member_of_organization, :string, collection: true
    attribute :address, :address, collection: true
    attribute :location_uuid, :location_uuid, collection: true

    xml do
      element "party"
      ordered
      map_attribute "uuid", to: :uuid
      map_attribute "type", to: :type
      map_element "email-address", to: :email_address
      map_element "telephone-number", to: :telephone_number
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "name", to: :name
      map_element "short-name", to: :short_name
      map_element "external-id", to: :external_id
      map_element "member-of-organization", to: :member_of_organization
      map_element "location-uuid", to: :location_uuid
      map_element "address", to: :address
    end

    key_value do
      map "uuid", to: :uuid
      map "type", to: :type
      map "email-addresses", to: :email_address, with: { to: :json_to_email_address_email_addresses, from: :json_from_email_address_email_addresses }
      map "telephone-numbers", to: :telephone_number, render_empty: true
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "name", to: :name, render_empty: true
      map "short-name", to: :short_name, render_empty: true
      map "external-id", to: :external_id, render_empty: true
      map "member-of-organization", to: :member_of_organization, render_empty: true
      map "location-uuids", to: :location_uuid, with: { to: :json_to_location_uuid_location_uuids, from: :json_from_location_uuid_location_uuids }
      map "props", to: :property, with: { to: :json_to_asm_property_props }
      map "links", to: :link, with: { to: :json_to_asm_link_links }
      map "addresses", to: :address, with: { to: :json_to_asm_address_addresses }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_to_asm_property_props(instance, doc)
      current = instance.instance_variable_get(:@property)
      if current.is_a?(Array)
        doc["props"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["props"] = Oscal::V1_2_1::Property.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["props"] = val
        end
      end
    end

    def json_to_asm_link_links(instance, doc)
      current = instance.instance_variable_get(:@link)
      if current.is_a?(Array)
        doc["links"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["links"] = Oscal::V1_2_1::Link.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["links"] = val
        end
      end
    end

    def json_from_email_address_email_addresses(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::EmailAddress.of_json(v) }
        instance.instance_variable_set(:@email_address, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::EmailAddress.new(content: "")
          instance.instance_variable_set(:@email_address, inst)
        else
          instance.instance_variable_set(:@email_address, Oscal::V1_2_1::EmailAddress.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@email_address, Oscal::V1_2_1::EmailAddress.of_json(value))
      end
    end

    def json_from_location_uuid_location_uuids(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::LocationUuid.of_json(v) }
        instance.instance_variable_set(:@location_uuid, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::LocationUuid.new(content: "")
          instance.instance_variable_set(:@location_uuid, inst)
        else
          instance.instance_variable_set(:@location_uuid, Oscal::V1_2_1::LocationUuid.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@location_uuid, Oscal::V1_2_1::LocationUuid.of_json(value))
      end
    end

    def json_to_email_address_email_addresses(instance, doc)
      current = instance.instance_variable_get(:@email_address)
      if current.is_a?(Array)
        doc["email-addresses"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["email-addresses"] = Oscal::V1_2_1::EmailAddress.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["email-addresses"] = val
        end
      end
    end

    def json_to_asm_address_addresses(instance, doc)
      current = instance.instance_variable_get(:@address)
      if current.is_a?(Array)
        doc["addresses"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["addresses"] = Oscal::V1_2_1::Address.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["addresses"] = val
        end
      end
    end

    def json_to_location_uuid_location_uuids(instance, doc)
      current = instance.instance_variable_get(:@location_uuid)
      if current.is_a?(Array)
        doc["location-uuids"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["location-uuids"] = Oscal::V1_2_1::LocationUuid.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["location-uuids"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class LinkText < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "text"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class BackMatterResource < Base
    attribute :uuid, :string
    attribute :document_id, :document_id, collection: true
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :title, :string
    attribute :description, :string
    attribute :base64, :base64_in_back_matter
    attribute :citation, :string
    attribute :rlink, :string, collection: true

    xml do
      element "resource"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "document-id", to: :document_id
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "title", to: :title
      map_element "description", to: :description
      map_element "base64", to: :base64
      map_element "citation", to: :citation
      map_element "rlink", to: :rlink
    end

    key_value do
      map "uuid", to: :uuid
      map "document-ids", to: :document_id, render_empty: true
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "title", to: :title, render_empty: true
      map "description", to: :description, render_empty: true
      map "base64", to: :base64, render_empty: true
      map "props", to: :property, with: { to: :json_to_asm_property_props }
      map "citation", to: :citation, with: { to: :json_to_asm_citation_citation }
      map "rlinks", to: :rlink, with: { to: :json_to_asm_rlink_rlinks }
    end

    def json_to_asm_citation_citation(instance, doc)
      current = instance.instance_variable_get(:@citation)
      if current.is_a?(Array)
        doc["citation"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        doc["citation"] = current.respond_to?(:content) ? current.content : current
      end
    end

    def json_to_asm_rlink_rlinks(instance, doc)
      current = instance.instance_variable_get(:@rlink)
      if current.is_a?(Array)
        doc["rlinks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        doc["rlinks"] = current.respond_to?(:content) ? current.content : current
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_to_asm_property_props(instance, doc)
      current = instance.instance_variable_get(:@property)
      if current.is_a?(Array)
        doc["props"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["props"] = Oscal::V1_2_1::Property.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["props"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class PartTitle < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "title"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class PartProse < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "prose"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class ParameterLabel < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "label"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class ParameterUsage < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "usage"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class ParameterConstraintDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class ParameterConstraintTest < Base
    attribute :remarks, :remarks
    attribute :expression, :string

    xml do
      element "test"
      ordered
      map_element "remarks", to: :remarks
      map_element "expression", to: :expression
    end

    key_value do
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "expression", to: :expression, render_empty: true
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class ParameterGuidelineProse < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "prose"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class ParameterSelectionChoice < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "choice"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class ControlTitle < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "title"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class GroupTitle < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "title"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class QualifierItemDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class MergeCombine < Base
    attribute :method_attr, :string

    xml do
      element "combine"
      ordered
      map_attribute "method", to: :method_attr
    end

    key_value do
      map "method", to: :method_attr
    end
  end
  class MergeFlat < Base

    xml do
      element "flat"
      ordered
    end
  end
  class MergeCustom < Base
    attribute :group, :group, collection: true
    attribute :insert_controls, :insert_controls, collection: true

    xml do
      element "custom"
      ordered
      map_element "group", to: :group
      map_element "insert-controls", to: :insert_controls
    end

    key_value do
      map "groups", to: :group, with: { to: :json_to_asm_group_groups }
      map "insert-controls", to: :insert_controls, with: { to: :json_to_asm_insert_controls_insert_controls }
    end

    def json_to_asm_group_groups(instance, doc)
      current = instance.instance_variable_get(:@group)
      if current.is_a?(Array)
        doc["groups"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["groups"] = Oscal::V1_2_1::Group.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["groups"] = val
        end
      end
    end

    def json_to_asm_insert_controls_insert_controls(instance, doc)
      current = instance.instance_variable_get(:@insert_controls)
      if current.is_a?(Array)
        doc["insert-controls"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["insert-controls"] = Oscal::V1_2_1::InsertControls.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["insert-controls"] = val
        end
      end
    end
  end
  class ModifySetParameter < Base
    attribute :param_id, :string
    attribute :class_attr, :string
    attribute :depends_on, :string
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :parameter_constraint, :parameter_constraint, collection: true
    attribute :parameter_guideline, :parameter_guideline, collection: true
    attribute :label, :string
    attribute :usage, :string
    attribute :parameter_selection, :parameter_selection
    attribute :parameter_value, :parameter_value, collection: true

    xml do
      element "set-parameter"
      ordered
      map_attribute "param-id", to: :param_id
      map_attribute "class", to: :class_attr
      map_attribute "depends-on", to: :depends_on
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "constraint", to: :parameter_constraint
      map_element "guideline", to: :parameter_guideline
      map_element "label", to: :label
      map_element "usage", to: :usage
      map_element "value", to: :parameter_value
      map_element "select", to: :parameter_selection
    end

    key_value do
      map "param-id", to: :param_id
      map "class", to: :class_attr
      map "depends-on", to: :depends_on
      map "label", to: :label, render_empty: true
      map "usage", to: :usage, render_empty: true
      map "values", to: :parameter_value, with: { to: :json_to_parameter_value_values, from: :json_from_parameter_value_values }
      map "props", to: :property, with: { to: :json_to_asm_property_props }
      map "links", to: :link, with: { to: :json_to_asm_link_links }
      map "constraints", to: :parameter_constraint, with: { to: :json_to_asm_parameter_constraint_constraints }
      map "guidelines", to: :parameter_guideline, with: { to: :json_to_asm_parameter_guideline_guidelines }
      map "select", to: :parameter_selection, with: { to: :json_to_asm_parameter_selection_select }
    end

    def json_to_asm_parameter_constraint_constraints(instance, doc)
      current = instance.instance_variable_get(:@parameter_constraint)
      if current.is_a?(Array)
        doc["constraints"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["constraints"] = Oscal::V1_2_1::ParameterConstraint.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["constraints"] = val
        end
      end
    end

    def json_to_asm_parameter_guideline_guidelines(instance, doc)
      current = instance.instance_variable_get(:@parameter_guideline)
      if current.is_a?(Array)
        doc["guidelines"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["guidelines"] = Oscal::V1_2_1::ParameterGuideline.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["guidelines"] = val
        end
      end
    end

    def json_to_asm_parameter_selection_select(instance, doc)
      current = instance.instance_variable_get(:@parameter_selection)
      if current.is_a?(Array)
        doc["select"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["select"] = Oscal::V1_2_1::ParameterSelection.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["select"] = val
        end
      end
    end

    def json_to_asm_property_props(instance, doc)
      current = instance.instance_variable_get(:@property)
      if current.is_a?(Array)
        doc["props"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["props"] = Oscal::V1_2_1::Property.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["props"] = val
        end
      end
    end

    def json_to_asm_link_links(instance, doc)
      current = instance.instance_variable_get(:@link)
      if current.is_a?(Array)
        doc["links"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["links"] = Oscal::V1_2_1::Link.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["links"] = val
        end
      end
    end

    def json_from_parameter_value_values(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::ParameterValue.of_json(v) }
        instance.instance_variable_set(:@parameter_value, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::ParameterValue.new(content: "")
          instance.instance_variable_set(:@parameter_value, inst)
        else
          instance.instance_variable_set(:@parameter_value, Oscal::V1_2_1::ParameterValue.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@parameter_value, Oscal::V1_2_1::ParameterValue.of_json(value))
      end
    end

    def json_to_parameter_value_values(instance, doc)
      current = instance.instance_variable_get(:@parameter_value)
      if current.is_a?(Array)
        doc["values"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["values"] = Oscal::V1_2_1::ParameterValue.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["values"] = val
        end
      end
    end
  end
  class ModifyAlter < Base
    attribute :control_id, :string
    attribute :remove, :string, collection: true
    attribute :add, :string, collection: true

    xml do
      element "alter"
      ordered
      map_attribute "control-id", to: :control_id
      map_element "remove", to: :remove
      map_element "add", to: :add
    end

    key_value do
      map "control-id", to: :control_id
      map "removes", to: :remove, with: { to: :json_to_asm_remove_removes }
      map "adds", to: :add, with: { to: :json_to_asm_add_adds }
    end

    def json_to_asm_remove_removes(instance, doc)
      current = instance.instance_variable_get(:@remove)
      if current.is_a?(Array)
        doc["removes"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        doc["removes"] = current.respond_to?(:content) ? current.content : current
      end
    end

    def json_to_asm_add_adds(instance, doc)
      current = instance.instance_variable_get(:@add)
      if current.is_a?(Array)
        doc["adds"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        doc["adds"] = current.respond_to?(:content) ? current.content : current
      end
    end
  end
  class SystemComponentTitle < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "title"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class SystemComponentDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class SystemComponentPurpose < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "purpose"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class SystemComponentStatus < Base
    attribute :state, :string
    attribute :remarks, :remarks

    xml do
      element "status"
      ordered
      map_attribute "state", to: :state
      map_element "remarks", to: :remarks
    end

    key_value do
      map "state", to: :state
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class ProtocolTitle < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "title"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class SystemUserTitle < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "title"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class SystemUserDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class AuthorizedPrivilegeTitle < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "title"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class AuthorizedPrivilegeDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class InventoryItemDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class InventoryItemImplementedComponent < Base
    attribute :component_uuid, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :responsible_party, :responsible_party, collection: true

    xml do
      element "implemented-component"
      ordered
      map_attribute "component-uuid", to: :component_uuid
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "responsible-party", to: :responsible_party
    end

    key_value do
      map "component-uuid", to: :component_uuid
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "props", to: :property, with: { to: :json_to_asm_property_props }
      map "links", to: :link, with: { to: :json_to_asm_link_links }
      map "responsible-parties", to: :responsible_party, with: { to: :json_to_asm_responsible_party_responsible_parties }
    end

    def json_to_asm_responsible_party_responsible_parties(instance, doc)
      current = instance.instance_variable_get(:@responsible_party)
      if current.is_a?(Array)
        doc["responsible-parties"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["responsible-parties"] = Oscal::V1_2_1::ResponsibleParty.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["responsible-parties"] = val
        end
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_to_asm_property_props(instance, doc)
      current = instance.instance_variable_get(:@property)
      if current.is_a?(Array)
        doc["props"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["props"] = Oscal::V1_2_1::Property.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["props"] = val
        end
      end
    end

    def json_to_asm_link_links(instance, doc)
      current = instance.instance_variable_get(:@link)
      if current.is_a?(Array)
        doc["links"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["links"] = Oscal::V1_2_1::Link.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["links"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class DefinedComponentTitle < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "title"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class DefinedComponentDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class DefinedComponentPurpose < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "purpose"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class CapabilityDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class ControlImplementationDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class IncorporatesComponentDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class ImplementedRequirementDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class StatementDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class SystemCharacteristicsDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class SystemImplementationLeveragedAuthorization < Base
    attribute :uuid, :string
    attribute :date_authorized, :date_authorized
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :title, :string
    attribute :party_uuid, :string

    xml do
      element "leveraged-authorization"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "date-authorized", to: :date_authorized
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "title", to: :title
      map_element "party-uuid", to: :party_uuid
    end

    key_value do
      map "uuid", to: :uuid
      map "date-authorized", to: :date_authorized, with: { to: :json_to_date_authorized_date_authorized, from: :json_from_date_authorized_date_authorized }
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "title", to: :title, render_empty: true
      map "party-uuid", to: :party_uuid, render_empty: true
      map "props", to: :property, with: { to: :json_to_asm_property_props }
      map "links", to: :link, with: { to: :json_to_asm_link_links }
    end

    def json_to_asm_property_props(instance, doc)
      current = instance.instance_variable_get(:@property)
      if current.is_a?(Array)
        doc["props"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["props"] = Oscal::V1_2_1::Property.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["props"] = val
        end
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_from_date_authorized_date_authorized(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::DateAuthorized.of_json(v) }
        instance.instance_variable_set(:@date_authorized, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::DateAuthorized.new(content: "")
          instance.instance_variable_set(:@date_authorized, inst)
        else
          instance.instance_variable_set(:@date_authorized, Oscal::V1_2_1::DateAuthorized.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@date_authorized, Oscal::V1_2_1::DateAuthorized.of_json(value))
      end
    end

    def json_to_date_authorized_date_authorized(instance, doc)
      current = instance.instance_variable_get(:@date_authorized)
      if current.is_a?(Array)
        doc["date-authorized"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["date-authorized"] = Oscal::V1_2_1::DateAuthorized.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["date-authorized"] = val
        end
      end
    end

    def json_to_asm_link_links(instance, doc)
      current = instance.instance_variable_get(:@link)
      if current.is_a?(Array)
        doc["links"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["links"] = Oscal::V1_2_1::Link.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["links"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class SystemInformationInformationType < Base
    attribute :uuid, :string
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :impact, :impact
    attribute :title, :string
    attribute :description, :string
    attribute :categorization, :string, collection: true

    xml do
      element "information-type"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "confidentiality-impact", to: :impact
      map_element "integrity-impact", to: :impact
      map_element "availability-impact", to: :impact
      map_element "title", to: :title
      map_element "description", to: :description
      map_element "categorization", to: :categorization
    end

    key_value do
      map "uuid", to: :uuid
      map "title", to: :title, render_empty: true
      map "description", to: :description, render_empty: true
      map "props", to: :property, with: { to: :json_to_asm_property_props }
      map "links", to: :link, with: { to: :json_to_asm_link_links }
      map "confidentiality-impact", to: :impact, with: { to: :json_to_asm_impact_confidentiality_impact }
      map "integrity-impact", to: :impact, with: { to: :json_to_asm_impact_integrity_impact }
      map "availability-impact", to: :impact, with: { to: :json_to_asm_impact_availability_impact }
      map "categorizations", to: :categorization, with: { to: :json_to_asm_categorization_categorizations }
    end

    def json_to_asm_impact_confidentiality_impact(instance, doc)
      current = instance.instance_variable_get(:@impact)
      if current.is_a?(Array)
        doc["confidentiality-impact"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["confidentiality-impact"] = Oscal::V1_2_1::Impact.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["confidentiality-impact"] = val
        end
      end
    end

    def json_to_asm_impact_integrity_impact(instance, doc)
      current = instance.instance_variable_get(:@impact)
      if current.is_a?(Array)
        doc["integrity-impact"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["integrity-impact"] = Oscal::V1_2_1::Impact.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["integrity-impact"] = val
        end
      end
    end

    def json_to_asm_impact_availability_impact(instance, doc)
      current = instance.instance_variable_get(:@impact)
      if current.is_a?(Array)
        doc["availability-impact"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["availability-impact"] = Oscal::V1_2_1::Impact.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["availability-impact"] = val
        end
      end
    end

    def json_to_asm_categorization_categorizations(instance, doc)
      current = instance.instance_variable_get(:@categorization)
      if current.is_a?(Array)
        doc["categorizations"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        doc["categorizations"] = current.respond_to?(:content) ? current.content : current
      end
    end

    def json_to_asm_property_props(instance, doc)
      current = instance.instance_variable_get(:@property)
      if current.is_a?(Array)
        doc["props"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["props"] = Oscal::V1_2_1::Property.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["props"] = val
        end
      end
    end

    def json_to_asm_link_links(instance, doc)
      current = instance.instance_variable_get(:@link)
      if current.is_a?(Array)
        doc["links"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["links"] = Oscal::V1_2_1::Link.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["links"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class AuthorizationBoundaryDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class NetworkArchitectureDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class DataFlowDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class DiagramDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class DiagramCaption < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "caption"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class ByComponentDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class ByComponentExport < Base
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :description, :string
    attribute :provided, :string, collection: true
    attribute :responsibility, :string, collection: true

    xml do
      element "export"
      ordered
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "description", to: :description
      map_element "provided", to: :provided
      map_element "responsibility", to: :responsibility
    end

    key_value do
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "description", to: :description, render_empty: true
      map "props", to: :property, with: { to: :json_to_asm_property_props }
      map "links", to: :link, with: { to: :json_to_asm_link_links }
      map "provided", to: :provided, with: { to: :json_to_asm_provided_provided }
      map "responsibilities", to: :responsibility, with: { to: :json_to_asm_responsibility_responsibilities }
    end

    def json_to_asm_provided_provided(instance, doc)
      current = instance.instance_variable_get(:@provided)
      if current.is_a?(Array)
        doc["provided"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        doc["provided"] = current.respond_to?(:content) ? current.content : current
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_to_asm_property_props(instance, doc)
      current = instance.instance_variable_get(:@property)
      if current.is_a?(Array)
        doc["props"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["props"] = Oscal::V1_2_1::Property.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["props"] = val
        end
      end
    end

    def json_to_asm_link_links(instance, doc)
      current = instance.instance_variable_get(:@link)
      if current.is_a?(Array)
        doc["links"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["links"] = Oscal::V1_2_1::Link.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["links"] = val
        end
      end
    end

    def json_to_asm_responsibility_responsibilities(instance, doc)
      current = instance.instance_variable_get(:@responsibility)
      if current.is_a?(Array)
        doc["responsibilities"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        doc["responsibilities"] = current.respond_to?(:content) ? current.content : current
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class ByComponentInherited < Base
    attribute :uuid, :string
    attribute :provided_uuid, :string
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :responsible_role, :responsible_role, collection: true
    attribute :description, :string

    xml do
      element "inherited"
      ordered
      map_attribute "uuid", to: :uuid
      map_attribute "provided-uuid", to: :provided_uuid
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "responsible-role", to: :responsible_role
      map_element "description", to: :description
    end

    key_value do
      map "uuid", to: :uuid
      map "provided-uuid", to: :provided_uuid
      map "description", to: :description, render_empty: true
      map "props", to: :property, with: { to: :json_to_asm_property_props }
      map "links", to: :link, with: { to: :json_to_asm_link_links }
      map "responsible-roles", to: :responsible_role, with: { to: :json_to_asm_responsible_role_responsible_roles }
    end

    def json_to_asm_responsible_role_responsible_roles(instance, doc)
      current = instance.instance_variable_get(:@responsible_role)
      if current.is_a?(Array)
        doc["responsible-roles"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["responsible-roles"] = Oscal::V1_2_1::ResponsibleRole.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["responsible-roles"] = val
        end
      end
    end

    def json_to_asm_property_props(instance, doc)
      current = instance.instance_variable_get(:@property)
      if current.is_a?(Array)
        doc["props"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["props"] = Oscal::V1_2_1::Property.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["props"] = val
        end
      end
    end

    def json_to_asm_link_links(instance, doc)
      current = instance.instance_variable_get(:@link)
      if current.is_a?(Array)
        doc["links"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["links"] = Oscal::V1_2_1::Link.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["links"] = val
        end
      end
    end
  end
  class ByComponentSatisfied < Base
    attribute :uuid, :string
    attribute :responsibility_uuid, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :responsible_role, :responsible_role, collection: true
    attribute :description, :string

    xml do
      element "satisfied"
      ordered
      map_attribute "uuid", to: :uuid
      map_attribute "responsibility-uuid", to: :responsibility_uuid
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "responsible-role", to: :responsible_role
      map_element "description", to: :description
    end

    key_value do
      map "uuid", to: :uuid
      map "responsibility-uuid", to: :responsibility_uuid
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "description", to: :description, render_empty: true
      map "props", to: :property, with: { to: :json_to_asm_property_props }
      map "links", to: :link, with: { to: :json_to_asm_link_links }
      map "responsible-roles", to: :responsible_role, with: { to: :json_to_asm_responsible_role_responsible_roles }
    end

    def json_to_asm_responsible_role_responsible_roles(instance, doc)
      current = instance.instance_variable_get(:@responsible_role)
      if current.is_a?(Array)
        doc["responsible-roles"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["responsible-roles"] = Oscal::V1_2_1::ResponsibleRole.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["responsible-roles"] = val
        end
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_to_asm_property_props(instance, doc)
      current = instance.instance_variable_get(:@property)
      if current.is_a?(Array)
        doc["props"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["props"] = Oscal::V1_2_1::Property.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["props"] = val
        end
      end
    end

    def json_to_asm_link_links(instance, doc)
      current = instance.instance_variable_get(:@link)
      if current.is_a?(Array)
        doc["links"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["links"] = Oscal::V1_2_1::Link.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["links"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class LocalObjectiveDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class AssessmentMethodDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class AssessmentPartTitle < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "title"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class AssessmentPartProse < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "prose"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class ActivityTitle < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "title"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class ActivityDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class ActivityStep < Base
    attribute :uuid, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :reviewed_controls, :reviewed_controls
    attribute :responsible_role, :responsible_role, collection: true
    attribute :title, :string
    attribute :description, :string

    xml do
      element "step"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "reviewed-controls", to: :reviewed_controls
      map_element "responsible-role", to: :responsible_role
      map_element "title", to: :title
      map_element "description", to: :description
    end

    key_value do
      map "uuid", to: :uuid
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "title", to: :title, render_empty: true
      map "description", to: :description, render_empty: true
      map "props", to: :property, with: { to: :json_to_asm_property_props }
      map "links", to: :link, with: { to: :json_to_asm_link_links }
      map "reviewed-controls", to: :reviewed_controls, with: { to: :json_to_asm_reviewed_controls_reviewed_controls }
      map "responsible-roles", to: :responsible_role, with: { to: :json_to_asm_responsible_role_responsible_roles }
    end

    def json_to_asm_reviewed_controls_reviewed_controls(instance, doc)
      current = instance.instance_variable_get(:@reviewed_controls)
      if current.is_a?(Array)
        doc["reviewed-controls"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["reviewed-controls"] = Oscal::V1_2_1::ReviewedControls.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["reviewed-controls"] = val
        end
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_to_asm_property_props(instance, doc)
      current = instance.instance_variable_get(:@property)
      if current.is_a?(Array)
        doc["props"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["props"] = Oscal::V1_2_1::Property.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["props"] = val
        end
      end
    end

    def json_to_asm_link_links(instance, doc)
      current = instance.instance_variable_get(:@link)
      if current.is_a?(Array)
        doc["links"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["links"] = Oscal::V1_2_1::Link.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["links"] = val
        end
      end
    end

    def json_to_asm_responsible_role_responsible_roles(instance, doc)
      current = instance.instance_variable_get(:@responsible_role)
      if current.is_a?(Array)
        doc["responsible-roles"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["responsible-roles"] = Oscal::V1_2_1::ResponsibleRole.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["responsible-roles"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class ReviewedControlsDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class ReviewedControlsControlSelection < Base
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :select_control_by_id, :select_control_by_id, collection: true
    attribute :description, :string
    attribute :include_all, :include_all

    xml do
      element "control-selection"
      ordered
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "exclude-control", to: :select_control_by_id
      map_element "description", to: :description
      map_element "include-all", to: :include_all
      map_element "include-control", to: :select_control_by_id
    end

    key_value do
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "description", to: :description, render_empty: true
      map "props", to: :property, with: { to: :json_to_asm_property_props }
      map "links", to: :link, with: { to: :json_to_asm_link_links }
      map "exclude-controls", to: :select_control_by_id, with: { to: :json_to_asm_select_control_by_id_exclude_controls }
      map "include-all", to: :include_all, with: { to: :json_to_asm_include_all_include_all }
      map "include-controls", to: :select_control_by_id, with: { to: :json_to_asm_select_control_by_id_include_controls }
    end

    def json_to_asm_select_control_by_id_exclude_controls(instance, doc)
      current = instance.instance_variable_get(:@select_control_by_id)
      if current.is_a?(Array)
        doc["exclude-controls"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["exclude-controls"] = Oscal::V1_2_1::SelectControlById.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["exclude-controls"] = val
        end
      end
    end

    def json_to_asm_select_control_by_id_include_controls(instance, doc)
      current = instance.instance_variable_get(:@select_control_by_id)
      if current.is_a?(Array)
        doc["include-controls"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["include-controls"] = Oscal::V1_2_1::SelectControlById.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["include-controls"] = val
        end
      end
    end

    def json_to_asm_include_all_include_all(instance, doc)
      current = instance.instance_variable_get(:@include_all)
      if current.is_a?(Array)
        doc["include-all"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["include-all"] = Oscal::V1_2_1::IncludeAll.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["include-all"] = val
        end
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_to_asm_property_props(instance, doc)
      current = instance.instance_variable_get(:@property)
      if current.is_a?(Array)
        doc["props"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["props"] = Oscal::V1_2_1::Property.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["props"] = val
        end
      end
    end

    def json_to_asm_link_links(instance, doc)
      current = instance.instance_variable_get(:@link)
      if current.is_a?(Array)
        doc["links"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["links"] = Oscal::V1_2_1::Link.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["links"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class ReviewedControlsControlObjectiveSelection < Base
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :select_objective_by_id, :select_objective_by_id, collection: true
    attribute :description, :string
    attribute :include_all, :include_all

    xml do
      element "control-objective-selection"
      ordered
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "exclude-objective", to: :select_objective_by_id
      map_element "description", to: :description
      map_element "include-all", to: :include_all
      map_element "include-objective", to: :select_objective_by_id
    end

    key_value do
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "description", to: :description, render_empty: true
      map "props", to: :property, with: { to: :json_to_asm_property_props }
      map "links", to: :link, with: { to: :json_to_asm_link_links }
      map "exclude-objectives", to: :select_objective_by_id, with: { to: :json_to_asm_select_objective_by_id_exclude_objectives }
      map "include-all", to: :include_all, with: { to: :json_to_asm_include_all_include_all }
      map "include-objectives", to: :select_objective_by_id, with: { to: :json_to_asm_select_objective_by_id_include_objectives }
    end

    def json_to_asm_include_all_include_all(instance, doc)
      current = instance.instance_variable_get(:@include_all)
      if current.is_a?(Array)
        doc["include-all"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["include-all"] = Oscal::V1_2_1::IncludeAll.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["include-all"] = val
        end
      end
    end

    def json_to_asm_select_objective_by_id_exclude_objectives(instance, doc)
      current = instance.instance_variable_get(:@select_objective_by_id)
      if current.is_a?(Array)
        doc["exclude-objectives"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["exclude-objectives"] = Oscal::V1_2_1::SelectObjectiveById.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["exclude-objectives"] = val
        end
      end
    end

    def json_to_asm_select_objective_by_id_include_objectives(instance, doc)
      current = instance.instance_variable_get(:@select_objective_by_id)
      if current.is_a?(Array)
        doc["include-objectives"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["include-objectives"] = Oscal::V1_2_1::SelectObjectiveById.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["include-objectives"] = val
        end
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_to_asm_property_props(instance, doc)
      current = instance.instance_variable_get(:@property)
      if current.is_a?(Array)
        doc["props"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["props"] = Oscal::V1_2_1::Property.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["props"] = val
        end
      end
    end

    def json_to_asm_link_links(instance, doc)
      current = instance.instance_variable_get(:@link)
      if current.is_a?(Array)
        doc["links"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["links"] = Oscal::V1_2_1::Link.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["links"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class TaskTitle < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "title"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class TaskDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class TaskTiming < Base
    attribute :on_date, :string
    attribute :within_date_range, :string
    attribute :at_frequency, :string

    xml do
      element "timing"
      ordered
      map_element "on-date", to: :on_date
      map_element "within-date-range", to: :within_date_range
      map_element "at-frequency", to: :at_frequency
    end

    key_value do
      map "on-date", to: :on_date, with: { to: :json_to_asm_on_date_on_date }
      map "within-date-range", to: :within_date_range, with: { to: :json_to_asm_within_date_range_within_date_range }
      map "at-frequency", to: :at_frequency, with: { to: :json_to_asm_at_frequency_at_frequency }
    end

    def json_to_asm_on_date_on_date(instance, doc)
      current = instance.instance_variable_get(:@on_date)
      if current.is_a?(Array)
        doc["on-date"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        doc["on-date"] = current.respond_to?(:content) ? current.content : current
      end
    end

    def json_to_asm_within_date_range_within_date_range(instance, doc)
      current = instance.instance_variable_get(:@within_date_range)
      if current.is_a?(Array)
        doc["within-date-range"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        doc["within-date-range"] = current.respond_to?(:content) ? current.content : current
      end
    end

    def json_to_asm_at_frequency_at_frequency(instance, doc)
      current = instance.instance_variable_get(:@at_frequency)
      if current.is_a?(Array)
        doc["at-frequency"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        doc["at-frequency"] = current.respond_to?(:content) ? current.content : current
      end
    end
  end
  class TaskDependency < Base
    attribute :task_uuid, :string
    attribute :remarks, :remarks

    xml do
      element "dependency"
      ordered
      map_attribute "task-uuid", to: :task_uuid
      map_element "remarks", to: :remarks
    end

    key_value do
      map "task-uuid", to: :task_uuid
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class TaskAssociatedActivity < Base
    attribute :activity_uuid, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :responsible_role, :responsible_role, collection: true
    attribute :assessment_subject, :assessment_subject, collection: true

    xml do
      element "associated-activity"
      ordered
      map_attribute "activity-uuid", to: :activity_uuid
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "responsible-role", to: :responsible_role
      map_element "subject", to: :assessment_subject
    end

    key_value do
      map "activity-uuid", to: :activity_uuid
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "props", to: :property, with: { to: :json_to_asm_property_props }
      map "links", to: :link, with: { to: :json_to_asm_link_links }
      map "responsible-roles", to: :responsible_role, with: { to: :json_to_asm_responsible_role_responsible_roles }
      map "subjects", to: :assessment_subject, with: { to: :json_to_asm_assessment_subject_subjects }
    end

    def json_to_asm_assessment_subject_subjects(instance, doc)
      current = instance.instance_variable_get(:@assessment_subject)
      if current.is_a?(Array)
        doc["subjects"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["subjects"] = Oscal::V1_2_1::AssessmentSubject.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["subjects"] = val
        end
      end
    end

    def json_to_asm_responsible_role_responsible_roles(instance, doc)
      current = instance.instance_variable_get(:@responsible_role)
      if current.is_a?(Array)
        doc["responsible-roles"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["responsible-roles"] = Oscal::V1_2_1::ResponsibleRole.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["responsible-roles"] = val
        end
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_to_asm_property_props(instance, doc)
      current = instance.instance_variable_get(:@property)
      if current.is_a?(Array)
        doc["props"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["props"] = Oscal::V1_2_1::Property.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["props"] = val
        end
      end
    end

    def json_to_asm_link_links(instance, doc)
      current = instance.instance_variable_get(:@link)
      if current.is_a?(Array)
        doc["links"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["links"] = Oscal::V1_2_1::Link.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["links"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class AssessmentSubjectDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class AssessmentSubjectPlaceholderDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class AssessmentSubjectPlaceholderSource < Base
    attribute :task_uuid, :string
    attribute :remarks, :remarks

    xml do
      element "source"
      ordered
      map_attribute "task-uuid", to: :task_uuid
      map_element "remarks", to: :remarks
    end

    key_value do
      map "task-uuid", to: :task_uuid
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class SubjectReferenceTitle < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "title"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class AssessmentAssetsAssessmentPlatform < Base
    attribute :uuid, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :title, :string
    attribute :uses_component, :string, collection: true

    xml do
      element "assessment-platform"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "title", to: :title
      map_element "uses-component", to: :uses_component
    end

    key_value do
      map "uuid", to: :uuid
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "title", to: :title, render_empty: true
      map "props", to: :property, with: { to: :json_to_asm_property_props }
      map "links", to: :link, with: { to: :json_to_asm_link_links }
      map "uses-components", to: :uses_component, with: { to: :json_to_asm_uses_component_uses_components }
    end

    def json_to_asm_uses_component_uses_components(instance, doc)
      current = instance.instance_variable_get(:@uses_component)
      if current.is_a?(Array)
        doc["uses-components"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        doc["uses-components"] = current.respond_to?(:content) ? current.content : current
      end
    end

    def json_to_asm_property_props(instance, doc)
      current = instance.instance_variable_get(:@property)
      if current.is_a?(Array)
        doc["props"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["props"] = Oscal::V1_2_1::Property.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["props"] = val
        end
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_to_asm_link_links(instance, doc)
      current = instance.instance_variable_get(:@link)
      if current.is_a?(Array)
        doc["links"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["links"] = Oscal::V1_2_1::Link.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["links"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class FindingTargetTitle < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "title"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class FindingTargetDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class FindingTargetStatus < Base
    attribute :state, :string
    attribute :reason, :string
    attribute :remarks, :remarks

    xml do
      element "status"
      ordered
      map_attribute "state", to: :state
      map_attribute "reason", to: :reason
      map_element "remarks", to: :remarks
    end

    key_value do
      map "state", to: :state
      map "reason", to: :reason
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class FindingTitle < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "title"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class FindingDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class ObservationTitle < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "title"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class ObservationDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class ObservationRelevantEvidence < Base
    attribute :href, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :description, :string

    xml do
      element "relevant-evidence"
      ordered
      map_attribute "href", to: :href
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "description", to: :description
    end

    key_value do
      map "href", to: :href
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "description", to: :description, render_empty: true
      map "props", to: :property, with: { to: :json_to_asm_property_props }
      map "links", to: :link, with: { to: :json_to_asm_link_links }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_to_asm_property_props(instance, doc)
      current = instance.instance_variable_get(:@property)
      if current.is_a?(Array)
        doc["props"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["props"] = Oscal::V1_2_1::Property.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["props"] = val
        end
      end
    end

    def json_to_asm_link_links(instance, doc)
      current = instance.instance_variable_get(:@link)
      if current.is_a?(Array)
        doc["links"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["links"] = Oscal::V1_2_1::Link.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["links"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class RelatedTaskIdentifiedSubject < Base
    attribute :subject_placeholder_uuid, :string
    attribute :assessment_subject, :assessment_subject, collection: true

    xml do
      element "identified-subject"
      ordered
      map_attribute "subject-placeholder-uuid", to: :subject_placeholder_uuid
      map_element "subject", to: :assessment_subject
    end

    key_value do
      map "subject-placeholder-uuid", to: :subject_placeholder_uuid
      map "subjects", to: :assessment_subject, with: { to: :json_to_asm_assessment_subject_subjects }
    end

    def json_to_asm_assessment_subject_subjects(instance, doc)
      current = instance.instance_variable_get(:@assessment_subject)
      if current.is_a?(Array)
        doc["subjects"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["subjects"] = Oscal::V1_2_1::AssessmentSubject.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["subjects"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class RiskTitle < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "title"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class RiskDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class RiskStatement < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "statement"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class RiskMitigatingFactor < Base
    attribute :uuid, :string
    attribute :implementation_uuid, :string
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :subject_reference, :subject_reference, collection: true
    attribute :description, :string

    xml do
      element "mitigating-factor"
      ordered
      map_attribute "uuid", to: :uuid
      map_attribute "implementation-uuid", to: :implementation_uuid
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "subject", to: :subject_reference
      map_element "description", to: :description
    end

    key_value do
      map "uuid", to: :uuid
      map "implementation-uuid", to: :implementation_uuid
      map "description", to: :description, render_empty: true
      map "props", to: :property, with: { to: :json_to_asm_property_props }
      map "links", to: :link, with: { to: :json_to_asm_link_links }
      map "subjects", to: :subject_reference, with: { to: :json_to_asm_subject_reference_subjects }
    end

    def json_to_asm_subject_reference_subjects(instance, doc)
      current = instance.instance_variable_get(:@subject_reference)
      if current.is_a?(Array)
        doc["subjects"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["subjects"] = Oscal::V1_2_1::SubjectReference.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["subjects"] = val
        end
      end
    end

    def json_to_asm_property_props(instance, doc)
      current = instance.instance_variable_get(:@property)
      if current.is_a?(Array)
        doc["props"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["props"] = Oscal::V1_2_1::Property.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["props"] = val
        end
      end
    end

    def json_to_asm_link_links(instance, doc)
      current = instance.instance_variable_get(:@link)
      if current.is_a?(Array)
        doc["links"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["links"] = Oscal::V1_2_1::Link.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["links"] = val
        end
      end
    end
  end
  class RiskRiskLog < Base
    attribute :entry, :string, collection: true

    xml do
      element "risk-log"
      ordered
      map_element "entry", to: :entry
    end

    key_value do
      map "entries", to: :entry, with: { to: :json_to_asm_entry_entries }
    end

    def json_to_asm_entry_entries(instance, doc)
      current = instance.instance_variable_get(:@entry)
      if current.is_a?(Array)
        doc["entries"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        doc["entries"] = current.respond_to?(:content) ? current.content : current
      end
    end
  end
  class CharacterizationFacet < Base
    attribute :name, :string
    attribute :system, :string
    attribute :value, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true

    xml do
      element "facet"
      ordered
      map_attribute "name", to: :name
      map_attribute "system", to: :system
      map_attribute "value", to: :value
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
    end

    key_value do
      map "name", to: :name
      map "system", to: :system
      map "value", to: :value
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "props", to: :property, with: { to: :json_to_asm_property_props }
      map "links", to: :link, with: { to: :json_to_asm_link_links }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_to_asm_property_props(instance, doc)
      current = instance.instance_variable_get(:@property)
      if current.is_a?(Array)
        doc["props"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["props"] = Oscal::V1_2_1::Property.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["props"] = val
        end
      end
    end

    def json_to_asm_link_links(instance, doc)
      current = instance.instance_variable_get(:@link)
      if current.is_a?(Array)
        doc["links"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["links"] = Oscal::V1_2_1::Link.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["links"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class ResponseTitle < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "title"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class ResponseDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class ResponseRequiredAsset < Base
    attribute :uuid, :string
    attribute :remarks, :remarks
    attribute :subject_reference, :subject_reference, collection: true
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :title, :string
    attribute :description, :string

    xml do
      element "required-asset"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "remarks", to: :remarks
      map_element "subject", to: :subject_reference
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "title", to: :title
      map_element "description", to: :description
    end

    key_value do
      map "uuid", to: :uuid
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "title", to: :title, render_empty: true
      map "description", to: :description, render_empty: true
      map "subjects", to: :subject_reference, with: { to: :json_to_asm_subject_reference_subjects }
      map "props", to: :property, with: { to: :json_to_asm_property_props }
      map "links", to: :link, with: { to: :json_to_asm_link_links }
    end

    def json_to_asm_subject_reference_subjects(instance, doc)
      current = instance.instance_variable_get(:@subject_reference)
      if current.is_a?(Array)
        doc["subjects"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["subjects"] = Oscal::V1_2_1::SubjectReference.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["subjects"] = val
        end
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_to_asm_property_props(instance, doc)
      current = instance.instance_variable_get(:@property)
      if current.is_a?(Array)
        doc["props"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["props"] = Oscal::V1_2_1::Property.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["props"] = val
        end
      end
    end

    def json_to_asm_link_links(instance, doc)
      current = instance.instance_variable_get(:@link)
      if current.is_a?(Array)
        doc["links"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["links"] = Oscal::V1_2_1::Link.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["links"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class AssessmentPlanLocalDefinitions < Base
    attribute :remarks, :remarks
    attribute :system_component, :system_component, collection: true
    attribute :inventory_item, :inventory_item, collection: true
    attribute :system_user, :system_user, collection: true
    attribute :local_objective, :local_objective, collection: true
    attribute :activity, :activity, collection: true

    xml do
      element "local-definitions"
      ordered
      map_element "remarks", to: :remarks
      map_element "component", to: :system_component
      map_element "inventory-item", to: :inventory_item
      map_element "user", to: :system_user
      map_element "objectives-and-methods", to: :local_objective
      map_element "activity", to: :activity
    end

    key_value do
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "components", to: :system_component, with: { to: :json_to_asm_system_component_components }
      map "inventory-items", to: :inventory_item, with: { to: :json_to_asm_inventory_item_inventory_items }
      map "users", to: :system_user, with: { to: :json_to_asm_system_user_users }
      map "objectives-and-methods", to: :local_objective, with: { to: :json_to_asm_local_objective_objectives_and_methods }
      map "activities", to: :activity, with: { to: :json_to_asm_activity_activities }
    end

    def json_to_asm_system_component_components(instance, doc)
      current = instance.instance_variable_get(:@system_component)
      if current.is_a?(Array)
        doc["components"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["components"] = Oscal::V1_2_1::SystemComponent.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["components"] = val
        end
      end
    end

    def json_to_asm_inventory_item_inventory_items(instance, doc)
      current = instance.instance_variable_get(:@inventory_item)
      if current.is_a?(Array)
        doc["inventory-items"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["inventory-items"] = Oscal::V1_2_1::InventoryItem.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["inventory-items"] = val
        end
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_to_asm_local_objective_objectives_and_methods(instance, doc)
      current = instance.instance_variable_get(:@local_objective)
      if current.is_a?(Array)
        doc["objectives-and-methods"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["objectives-and-methods"] = Oscal::V1_2_1::LocalObjective.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["objectives-and-methods"] = val
        end
      end
    end

    def json_to_asm_system_user_users(instance, doc)
      current = instance.instance_variable_get(:@system_user)
      if current.is_a?(Array)
        doc["users"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["users"] = Oscal::V1_2_1::SystemUser.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["users"] = val
        end
      end
    end

    def json_to_asm_activity_activities(instance, doc)
      current = instance.instance_variable_get(:@activity)
      if current.is_a?(Array)
        doc["activities"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["activities"] = Oscal::V1_2_1::Activity.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["activities"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class AssessmentPlanTermsAndConditions < Base
    attribute :assessment_part, :assessment_part, collection: true

    xml do
      element "terms-and-conditions"
      ordered
      map_element "part", to: :assessment_part
    end

    key_value do
      map "parts", to: :assessment_part, with: { to: :json_to_asm_assessment_part_parts }
    end

    def json_to_asm_assessment_part_parts(instance, doc)
      current = instance.instance_variable_get(:@assessment_part)
      if current.is_a?(Array)
        doc["parts"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["parts"] = Oscal::V1_2_1::AssessmentPart.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["parts"] = val
        end
      end
    end
  end
  class AssessmentResultsLocalDefinitions < Base
    attribute :remarks, :remarks
    attribute :local_objective, :local_objective, collection: true
    attribute :activity, :activity, collection: true

    xml do
      element "local-definitions"
      ordered
      map_element "remarks", to: :remarks
      map_element "objectives-and-methods", to: :local_objective
      map_element "activity", to: :activity
    end

    key_value do
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "objectives-and-methods", to: :local_objective, with: { to: :json_to_asm_local_objective_objectives_and_methods }
      map "activities", to: :activity, with: { to: :json_to_asm_activity_activities }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_to_asm_activity_activities(instance, doc)
      current = instance.instance_variable_get(:@activity)
      if current.is_a?(Array)
        doc["activities"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["activities"] = Oscal::V1_2_1::Activity.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["activities"] = val
        end
      end
    end

    def json_to_asm_local_objective_objectives_and_methods(instance, doc)
      current = instance.instance_variable_get(:@local_objective)
      if current.is_a?(Array)
        doc["objectives-and-methods"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["objectives-and-methods"] = Oscal::V1_2_1::LocalObjective.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["objectives-and-methods"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class ResultTitle < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "title"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class ResultDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class ResultLocalDefinitions < Base
    attribute :system_component, :system_component, collection: true
    attribute :inventory_item, :inventory_item, collection: true
    attribute :system_user, :system_user, collection: true
    attribute :assessment_assets, :assessment_assets
    attribute :task, :task, collection: true

    xml do
      element "local-definitions"
      ordered
      map_element "component", to: :system_component
      map_element "inventory-item", to: :inventory_item
      map_element "user", to: :system_user
      map_element "assessment-assets", to: :assessment_assets
      map_element "assessment-task", to: :task
    end

    key_value do
      map "components", to: :system_component, with: { to: :json_to_asm_system_component_components }
      map "inventory-items", to: :inventory_item, with: { to: :json_to_asm_inventory_item_inventory_items }
      map "users", to: :system_user, with: { to: :json_to_asm_system_user_users }
      map "assessment-assets", to: :assessment_assets, with: { to: :json_to_asm_assessment_assets_assessment_assets }
      map "tasks", to: :task, with: { to: :json_to_asm_task_tasks }
    end

    def json_to_asm_assessment_assets_assessment_assets(instance, doc)
      current = instance.instance_variable_get(:@assessment_assets)
      if current.is_a?(Array)
        doc["assessment-assets"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["assessment-assets"] = Oscal::V1_2_1::AssessmentAssets.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["assessment-assets"] = val
        end
      end
    end

    def json_to_asm_task_tasks(instance, doc)
      current = instance.instance_variable_get(:@task)
      if current.is_a?(Array)
        doc["tasks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["tasks"] = Oscal::V1_2_1::Task.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["tasks"] = val
        end
      end
    end

    def json_to_asm_system_component_components(instance, doc)
      current = instance.instance_variable_get(:@system_component)
      if current.is_a?(Array)
        doc["components"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["components"] = Oscal::V1_2_1::SystemComponent.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["components"] = val
        end
      end
    end

    def json_to_asm_inventory_item_inventory_items(instance, doc)
      current = instance.instance_variable_get(:@inventory_item)
      if current.is_a?(Array)
        doc["inventory-items"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["inventory-items"] = Oscal::V1_2_1::InventoryItem.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["inventory-items"] = val
        end
      end
    end

    def json_to_asm_system_user_users(instance, doc)
      current = instance.instance_variable_get(:@system_user)
      if current.is_a?(Array)
        doc["users"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["users"] = Oscal::V1_2_1::SystemUser.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["users"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class ResultAttestation < Base
    attribute :responsible_party, :responsible_party, collection: true
    attribute :assessment_part, :assessment_part, collection: true

    xml do
      element "attestation"
      ordered
      map_element "responsible-party", to: :responsible_party
      map_element "part", to: :assessment_part
    end

    key_value do
      map "responsible-parties", to: :responsible_party, with: { to: :json_to_asm_responsible_party_responsible_parties }
      map "parts", to: :assessment_part, with: { to: :json_to_asm_assessment_part_parts }
    end

    def json_to_asm_responsible_party_responsible_parties(instance, doc)
      current = instance.instance_variable_get(:@responsible_party)
      if current.is_a?(Array)
        doc["responsible-parties"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["responsible-parties"] = Oscal::V1_2_1::ResponsibleParty.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["responsible-parties"] = val
        end
      end
    end

    def json_to_asm_assessment_part_parts(instance, doc)
      current = instance.instance_variable_get(:@assessment_part)
      if current.is_a?(Array)
        doc["parts"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["parts"] = Oscal::V1_2_1::AssessmentPart.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["parts"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class ResultAssessmentLog < Base
    attribute :entry, :string, collection: true

    xml do
      element "assessment-log"
      ordered
      map_element "entry", to: :entry
    end

    key_value do
      map "entries", to: :entry, with: { to: :json_to_asm_entry_entries }
    end

    def json_to_asm_entry_entries(instance, doc)
      current = instance.instance_variable_get(:@entry)
      if current.is_a?(Array)
        doc["entries"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        doc["entries"] = current.respond_to?(:content) ? current.content : current
      end
    end
  end
  class PoamItemTitle < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true

    xml do
      element "title"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
    end
  end
  class PoamItemDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
      map "a", to: :a
      map "insert", to: :insert
      map "br", to: :br
      map "code", to: :code
      map "em", to: :em
      map "i", to: :i
      map "b", to: :b
      map "strong", to: :strong
      map "sub", to: :sub
      map "sup", to: :sup
      map "q", to: :q
      map "img", to: :img
      map "p", to: :p
      map "h1", to: :h1
      map "h2", to: :h2
      map "h3", to: :h3
      map "h4", to: :h4
      map "h5", to: :h5
      map "h6", to: :h6
      map "ul", to: :ul
      map "ol", to: :ol
      map "pre", to: :pre
      map "hr", to: :hr
      map "blockquote", to: :blockquote
      map "table", to: :table
    end
  end
  class PoamItemOrigin < Base
    attribute :origin_actor, :origin_actor, collection: true

    xml do
      element "origin"
      ordered
      map_element "actor", to: :origin_actor
    end

    key_value do
      map "actors", to: :origin_actor, with: { to: :json_to_asm_origin_actor_actors }
    end

    def json_to_asm_origin_actor_actors(instance, doc)
      current = instance.instance_variable_get(:@origin_actor)
      if current.is_a?(Array)
        doc["actors"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["actors"] = Oscal::V1_2_1::OriginActor.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["actors"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class PoamItemRelatedFinding < Base
    attribute :finding_uuid, :string
    attribute :remarks, :remarks

    xml do
      element "related-finding"
      ordered
      map_attribute "finding-uuid", to: :finding_uuid
      map_element "remarks", to: :remarks
    end

    key_value do
      map "finding-uuid", to: :finding_uuid
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class LocationUuid < Base
    attribute :content, :string

    xml do
      element "location-uuid"
      map_content to: :content
    end

    key_value do
      map "content", to: :content
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end
  end
  class PartyUuid < Base
    attribute :content, :string

    xml do
      element "party-uuid"
      map_content to: :content
    end

    key_value do
      map "content", to: :content
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end
  end
  class RoleId < Base
    attribute :content, :string

    xml do
      element "role-id"
      map_content to: :content
    end

    key_value do
      map "content", to: :content
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end
  end
  class HashField < Base
    attribute :content, :string
    attribute :algorithm, :string

    xml do
      element "hash"
      map_content to: :content
      map_attribute "algorithm", to: :algorithm
    end

    key_value do
      map "value", to: :content
      map "algorithm", to: :algorithm
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end
  end
  class Remarks < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "remarks"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
    end
  end
  class Published < Base
    attribute :content, :string

    xml do
      element "published"
      map_content to: :content
    end

    key_value do
      map "content", to: :content
    end
  end
  class LastModified < Base
    attribute :content, :string

    xml do
      element "last-modified"
      map_content to: :content
    end

    key_value do
      map "content", to: :content
    end
  end
  class Version < Base
    attribute :content, :string

    xml do
      element "version"
      map_content to: :content
    end

    key_value do
      map "content", to: :content
    end
  end
  class OscalVersion < Base
    attribute :content, :string

    xml do
      element "oscal-version"
      map_content to: :content
    end

    key_value do
      map "content", to: :content
    end
  end
  class EmailAddress < Base
    attribute :content, :string

    xml do
      element "email-address"
      map_content to: :content
    end

    key_value do
      map "content", to: :content
    end
  end
  class TelephoneNumber < Base
    attribute :content, :string
    attribute :type, :string

    xml do
      element "telephone-number"
      map_content to: :content
      map_attribute "type", to: :type
    end

    key_value do
      map "number", to: :content
      map "type", to: :type
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end
  end
  class AddrLine < Base
    attribute :content, :string

    xml do
      element "addr-line"
      map_content to: :content
    end

    key_value do
      map "content", to: :content
    end
  end
  class DocumentId < Base
    attribute :content, :string
    attribute :scheme, :string

    xml do
      element "document-id"
      map_content to: :content
      map_attribute "scheme", to: :scheme
    end

    key_value do
      map "identifier", to: :content
      map "scheme", to: :scheme
    end
  end
  class ParameterValue < Base
    attribute :content, :string

    xml do
      element "parameter-value"
      map_content to: :content
    end

    key_value do
      map "content", to: :content
    end
  end
  class WithId < Base
    attribute :content, :string

    xml do
      element "with-id"
      map_content to: :content
    end

    key_value do
      map "content", to: :content
    end
  end
  class Coverage < Base
    attribute :content, :string
    attribute :generation_method, :string

    xml do
      element "coverage"
      map_content to: :content
      map_attribute "generation-method", to: :generation_method
    end

    key_value do
      map "target-coverage", to: :content
      map "generation-method", to: :generation_method
    end
  end
  class Percentage < Base
    attribute :content, :string

    xml do
      element "percentage"
      map_content to: :content
    end

    key_value do
      map "content", to: :content
    end
  end
  class MappingDescription < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "mapping-description"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
    end
  end
  class FunctionPerformed < Base
    attribute :content, :string

    xml do
      element "function-performed"
      map_content to: :content
    end

    key_value do
      map "content", to: :content
    end
  end
  class SystemId < Base
    attribute :content, :string
    attribute :identifier_type, :string

    xml do
      element "system-id"
      map_content to: :content
      map_attribute "identifier-type", to: :identifier_type
    end

    key_value do
      map "id", to: :content
      map "identifier-type", to: :identifier_type
    end
  end
  class BaseField < Base
    attribute :content, :string

    xml do
      element "base"
      map_content to: :content
    end

    key_value do
      map "content", to: :content
    end
  end
  class Selected < Base
    attribute :content, :string

    xml do
      element "selected"
      map_content to: :content
    end

    key_value do
      map "content", to: :content
    end
  end
  class AdjustmentJustification < Base
    attribute :content, :string, collection: true
    attribute :a, Metaschema::AnchorType, collection: true
    attribute :insert, Metaschema::InsertType, collection: true
    attribute :br, :string, collection: true
    attribute :code, Metaschema::CodeType, collection: true
    attribute :em, Metaschema::InlineMarkupType, collection: true
    attribute :i, Metaschema::InlineMarkupType, collection: true
    attribute :b, Metaschema::InlineMarkupType, collection: true
    attribute :strong, Metaschema::InlineMarkupType, collection: true
    attribute :sub, Metaschema::InlineMarkupType, collection: true
    attribute :sup, Metaschema::InlineMarkupType, collection: true
    attribute :q, Metaschema::InlineMarkupType, collection: true
    attribute :img, Metaschema::ImageType, collection: true
    attribute :p, Metaschema::InlineMarkupType, collection: true
    attribute :h1, Metaschema::InlineMarkupType, collection: true
    attribute :h2, Metaschema::InlineMarkupType, collection: true
    attribute :h3, Metaschema::InlineMarkupType, collection: true
    attribute :h4, Metaschema::InlineMarkupType, collection: true
    attribute :h5, Metaschema::InlineMarkupType, collection: true
    attribute :h6, Metaschema::InlineMarkupType, collection: true
    attribute :ul, Metaschema::ListType, collection: true
    attribute :ol, Metaschema::OrderedListType, collection: true
    attribute :pre, Metaschema::PreformattedType, collection: true
    attribute :hr, :string, collection: true
    attribute :blockquote, Metaschema::BlockQuoteType, collection: true
    attribute :table, Metaschema::TableType, collection: true

    xml do
      element "adjustment-justification"
      mixed_content
      ordered
      map_content to: :content
      map_element "a", to: :a
      map_element "insert", to: :insert
      map_element "br", to: :br
      map_element "code", to: :code
      map_element "em", to: :em
      map_element "i", to: :i
      map_element "b", to: :b
      map_element "strong", to: :strong
      map_element "sub", to: :sub
      map_element "sup", to: :sup
      map_element "q", to: :q
      map_element "img", to: :img
      map_element "p", to: :p
      map_element "h1", to: :h1
      map_element "h2", to: :h2
      map_element "h3", to: :h3
      map_element "h4", to: :h4
      map_element "h5", to: :h5
      map_element "h6", to: :h6
      map_element "ul", to: :ul
      map_element "ol", to: :ol
      map_element "pre", to: :pre
      map_element "hr", to: :hr
      map_element "blockquote", to: :blockquote
      map_element "table", to: :table
    end

    key_value do
      map "content", to: :content
    end
  end
  class DateAuthorized < Base
    attribute :content, :string

    xml do
      element "date-authorized"
      map_content to: :content
    end

    key_value do
      map "content", to: :content
    end
  end
  class ThreatId < Base
    attribute :content, :string
    attribute :system, :string
    attribute :href, :string

    xml do
      element "threat-id"
      map_content to: :content
      map_attribute "system", to: :system
      map_attribute "href", to: :href
    end

    key_value do
      map "id", to: :content
      map "system", to: :system
      map "href", to: :href
    end
  end
  class RiskStatus < Base
    attribute :content, :string

    xml do
      element "risk-status"
      map_content to: :content
    end

    key_value do
      map "content", to: :content
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end
  end
  class ExternalIdInMetadata < Base
    attribute :content, :string
    attribute :scheme, :string

    xml do
      element "external-id"
      map_content to: :content
      map_attribute "scheme", to: :scheme
    end

    key_value do
      map "STRVALUE", to: :content
      map "scheme", to: :scheme
    end
  end
  class Base64InBackMatter < Base
    attribute :content, :string
    attribute :filename, :string
    attribute :media_type, :string

    xml do
      element "base64"
      map_content to: :content
      map_attribute "filename", to: :filename
      map_attribute "media-type", to: :media_type
    end

    key_value do
      map "STRVALUE", to: :content
      map "filename", to: :filename
      map "media-type", to: :media_type
    end
  end
  class Metadata < Base
    attribute :published, :published
    attribute :last_modified, :last_modified
    attribute :version, :version
    attribute :oscal_version, :oscal_version
    attribute :document_id, :document_id, collection: true
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :responsible_party, :responsible_party, collection: true
    attribute :action, :action, collection: true
    attribute :title, :metadata_title
    attribute :revision, :metadata_revision, collection: true
    attribute :role, :metadata_role, collection: true
    attribute :location, :metadata_location, collection: true
    attribute :party, :metadata_party, collection: true

    xml do
      element "metadata"
      ordered
      map_element "published", to: :published
      map_element "last-modified", to: :last_modified
      map_element "version", to: :version
      map_element "oscal-version", to: :oscal_version
      map_element "document-id", to: :document_id
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "responsible-party", to: :responsible_party
      map_element "action", to: :action
      map_element "title", to: :title
      map_element "revision", to: :revision
      map_element "role", to: :role
      map_element "location", to: :location
      map_element "party", to: :party
    end

    key_value do
      map "published", to: :published, with: { to: :json_to_published_published, from: :json_from_published_published }
      map "last-modified", to: :last_modified, with: { to: :json_to_last_modified_last_modified, from: :json_from_last_modified_last_modified }
      map "version", to: :version, with: { to: :json_to_version_version, from: :json_from_version_version }
      map "oscal-version", to: :oscal_version, with: { to: :json_to_oscal_version_oscal_version, from: :json_from_oscal_version_oscal_version }
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "title", to: :title, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "responsible-parties", to: :responsible_party, render_empty: true
      map "actions", to: :action, render_empty: true
      map "revisions", to: :revision, render_empty: true
      map "roles", to: :role, render_empty: true
      map "locations", to: :location, render_empty: true
      map "parties", to: :party, render_empty: true
      map "document-ids", to: :document_id, with: { to: :json_soa_to_document_id_document_ids, from: :json_soa_from_document_id_document_ids }
      map "document-id", to: :document_id, with: { to: :json_soa_to_document_id_document_ids, from: :json_soa_from_document_id_document_ids }
    end

    def json_from_published_published(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Published.of_json(v) }
        instance.instance_variable_set(:@published, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Published.new(content: "")
          instance.instance_variable_set(:@published, inst)
        else
          instance.instance_variable_set(:@published, Oscal::V1_2_1::Published.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@published, Oscal::V1_2_1::Published.of_json(value))
      end
    end

    def json_to_published_published(instance, doc)
      current = instance.instance_variable_get(:@published)
      if current.is_a?(Array)
        doc["published"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["published"] = Oscal::V1_2_1::Published.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["published"] = val
        end
      end
    end

    def json_to_last_modified_last_modified(instance, doc)
      current = instance.instance_variable_get(:@last_modified)
      if current.is_a?(Array)
        doc["last-modified"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["last-modified"] = Oscal::V1_2_1::LastModified.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["last-modified"] = val
        end
      end
    end

    def json_from_version_version(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Version.of_json(v) }
        instance.instance_variable_set(:@version, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Version.new(content: "")
          instance.instance_variable_set(:@version, inst)
        else
          instance.instance_variable_set(:@version, Oscal::V1_2_1::Version.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@version, Oscal::V1_2_1::Version.of_json(value))
      end
    end

    def json_to_version_version(instance, doc)
      current = instance.instance_variable_get(:@version)
      if current.is_a?(Array)
        doc["version"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["version"] = Oscal::V1_2_1::Version.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["version"] = val
        end
      end
    end

    def json_from_oscal_version_oscal_version(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::OscalVersion.of_json(v) }
        instance.instance_variable_set(:@oscal_version, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::OscalVersion.new(content: "")
          instance.instance_variable_set(:@oscal_version, inst)
        else
          instance.instance_variable_set(:@oscal_version, Oscal::V1_2_1::OscalVersion.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@oscal_version, Oscal::V1_2_1::OscalVersion.of_json(value))
      end
    end

    def json_to_oscal_version_oscal_version(instance, doc)
      current = instance.instance_variable_get(:@oscal_version)
      if current.is_a?(Array)
        doc["oscal-version"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["oscal-version"] = Oscal::V1_2_1::OscalVersion.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["oscal-version"] = val
        end
      end
    end

    def json_from_last_modified_last_modified(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::LastModified.of_json(v) }
        instance.instance_variable_set(:@last_modified, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::LastModified.new(content: "")
          instance.instance_variable_set(:@last_modified, inst)
        else
          instance.instance_variable_set(:@last_modified, Oscal::V1_2_1::LastModified.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@last_modified, Oscal::V1_2_1::LastModified.of_json(value))
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_soa_from_document_id_document_ids(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              when String then [value]
              else return
              end
      parsed = items.map do |item|
        case item
        when Hash then Oscal::V1_2_1::DocumentId.of_json(item)
        when String then Oscal::V1_2_1::DocumentId.of_json(item)
        else item
        end
      end
      instance.instance_variable_set(:@document_id, parsed)
    end

    def json_soa_to_document_id_document_ids(instance, doc)
      current = instance.instance_variable_get(:@document_id)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::DocumentId.as_json(item)
          else
            item
          end
        end
        doc["document-ids"] = result.length == 1 ? result.first : result
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class Property < Base
    attribute :name, :string
    attribute :uuid, :string
    attribute :ns, :string
    attribute :value, :string
    attribute :class_attr, :string
    attribute :group, :string
    attribute :remarks, :remarks

    xml do
      element "property"
      ordered
      map_attribute "name", to: :name
      map_attribute "uuid", to: :uuid
      map_attribute "ns", to: :ns
      map_attribute "value", to: :value
      map_attribute "class", to: :class_attr
      map_attribute "group", to: :group
      map_element "remarks", to: :remarks
    end

    key_value do
      map "name", to: :name
      map "uuid", to: :uuid
      map "ns", to: :ns
      map "value", to: :value
      map "class", to: :class_attr
      map "group", to: :group
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class Link < Base
    attribute :href, :string
    attribute :rel, :string
    attribute :resource_fragment, :string
    attribute :media_type, :string
    attribute :text, :link_text

    xml do
      element "link"
      ordered
      map_attribute "href", to: :href
      map_attribute "rel", to: :rel
      map_attribute "resource-fragment", to: :resource_fragment
      map_attribute "media-type", to: :media_type
      map_element "text", to: :text
    end

    key_value do
      map "href", to: :href
      map "rel", to: :rel
      map "resource-fragment", to: :resource_fragment
      map "media-type", to: :media_type
      map "text", to: :text, render_empty: true
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end
  end
  class ResponsibleParty < Base
    attribute :role_id, :string
    attribute :party_uuid, :party_uuid, collection: true
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true

    xml do
      element "responsible-party"
      ordered
      map_attribute "role-id", to: :role_id
      map_element "party-uuid", to: :party_uuid
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
    end

    key_value do
      map "role-id", to: :role_id
      map "party-uuids", to: :party_uuid, with: { to: :json_to_party_uuid_party_uuids, from: :json_from_party_uuid_party_uuids }
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
    end

    def json_from_party_uuid_party_uuids(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::PartyUuid.of_json(v) }
        instance.instance_variable_set(:@party_uuid, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::PartyUuid.new(content: "")
          instance.instance_variable_set(:@party_uuid, inst)
        else
          instance.instance_variable_set(:@party_uuid, Oscal::V1_2_1::PartyUuid.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@party_uuid, Oscal::V1_2_1::PartyUuid.of_json(value))
      end
    end

    def json_to_party_uuid_party_uuids(instance, doc)
      current = instance.instance_variable_get(:@party_uuid)
      if current.is_a?(Array)
        doc["party-uuids"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["party-uuids"] = Oscal::V1_2_1::PartyUuid.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["party-uuids"] = val
        end
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class Action < Base
    attribute :uuid, :string
    attribute :date, :string
    attribute :type, :string
    attribute :system, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :responsible_party, :responsible_party, collection: true

    xml do
      element "action"
      ordered
      map_attribute "uuid", to: :uuid
      map_attribute "date", to: :date
      map_attribute "type", to: :type
      map_attribute "system", to: :system
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "responsible-party", to: :responsible_party
    end

    key_value do
      map "uuid", to: :uuid
      map "date", to: :date
      map "type", to: :type
      map "system", to: :system
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "responsible-parties", to: :responsible_party, render_empty: true
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class Address < Base
    attribute :location_type, :string
    attribute :addr_line, :addr_line, collection: true
    attribute :city, :string
    attribute :state, :string
    attribute :postal_code, :string
    attribute :country, :string

    xml do
      element "address"
      ordered
      map_attribute "location-type", to: :location_type
      map_element "addr-line", to: :addr_line
      map_element "city", to: :city
      map_element "state", to: :state
      map_element "postal-code", to: :postal_code
      map_element "country", to: :country
    end

    key_value do
      map "location-type", to: :location_type
      map "addr-lines", to: :addr_line, with: { to: :json_to_addr_line_addr_lines, from: :json_from_addr_line_addr_lines }
      map "city", to: :city, render_empty: true
      map "state", to: :state, render_empty: true
      map "postal-code", to: :postal_code, render_empty: true
      map "country", to: :country, render_empty: true
    end

    def json_from_addr_line_addr_lines(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::AddrLine.of_json(v) }
        instance.instance_variable_set(:@addr_line, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::AddrLine.new(content: "")
          instance.instance_variable_set(:@addr_line, inst)
        else
          instance.instance_variable_set(:@addr_line, Oscal::V1_2_1::AddrLine.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@addr_line, Oscal::V1_2_1::AddrLine.of_json(value))
      end
    end

    def json_to_addr_line_addr_lines(instance, doc)
      current = instance.instance_variable_get(:@addr_line)
      if current.is_a?(Array)
        doc["addr-lines"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["addr-lines"] = Oscal::V1_2_1::AddrLine.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["addr-lines"] = val
        end
      end
    end
  end
  class BackMatter < Base
    attribute :resource, :back_matter_resource, collection: true

    xml do
      element "back-matter"
      ordered
      map_element "resource", to: :resource
    end

    key_value do
      map "resources", to: :resource, render_empty: true
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end
  end
  class ResponsibleRole < Base
    attribute :role_id, :string
    attribute :party_uuid, :party_uuid, collection: true
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true

    xml do
      element "responsible-role"
      ordered
      map_attribute "role-id", to: :role_id
      map_element "party-uuid", to: :party_uuid
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
    end

    key_value do
      map "role-id", to: :role_id
      map "party-uuids", to: :party_uuid, with: { to: :json_to_party_uuid_party_uuids, from: :json_from_party_uuid_party_uuids }
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
    end

    def json_from_party_uuid_party_uuids(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::PartyUuid.of_json(v) }
        instance.instance_variable_set(:@party_uuid, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::PartyUuid.new(content: "")
          instance.instance_variable_set(:@party_uuid, inst)
        else
          instance.instance_variable_set(:@party_uuid, Oscal::V1_2_1::PartyUuid.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@party_uuid, Oscal::V1_2_1::PartyUuid.of_json(value))
      end
    end

    def json_to_party_uuid_party_uuids(instance, doc)
      current = instance.instance_variable_get(:@party_uuid)
      if current.is_a?(Array)
        doc["party-uuids"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["party-uuids"] = Oscal::V1_2_1::PartyUuid.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["party-uuids"] = val
        end
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class Part < Base
    attribute :id, :string
    attribute :name, :string
    attribute :ns, :string
    attribute :class_attr, :string
    attribute :property, :property, collection: true
    attribute :part, :part, collection: true
    attribute :link, :link, collection: true
    attribute :title, :part_title
    attribute :prose, :part_prose

    xml do
      element "part"
      ordered
      map_attribute "id", to: :id
      map_attribute "name", to: :name
      map_attribute "ns", to: :ns
      map_attribute "class", to: :class_attr
      map_element "prop", to: :property
      map_element "part", to: :part
      map_element "link", to: :link
      map_element "title", to: :title
      map_element "prose", to: :prose
    end

    key_value do
      map "id", to: :id
      map "name", to: :name
      map "ns", to: :ns
      map "class", to: :class_attr
      map "title", to: :title, render_empty: true
      map "prose", to: :prose, render_empty: true
      map "props", to: :property, render_empty: true
      map "parts", to: :part, render_empty: true
      map "links", to: :link, render_empty: true
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end
  end
  class Parameter < Base
    attribute :id, :string
    attribute :class_attr, :string
    attribute :depends_on, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :parameter_constraint, :parameter_constraint, collection: true
    attribute :parameter_guideline, :parameter_guideline, collection: true
    attribute :label, :parameter_label
    attribute :usage, :parameter_usage
    attribute :parameter_selection, :parameter_selection
    attribute :parameter_value, :parameter_value, collection: true

    xml do
      element "parameter"
      ordered
      map_attribute "id", to: :id
      map_attribute "class", to: :class_attr
      map_attribute "depends-on", to: :depends_on
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "constraint", to: :parameter_constraint
      map_element "guideline", to: :parameter_guideline
      map_element "label", to: :label
      map_element "usage", to: :usage
      map_element "value", to: :parameter_value
      map_element "select", to: :parameter_selection
    end

    key_value do
      map "id", to: :id
      map "class", to: :class_attr
      map "depends-on", to: :depends_on
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "label", to: :label, render_empty: true
      map "usage", to: :usage, render_empty: true
      map "values", to: :parameter_value, with: { to: :json_to_parameter_value_values, from: :json_from_parameter_value_values }
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "constraints", to: :parameter_constraint, render_empty: true
      map "guidelines", to: :parameter_guideline, render_empty: true
      map "select", to: :parameter_selection, with: { to: :json_assembly_soa_to_parameter_selection_select, from: :json_assembly_soa_from_parameter_selection_select }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_assembly_soa_from_parameter_selection_select(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::ParameterSelection.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@parameter_selection, parsed)
    end

    def json_to_parameter_value_values(instance, doc)
      current = instance.instance_variable_get(:@parameter_value)
      if current.is_a?(Array)
        doc["values"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["values"] = Oscal::V1_2_1::ParameterValue.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["values"] = val
        end
      end
    end

    def json_assembly_soa_to_parameter_selection_select(instance, doc)
      current = instance.instance_variable_get(:@parameter_selection)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::ParameterSelection.as_json(item)
          else
            item
          end
        end
        doc["select"] = result.length == 1 ? result.first : result
      end
    end

    def json_from_parameter_value_values(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::ParameterValue.of_json(v) }
        instance.instance_variable_set(:@parameter_value, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::ParameterValue.new(content: "")
          instance.instance_variable_set(:@parameter_value, inst)
        else
          instance.instance_variable_set(:@parameter_value, Oscal::V1_2_1::ParameterValue.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@parameter_value, Oscal::V1_2_1::ParameterValue.of_json(value))
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class ParameterConstraint < Base
    attribute :description, :parameter_constraint_description
    attribute :test, :parameter_constraint_test, collection: true

    xml do
      element "parameter-constraint"
      ordered
      map_element "description", to: :description
      map_element "test", to: :test
    end

    key_value do
      map "description", to: :description, render_empty: true
      map "tests", to: :test, render_empty: true
    end
  end
  class ParameterGuideline < Base
    attribute :prose, :parameter_guideline_prose

    xml do
      element "parameter-guideline"
      ordered
      map_element "prose", to: :prose
    end

    key_value do
      map "prose", to: :prose, render_empty: true
    end
  end
  class ParameterSelection < Base
    attribute :how_many, :string
    attribute :choice, :parameter_selection_choice, collection: true

    xml do
      element "parameter-selection"
      ordered
      map_attribute "how-many", to: :how_many
      map_element "choice", to: :choice
    end

    key_value do
      map "how-many", to: :how_many
      map "choice", to: :choice, with: { to: :json_soa_to_choice_choice, from: :json_soa_from_choice_choice }
    end

    def json_soa_from_choice_choice(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              when String then [value]
              else return
              end
      parsed = items.map do |item|
        case item
        when Hash then Oscal::V1_2_1::ParameterSelectionChoice.of_json(item)
        when String then Oscal::V1_2_1::ParameterSelectionChoice.of_json(item)
        else item
        end
      end
      instance.instance_variable_set(:@choice, parsed)
    end

    def json_soa_to_choice_choice(instance, doc)
      current = instance.instance_variable_get(:@choice)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::ParameterSelectionChoice.as_json(item)
          else
            item
          end
        end
        doc["choice"] = result.length == 1 ? result.first : result
      end
    end
  end
  class IncludeAll < Base

    xml do
      element "include-all"
      ordered
    end
  end
  class Matching < Base
    attribute :pattern, :string
    attribute :remarks, :remarks

    xml do
      element "matching"
      ordered
      map_attribute "pattern", to: :pattern
      map_element "remarks", to: :remarks
    end

    key_value do
      map "pattern", to: :pattern
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class SelectControlById < Base
    attribute :with_child_controls, :string
    attribute :with_id, :with_id, collection: true
    attribute :matching, :matching, collection: true

    xml do
      element "select-control-by-id"
      ordered
      map_attribute "with-child-controls", to: :with_child_controls
      map_element "with-id", to: :with_id
      map_element "matching", to: :matching
    end

    key_value do
      map "with-child-controls", to: :with_child_controls
      map "with-ids", to: :with_id, with: { to: :json_to_with_id_with_ids, from: :json_from_with_id_with_ids }
      map "matching", to: :matching, render_empty: true
    end

    def json_from_with_id_with_ids(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::WithId.of_json(v) }
        instance.instance_variable_set(:@with_id, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::WithId.new(content: "")
          instance.instance_variable_set(:@with_id, inst)
        else
          instance.instance_variable_set(:@with_id, Oscal::V1_2_1::WithId.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@with_id, Oscal::V1_2_1::WithId.of_json(value))
      end
    end

    def json_to_with_id_with_ids(instance, doc)
      current = instance.instance_variable_get(:@with_id)
      if current.is_a?(Array)
        doc["with-ids"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["with-ids"] = Oscal::V1_2_1::WithId.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["with-ids"] = val
        end
      end
    end
  end
  class Catalog < Base
    attribute :uuid, :string
    attribute :metadata, :metadata
    attribute :parameter, :parameter, collection: true
    attribute :control, :control, collection: true
    attribute :group, :group, collection: true
    attribute :back_matter, :back_matter

    xml do
      element "catalog"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "metadata", to: :metadata
      map_element "param", to: :parameter
      map_element "control", to: :control
      map_element "group", to: :group
      map_element "back-matter", to: :back_matter
    end

    key_value do
      map "uuid", to: :uuid
      map "params", to: :parameter, render_empty: true
      map "controls", to: :control, render_empty: true
      map "groups", to: :group, render_empty: true
      map "metadata", to: :metadata, with: { to: :json_assembly_soa_to_metadata_metadata, from: :json_assembly_soa_from_metadata_metadata }
      map "back-matter", to: :back_matter, with: { to: :json_assembly_soa_to_back_matter_back_matter, from: :json_assembly_soa_from_back_matter_back_matter }
    end

    def json_assembly_soa_to_metadata_metadata(instance, doc)
      current = instance.instance_variable_get(:@metadata)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::Metadata.as_json(item)
          else
            item
          end
        end
        doc["metadata"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_back_matter_back_matter(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::BackMatter.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@back_matter, parsed)
    end

    def json_assembly_soa_from_metadata_metadata(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::Metadata.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@metadata, parsed)
    end

    def json_assembly_soa_to_back_matter_back_matter(instance, doc)
      current = instance.instance_variable_get(:@back_matter)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::BackMatter.as_json(item)
          else
            item
          end
        end
        doc["back-matter"] = result.length == 1 ? result.first : result
      end
    end

    def self.of_json(doc, options = {})
      if doc.is_a?(Hash) && doc.key?("catalog")
        super(doc["catalog"], options)
      else
        super(doc, options)
      end
    end

    def self.to_json(instance, options = {})
      json_str = super(instance, options)
      { "catalog" => JSON.parse(json_str) }.to_json
    end

    def self.of_yaml(doc, options = {})
      if doc.is_a?(Hash) && doc.key?("catalog")
        super(doc["catalog"], options)
      else
        super(doc, options)
      end
    end

    def self.to_yaml(instance, options = {})
      yaml_str = super(instance, options)
      data = YAML.safe_load(yaml_str, permitted_classes: [Date, Time, Symbol])
      { "catalog" => data }.to_yaml
    end

    def to_json(options = {})
      self.class.to_json(self, options)
    end

    def to_yaml(options = {})
      self.class.to_yaml(self, options)
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class Control < Base
    attribute :id, :string
    attribute :class_attr, :string
    attribute :parameter, :parameter, collection: true
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :part, :part, collection: true
    attribute :control, :control, collection: true
    attribute :title, :control_title

    xml do
      element "control"
      ordered
      map_attribute "id", to: :id
      map_attribute "class", to: :class_attr
      map_element "param", to: :parameter
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "part", to: :part
      map_element "control", to: :control
      map_element "title", to: :title
    end

    key_value do
      map "id", to: :id
      map "class", to: :class_attr
      map "title", to: :title, render_empty: true
      map "params", to: :parameter, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "parts", to: :part, render_empty: true
      map "controls", to: :control, render_empty: true
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end
  end
  class Group < Base
    attribute :id, :string
    attribute :class_attr, :string
    attribute :parameter, :parameter, collection: true
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :part, :part, collection: true
    attribute :title, :group_title
    attribute :group, :group, collection: true
    attribute :control, :control, collection: true

    xml do
      element "group"
      ordered
      map_attribute "id", to: :id
      map_attribute "class", to: :class_attr
      map_element "param", to: :parameter
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "part", to: :part
      map_element "title", to: :title
      map_element "group", to: :group
      map_element "control", to: :control
    end

    key_value do
      map "id", to: :id
      map "class", to: :class_attr
      map "title", to: :title, render_empty: true
      map "params", to: :parameter, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "parts", to: :part, render_empty: true
      map "groups", to: :group, render_empty: true
      map "controls", to: :control, render_empty: true
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end
  end
  class Mapping < Base
    attribute :uuid, :string
    attribute :method_attr, :string
    attribute :matching_rationale, :string
    attribute :status, :string
    attribute :remarks, :remarks
    attribute :mapping_description, :mapping_description
    attribute :coverage, :coverage
    attribute :mapping_resource_reference, :mapping_resource_reference
    attribute :map, :map, collection: true
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :gap_summary, :gap_summary
    attribute :confidence_score, :confidence_score

    xml do
      element "mapping"
      ordered
      map_attribute "uuid", to: :uuid
      map_attribute "method", to: :method_attr
      map_attribute "matching-rationale", to: :matching_rationale
      map_attribute "status", to: :status
      map_element "remarks", to: :remarks
      map_element "mapping-description", to: :mapping_description
      map_element "coverage", to: :coverage
      map_element "source-resource", to: :mapping_resource_reference
      map_element "target-resource", to: :mapping_resource_reference
      map_element "map", to: :map
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "source-gap-summary", to: :gap_summary
      map_element "target-gap-summary", to: :gap_summary
      map_element "confidence-score", to: :confidence_score
    end

    key_value do
      map "uuid", to: :uuid
      map "method", to: :method_attr
      map "matching-rationale", to: :matching_rationale
      map "status", to: :status
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "mapping-description", to: :mapping_description, with: { to: :json_to_mapping_description_mapping_description, from: :json_from_mapping_description_mapping_description }
      map "coverage", to: :coverage, with: { to: :json_to_coverage_coverage, from: :json_from_coverage_coverage }
      map "maps", to: :map, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "source-resource", to: :mapping_resource_reference, with: { to: :json_assembly_soa_to_mapping_resource_reference_source_resource, from: :json_assembly_soa_from_mapping_resource_reference_source_resource }
      map "target-resource", to: :mapping_resource_reference, with: { to: :json_assembly_soa_to_mapping_resource_reference_target_resource, from: :json_assembly_soa_from_mapping_resource_reference_target_resource }
      map "source-gap-summary", to: :gap_summary, with: { to: :json_assembly_soa_to_gap_summary_source_gap_summary, from: :json_assembly_soa_from_gap_summary_source_gap_summary }
      map "target-gap-summary", to: :gap_summary, with: { to: :json_assembly_soa_to_gap_summary_target_gap_summary, from: :json_assembly_soa_from_gap_summary_target_gap_summary }
      map "confidence-score", to: :confidence_score, with: { to: :json_assembly_soa_to_confidence_score_confidence_score, from: :json_assembly_soa_from_confidence_score_confidence_score }
    end

    def json_to_mapping_description_mapping_description(instance, doc)
      current = instance.instance_variable_get(:@mapping_description)
      if current.is_a?(Array)
        doc["mapping-description"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["mapping-description"] = Oscal::V1_2_1::MappingDescription.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["mapping-description"] = val
        end
      end
    end

    def json_from_mapping_description_mapping_description(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::MappingDescription.of_json(v) }
        instance.instance_variable_set(:@mapping_description, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::MappingDescription.new(content: "")
          instance.instance_variable_set(:@mapping_description, inst)
        else
          instance.instance_variable_set(:@mapping_description, Oscal::V1_2_1::MappingDescription.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@mapping_description, Oscal::V1_2_1::MappingDescription.of_json(value))
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_to_coverage_coverage(instance, doc)
      current = instance.instance_variable_get(:@coverage)
      if current.is_a?(Array)
        doc["coverage"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["coverage"] = Oscal::V1_2_1::Coverage.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["coverage"] = val
        end
      end
    end

    def json_assembly_soa_from_mapping_resource_reference_source_resource(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::MappingResourceReference.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@mapping_resource_reference, parsed)
    end

    def json_assembly_soa_to_mapping_resource_reference_source_resource(instance, doc)
      current = instance.instance_variable_get(:@mapping_resource_reference)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::MappingResourceReference.as_json(item)
          else
            item
          end
        end
        doc["source-resource"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_mapping_resource_reference_target_resource(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::MappingResourceReference.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@mapping_resource_reference, parsed)
    end

    def json_from_coverage_coverage(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Coverage.of_json(v) }
        instance.instance_variable_set(:@coverage, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Coverage.new(content: "")
          instance.instance_variable_set(:@coverage, inst)
        else
          instance.instance_variable_set(:@coverage, Oscal::V1_2_1::Coverage.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@coverage, Oscal::V1_2_1::Coverage.of_json(value))
      end
    end

    def json_assembly_soa_from_gap_summary_source_gap_summary(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::GapSummary.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@gap_summary, parsed)
    end

    def json_assembly_soa_from_gap_summary_target_gap_summary(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::GapSummary.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@gap_summary, parsed)
    end

    def json_assembly_soa_to_gap_summary_target_gap_summary(instance, doc)
      current = instance.instance_variable_get(:@gap_summary)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::GapSummary.as_json(item)
          else
            item
          end
        end
        doc["target-gap-summary"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_to_mapping_resource_reference_target_resource(instance, doc)
      current = instance.instance_variable_get(:@mapping_resource_reference)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::MappingResourceReference.as_json(item)
          else
            item
          end
        end
        doc["target-resource"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_to_confidence_score_confidence_score(instance, doc)
      current = instance.instance_variable_get(:@confidence_score)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::ConfidenceScore.as_json(item)
          else
            item
          end
        end
        doc["confidence-score"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_confidence_score_confidence_score(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::ConfidenceScore.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@confidence_score, parsed)
    end

    def json_assembly_soa_to_gap_summary_source_gap_summary(instance, doc)
      current = instance.instance_variable_get(:@gap_summary)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::GapSummary.as_json(item)
          else
            item
          end
        end
        doc["source-gap-summary"] = result.length == 1 ? result.first : result
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class MappingResourceReference < Base
    attribute :ns, :string
    attribute :type, :string
    attribute :href, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true

    xml do
      element "mapping-resource-reference"
      ordered
      map_attribute "ns", to: :ns
      map_attribute "type", to: :type
      map_attribute "href", to: :href
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
    end

    key_value do
      map "ns", to: :ns
      map "type", to: :type
      map "href", to: :href
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class Map < Base
    attribute :uuid, :string
    attribute :ns, :string
    attribute :matching_rationale, :string
    attribute :coverage, :coverage
    attribute :remarks, :remarks
    attribute :mapping_item, :mapping_item, collection: true
    attribute :qualifier_item, :qualifier_item, collection: true
    attribute :confidence_score, :confidence_score
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :relationship, :string

    xml do
      element "map"
      ordered
      map_attribute "uuid", to: :uuid
      map_attribute "ns", to: :ns
      map_attribute "matching-rationale", to: :matching_rationale
      map_element "coverage", to: :coverage
      map_element "remarks", to: :remarks
      map_element "source", to: :mapping_item
      map_element "target", to: :mapping_item
      map_element "qualifier", to: :qualifier_item
      map_element "confidence-score", to: :confidence_score
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "relationship", to: :relationship
    end

    key_value do
      map "uuid", to: :uuid
      map "ns", to: :ns
      map "matching-rationale", to: :matching_rationale
      map "coverage", to: :coverage, with: { to: :json_to_coverage_coverage, from: :json_from_coverage_coverage }
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "sources", to: :mapping_item, render_empty: true
      map "targets", to: :mapping_item, render_empty: true
      map "qualifiers", to: :qualifier_item, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "relationship", to: :relationship, with: { to: :json_soa_to_relationship_relationship, from: :json_soa_from_relationship_relationship }
      map "confidence-score", to: :confidence_score, with: { to: :json_assembly_soa_to_confidence_score_confidence_score, from: :json_assembly_soa_from_confidence_score_confidence_score }
    end

    def json_from_coverage_coverage(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Coverage.of_json(v) }
        instance.instance_variable_set(:@coverage, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Coverage.new(content: "")
          instance.instance_variable_set(:@coverage, inst)
        else
          instance.instance_variable_set(:@coverage, Oscal::V1_2_1::Coverage.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@coverage, Oscal::V1_2_1::Coverage.of_json(value))
      end
    end

    def json_to_coverage_coverage(instance, doc)
      current = instance.instance_variable_get(:@coverage)
      if current.is_a?(Array)
        doc["coverage"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["coverage"] = Oscal::V1_2_1::Coverage.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["coverage"] = val
        end
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_soa_from_relationship_relationship(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              when String then [value]
              else return
              end
      parsed = items.map { |item| item.is_a?(Hash) ? item : item }
      instance.instance_variable_set(:@relationship, parsed)
    end

    def json_soa_to_relationship_relationship(instance, doc)
      current = instance.instance_variable_get(:@relationship)
      if current.is_a?(Array)
        result = current.map do |item|
          item.respond_to?(:to_h) ? item.to_h : item
        end
        doc["relationship"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_to_confidence_score_confidence_score(instance, doc)
      current = instance.instance_variable_get(:@confidence_score)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::ConfidenceScore.as_json(item)
          else
            item
          end
        end
        doc["confidence-score"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_confidence_score_confidence_score(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::ConfidenceScore.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@confidence_score, parsed)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class GapSummary < Base
    attribute :uuid, :string
    attribute :select_control_by_id, :select_control_by_id, collection: true

    xml do
      element "gap-summary"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "unmapped-controls", to: :select_control_by_id
    end

    key_value do
      map "uuid", to: :uuid
      map "unmapped-controls", to: :select_control_by_id, render_empty: true
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class ConfidenceScore < Base
    attribute :percentage, :percentage
    attribute :category, :string

    xml do
      element "confidence-score"
      ordered
      map_element "percentage", to: :percentage
      map_element "category", to: :category
    end

    key_value do
      map "percentage", to: :percentage, with: { to: :json_to_percentage_percentage, from: :json_from_percentage_percentage }
      map "category", to: :category, render_empty: true
    end

    def json_from_percentage_percentage(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Percentage.of_json(v) }
        instance.instance_variable_set(:@percentage, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Percentage.new(content: "")
          instance.instance_variable_set(:@percentage, inst)
        else
          instance.instance_variable_set(:@percentage, Oscal::V1_2_1::Percentage.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@percentage, Oscal::V1_2_1::Percentage.of_json(value))
      end
    end

    def json_to_percentage_percentage(instance, doc)
      current = instance.instance_variable_get(:@percentage)
      if current.is_a?(Array)
        doc["percentage"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["percentage"] = Oscal::V1_2_1::Percentage.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["percentage"] = val
        end
      end
    end
  end
  class MappingItem < Base
    attribute :type, :string
    attribute :id_ref, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true

    xml do
      element "mapping-item"
      ordered
      map_attribute "type", to: :type
      map_attribute "id-ref", to: :id_ref
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
    end

    key_value do
      map "type", to: :type
      map "id-ref", to: :id_ref
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class QualifierItem < Base
    attribute :subject, :string
    attribute :predicate, :string
    attribute :category, :string
    attribute :remarks, :remarks
    attribute :description, :qualifier_item_description

    xml do
      element "qualifier-item"
      ordered
      map_attribute "subject", to: :subject
      map_attribute "predicate", to: :predicate
      map_attribute "category", to: :category
      map_element "remarks", to: :remarks
      map_element "description", to: :description
    end

    key_value do
      map "subject", to: :subject
      map "predicate", to: :predicate
      map "category", to: :category
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "description", to: :description, render_empty: true
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class MappingProvenance < Base
    attribute :method_attr, :string
    attribute :matching_rationale, :string
    attribute :status, :string
    attribute :coverage, :coverage
    attribute :mapping_description, :mapping_description
    attribute :remarks, :remarks
    attribute :confidence_score, :confidence_score
    attribute :responsible_party, :responsible_party, collection: true
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true

    xml do
      element "mapping-provenance"
      ordered
      map_attribute "method", to: :method_attr
      map_attribute "matching-rationale", to: :matching_rationale
      map_attribute "status", to: :status
      map_element "coverage", to: :coverage
      map_element "mapping-description", to: :mapping_description
      map_element "remarks", to: :remarks
      map_element "confidence-score", to: :confidence_score
      map_element "responsible-party", to: :responsible_party
      map_element "prop", to: :property
      map_element "link", to: :link
    end

    key_value do
      map "method", to: :method_attr
      map "matching-rationale", to: :matching_rationale
      map "status", to: :status
      map "coverage", to: :coverage, with: { to: :json_to_coverage_coverage, from: :json_from_coverage_coverage }
      map "mapping-description", to: :mapping_description, with: { to: :json_to_mapping_description_mapping_description, from: :json_from_mapping_description_mapping_description }
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "responsible-parties", to: :responsible_party, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "confidence-score", to: :confidence_score, with: { to: :json_assembly_soa_to_confidence_score_confidence_score, from: :json_assembly_soa_from_confidence_score_confidence_score }
    end

    def json_from_coverage_coverage(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Coverage.of_json(v) }
        instance.instance_variable_set(:@coverage, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Coverage.new(content: "")
          instance.instance_variable_set(:@coverage, inst)
        else
          instance.instance_variable_set(:@coverage, Oscal::V1_2_1::Coverage.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@coverage, Oscal::V1_2_1::Coverage.of_json(value))
      end
    end

    def json_to_coverage_coverage(instance, doc)
      current = instance.instance_variable_get(:@coverage)
      if current.is_a?(Array)
        doc["coverage"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["coverage"] = Oscal::V1_2_1::Coverage.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["coverage"] = val
        end
      end
    end

    def json_from_mapping_description_mapping_description(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::MappingDescription.of_json(v) }
        instance.instance_variable_set(:@mapping_description, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::MappingDescription.new(content: "")
          instance.instance_variable_set(:@mapping_description, inst)
        else
          instance.instance_variable_set(:@mapping_description, Oscal::V1_2_1::MappingDescription.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@mapping_description, Oscal::V1_2_1::MappingDescription.of_json(value))
      end
    end

    def json_to_mapping_description_mapping_description(instance, doc)
      current = instance.instance_variable_get(:@mapping_description)
      if current.is_a?(Array)
        doc["mapping-description"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["mapping-description"] = Oscal::V1_2_1::MappingDescription.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["mapping-description"] = val
        end
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_assembly_soa_from_confidence_score_confidence_score(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::ConfidenceScore.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@confidence_score, parsed)
    end

    def json_assembly_soa_to_confidence_score_confidence_score(instance, doc)
      current = instance.instance_variable_get(:@confidence_score)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::ConfidenceScore.as_json(item)
          else
            item
          end
        end
        doc["confidence-score"] = result.length == 1 ? result.first : result
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class MappingCollection < Base
    attribute :uuid, :string
    attribute :metadata, :metadata
    attribute :mapping_provenance, :mapping_provenance
    attribute :mapping, :mapping, collection: true
    attribute :back_matter, :back_matter

    xml do
      element "mapping-collection"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "metadata", to: :metadata
      map_element "provenance", to: :mapping_provenance
      map_element "mapping", to: :mapping
      map_element "back-matter", to: :back_matter
    end

    key_value do
      map "uuid", to: :uuid
      map "metadata", to: :metadata, with: { to: :json_assembly_soa_to_metadata_metadata, from: :json_assembly_soa_from_metadata_metadata }
      map "provenance", to: :mapping_provenance, with: { to: :json_assembly_soa_to_mapping_provenance_provenance, from: :json_assembly_soa_from_mapping_provenance_provenance }
      map "mappings", to: :mapping, with: { to: :json_assembly_soa_to_mapping_mappings, from: :json_assembly_soa_from_mapping_mappings }
      map "back-matter", to: :back_matter, with: { to: :json_assembly_soa_to_back_matter_back_matter, from: :json_assembly_soa_from_back_matter_back_matter }
    end

    def json_assembly_soa_from_metadata_metadata(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::Metadata.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@metadata, parsed)
    end

    def json_assembly_soa_to_metadata_metadata(instance, doc)
      current = instance.instance_variable_get(:@metadata)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::Metadata.as_json(item)
          else
            item
          end
        end
        doc["metadata"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_back_matter_back_matter(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::BackMatter.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@back_matter, parsed)
    end

    def json_assembly_soa_to_back_matter_back_matter(instance, doc)
      current = instance.instance_variable_get(:@back_matter)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::BackMatter.as_json(item)
          else
            item
          end
        end
        doc["back-matter"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_mapping_provenance_provenance(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::MappingProvenance.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@mapping_provenance, parsed)
    end

    def json_assembly_soa_to_mapping_provenance_provenance(instance, doc)
      current = instance.instance_variable_get(:@mapping_provenance)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::MappingProvenance.as_json(item)
          else
            item
          end
        end
        doc["provenance"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_mapping_mappings(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::Mapping.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@mapping, parsed)
    end

    def json_assembly_soa_to_mapping_mappings(instance, doc)
      current = instance.instance_variable_get(:@mapping)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::Mapping.as_json(item)
          else
            item
          end
        end
        doc["mappings"] = result.length == 1 ? result.first : result
      end
    end

    def self.of_json(doc, options = {})
      if doc.is_a?(Hash) && doc.key?("mapping-collection")
        super(doc["mapping-collection"], options)
      else
        super(doc, options)
      end
    end

    def self.to_json(instance, options = {})
      json_str = super(instance, options)
      { "mapping-collection" => JSON.parse(json_str) }.to_json
    end

    def self.of_yaml(doc, options = {})
      if doc.is_a?(Hash) && doc.key?("mapping-collection")
        super(doc["mapping-collection"], options)
      else
        super(doc, options)
      end
    end

    def self.to_yaml(instance, options = {})
      yaml_str = super(instance, options)
      data = YAML.safe_load(yaml_str, permitted_classes: [Date, Time, Symbol])
      { "mapping-collection" => data }.to_yaml
    end

    def to_json(options = {})
      self.class.to_json(self, options)
    end

    def to_yaml(options = {})
      self.class.to_yaml(self, options)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class Profile < Base
    attribute :uuid, :string
    attribute :metadata, :metadata
    attribute :import, :import, collection: true
    attribute :merge, :merge
    attribute :modify, :modify
    attribute :back_matter, :back_matter

    xml do
      element "profile"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "metadata", to: :metadata
      map_element "import", to: :import
      map_element "merge", to: :merge
      map_element "modify", to: :modify
      map_element "back-matter", to: :back_matter
    end

    key_value do
      map "uuid", to: :uuid
      map "imports", to: :import, render_empty: true
      map "metadata", to: :metadata, with: { to: :json_assembly_soa_to_metadata_metadata, from: :json_assembly_soa_from_metadata_metadata }
      map "merge", to: :merge, with: { to: :json_assembly_soa_to_merge_merge, from: :json_assembly_soa_from_merge_merge }
      map "modify", to: :modify, with: { to: :json_assembly_soa_to_modify_modify, from: :json_assembly_soa_from_modify_modify }
      map "back-matter", to: :back_matter, with: { to: :json_assembly_soa_to_back_matter_back_matter, from: :json_assembly_soa_from_back_matter_back_matter }
    end

    def json_assembly_soa_to_metadata_metadata(instance, doc)
      current = instance.instance_variable_get(:@metadata)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::Metadata.as_json(item)
          else
            item
          end
        end
        doc["metadata"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_metadata_metadata(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::Metadata.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@metadata, parsed)
    end

    def json_assembly_soa_to_back_matter_back_matter(instance, doc)
      current = instance.instance_variable_get(:@back_matter)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::BackMatter.as_json(item)
          else
            item
          end
        end
        doc["back-matter"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_back_matter_back_matter(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::BackMatter.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@back_matter, parsed)
    end

    def json_assembly_soa_from_merge_merge(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::Merge.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@merge, parsed)
    end

    def json_assembly_soa_to_merge_merge(instance, doc)
      current = instance.instance_variable_get(:@merge)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::Merge.as_json(item)
          else
            item
          end
        end
        doc["merge"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_modify_modify(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::Modify.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@modify, parsed)
    end

    def json_assembly_soa_to_modify_modify(instance, doc)
      current = instance.instance_variable_get(:@modify)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::Modify.as_json(item)
          else
            item
          end
        end
        doc["modify"] = result.length == 1 ? result.first : result
      end
    end

    def self.of_json(doc, options = {})
      if doc.is_a?(Hash) && doc.key?("profile")
        super(doc["profile"], options)
      else
        super(doc, options)
      end
    end

    def self.to_json(instance, options = {})
      json_str = super(instance, options)
      { "profile" => JSON.parse(json_str) }.to_json
    end

    def self.of_yaml(doc, options = {})
      if doc.is_a?(Hash) && doc.key?("profile")
        super(doc["profile"], options)
      else
        super(doc, options)
      end
    end

    def self.to_yaml(instance, options = {})
      yaml_str = super(instance, options)
      data = YAML.safe_load(yaml_str, permitted_classes: [Date, Time, Symbol])
      { "profile" => data }.to_yaml
    end

    def to_json(options = {})
      self.class.to_json(self, options)
    end

    def to_yaml(options = {})
      self.class.to_yaml(self, options)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class Import < Base
    attribute :href, :string
    attribute :select_control_by_id, :select_control_by_id, collection: true
    attribute :include_all, :include_all

    xml do
      element "import"
      ordered
      map_attribute "href", to: :href
      map_element "exclude-controls", to: :select_control_by_id
      map_element "include-all", to: :include_all
      map_element "include-controls", to: :select_control_by_id
    end

    key_value do
      map "href", to: :href
      map "exclude-controls", to: :select_control_by_id, render_empty: true
      map "include-controls", to: :select_control_by_id, render_empty: true
      map "include-all", to: :include_all, with: { to: :json_assembly_soa_to_include_all_include_all, from: :json_assembly_soa_from_include_all_include_all }
    end

    def json_assembly_soa_from_include_all_include_all(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::IncludeAll.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@include_all, parsed)
    end

    def json_assembly_soa_to_include_all_include_all(instance, doc)
      current = instance.instance_variable_get(:@include_all)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::IncludeAll.as_json(item)
          else
            item
          end
        end
        doc["include-all"] = result.length == 1 ? result.first : result
      end
    end
  end
  class Merge < Base
    attribute :combine, :merge_combine
    attribute :flat, :merge_flat
    attribute :custom, :merge_custom
    attribute :as_is, :string

    xml do
      element "merge"
      ordered
      map_element "combine", to: :combine
      map_element "as-is", to: :as_is
      map_element "flat", to: :flat
      map_element "custom", to: :custom
    end

    key_value do
      map "as-is", to: :as_is, render_empty: true
      map "combine", to: :combine, with: { to: :json_assembly_soa_to_combine_combine, from: :json_assembly_soa_from_combine_combine }
      map "flat", to: :flat, with: { to: :json_assembly_soa_to_flat_flat, from: :json_assembly_soa_from_flat_flat }
      map "custom", to: :custom, with: { to: :json_assembly_soa_to_custom_custom, from: :json_assembly_soa_from_custom_custom }
    end

    def json_assembly_soa_from_combine_combine(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::MergeCombine.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@combine, parsed)
    end

    def json_assembly_soa_to_combine_combine(instance, doc)
      current = instance.instance_variable_get(:@combine)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::MergeCombine.as_json(item)
          else
            item
          end
        end
        doc["combine"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_flat_flat(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::MergeFlat.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@flat, parsed)
    end

    def json_assembly_soa_to_flat_flat(instance, doc)
      current = instance.instance_variable_get(:@flat)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::MergeFlat.as_json(item)
          else
            item
          end
        end
        doc["flat"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_custom_custom(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::MergeCustom.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@custom, parsed)
    end

    def json_assembly_soa_to_custom_custom(instance, doc)
      current = instance.instance_variable_get(:@custom)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::MergeCustom.as_json(item)
          else
            item
          end
        end
        doc["custom"] = result.length == 1 ? result.first : result
      end
    end
  end
  class Modify < Base
    attribute :set_parameter, :modify_set_parameter, collection: true
    attribute :alter, :modify_alter, collection: true

    xml do
      element "modify"
      ordered
      map_element "set-parameter", to: :set_parameter
      map_element "alter", to: :alter
    end

    key_value do
      map "set-parameters", to: :set_parameter, render_empty: true
      map "alters", to: :alter, render_empty: true
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end
  end
  class InsertControls < Base
    attribute :order, :string
    attribute :select_control_by_id, :select_control_by_id, collection: true
    attribute :include_all, :include_all

    xml do
      element "insert-controls"
      ordered
      map_attribute "order", to: :order
      map_element "exclude-controls", to: :select_control_by_id
      map_element "include-all", to: :include_all
      map_element "include-controls", to: :select_control_by_id
    end

    key_value do
      map "order", to: :order
      map "exclude-controls", to: :select_control_by_id, render_empty: true
      map "include-controls", to: :select_control_by_id, render_empty: true
      map "include-all", to: :include_all, with: { to: :json_assembly_soa_to_include_all_include_all, from: :json_assembly_soa_from_include_all_include_all }
    end

    def json_assembly_soa_from_include_all_include_all(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::IncludeAll.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@include_all, parsed)
    end

    def json_assembly_soa_to_include_all_include_all(instance, doc)
      current = instance.instance_variable_get(:@include_all)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::IncludeAll.as_json(item)
          else
            item
          end
        end
        doc["include-all"] = result.length == 1 ? result.first : result
      end
    end
  end
  class SystemComponent < Base
    attribute :uuid, :string
    attribute :system_component_type, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :responsible_role, :responsible_role, collection: true
    attribute :protocol, :protocol, collection: true
    attribute :title, :system_component_title
    attribute :description, :system_component_description
    attribute :purpose, :system_component_purpose
    attribute :status, :system_component_status

    xml do
      element "system-component"
      ordered
      map_attribute "uuid", to: :uuid
      map_attribute "system-component-type", to: :system_component_type
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "responsible-role", to: :responsible_role
      map_element "protocol", to: :protocol
      map_element "title", to: :title
      map_element "description", to: :description
      map_element "purpose", to: :purpose
      map_element "status", to: :status
    end

    key_value do
      map "uuid", to: :uuid
      map "system-component-type", to: :system_component_type
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "title", to: :title, render_empty: true
      map "description", to: :description, render_empty: true
      map "purpose", to: :purpose, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "responsible-roles", to: :responsible_role, render_empty: true
      map "protocols", to: :protocol, render_empty: true
      map "status", to: :status, with: { to: :json_assembly_soa_to_status_status, from: :json_assembly_soa_from_status_status }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_assembly_soa_from_status_status(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::SystemComponentStatus.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@status, parsed)
    end

    def json_assembly_soa_to_status_status(instance, doc)
      current = instance.instance_variable_get(:@status)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::SystemComponentStatus.as_json(item)
          else
            item
          end
        end
        doc["status"] = result.length == 1 ? result.first : result
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class Protocol < Base
    attribute :uuid, :string
    attribute :name, :string
    attribute :port_range, :port_range, collection: true
    attribute :title, :protocol_title

    xml do
      element "protocol"
      ordered
      map_attribute "uuid", to: :uuid
      map_attribute "name", to: :name
      map_element "port-range", to: :port_range
      map_element "title", to: :title
    end

    key_value do
      map "uuid", to: :uuid
      map "name", to: :name
      map "title", to: :title, render_empty: true
      map "port-ranges", to: :port_range, render_empty: true
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end
  end
  class PortRange < Base
    attribute :start, :string
    attribute :end, :string
    attribute :transport, :string
    attribute :remarks, :remarks

    xml do
      element "port-range"
      ordered
      map_attribute "start", to: :start
      map_attribute "end", to: :end
      map_attribute "transport", to: :transport
      map_element "remarks", to: :remarks
    end

    key_value do
      map "start", to: :start
      map "end", to: :end
      map "transport", to: :transport
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class ImplementationStatus < Base
    attribute :state, :string
    attribute :remarks, :remarks

    xml do
      element "implementation-status"
      ordered
      map_attribute "state", to: :state
      map_element "remarks", to: :remarks
    end

    key_value do
      map "state", to: :state
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class SystemUser < Base
    attribute :uuid, :string
    attribute :role_id, :role_id, collection: true
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :authorized_privilege, :authorized_privilege, collection: true
    attribute :title, :system_user_title
    attribute :short_name, :string
    attribute :description, :system_user_description

    xml do
      element "system-user"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "role-id", to: :role_id
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "authorized-privilege", to: :authorized_privilege
      map_element "title", to: :title
      map_element "short-name", to: :short_name
      map_element "description", to: :description
    end

    key_value do
      map "uuid", to: :uuid
      map "role-ids", to: :role_id, with: { to: :json_to_role_id_role_ids, from: :json_from_role_id_role_ids }
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "title", to: :title, render_empty: true
      map "short-name", to: :short_name, render_empty: true
      map "description", to: :description, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "authorized-privileges", to: :authorized_privilege, render_empty: true
    end

    def json_to_role_id_role_ids(instance, doc)
      current = instance.instance_variable_get(:@role_id)
      if current.is_a?(Array)
        doc["role-ids"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["role-ids"] = Oscal::V1_2_1::RoleId.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["role-ids"] = val
        end
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_from_role_id_role_ids(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::RoleId.of_json(v) }
        instance.instance_variable_set(:@role_id, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::RoleId.new(content: "")
          instance.instance_variable_set(:@role_id, inst)
        else
          instance.instance_variable_set(:@role_id, Oscal::V1_2_1::RoleId.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@role_id, Oscal::V1_2_1::RoleId.of_json(value))
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class AuthorizedPrivilege < Base
    attribute :function_performed, :function_performed, collection: true
    attribute :title, :authorized_privilege_title
    attribute :description, :authorized_privilege_description

    xml do
      element "authorized-privilege"
      ordered
      map_element "function-performed", to: :function_performed
      map_element "title", to: :title
      map_element "description", to: :description
    end

    key_value do
      map "functions-performed", to: :function_performed, with: { to: :json_to_function_performed_functions_performed, from: :json_from_function_performed_functions_performed }
      map "title", to: :title, render_empty: true
      map "description", to: :description, render_empty: true
    end

    def json_from_function_performed_functions_performed(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::FunctionPerformed.of_json(v) }
        instance.instance_variable_set(:@function_performed, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::FunctionPerformed.new(content: "")
          instance.instance_variable_set(:@function_performed, inst)
        else
          instance.instance_variable_set(:@function_performed, Oscal::V1_2_1::FunctionPerformed.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@function_performed, Oscal::V1_2_1::FunctionPerformed.of_json(value))
      end
    end

    def json_to_function_performed_functions_performed(instance, doc)
      current = instance.instance_variable_get(:@function_performed)
      if current.is_a?(Array)
        doc["functions-performed"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["functions-performed"] = Oscal::V1_2_1::FunctionPerformed.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["functions-performed"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class InventoryItem < Base
    attribute :uuid, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :responsible_party, :responsible_party, collection: true
    attribute :description, :inventory_item_description
    attribute :implemented_component, :inventory_item_implemented_component, collection: true

    xml do
      element "inventory-item"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "responsible-party", to: :responsible_party
      map_element "description", to: :description
      map_element "implemented-component", to: :implemented_component
    end

    key_value do
      map "uuid", to: :uuid
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "description", to: :description, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "responsible-parties", to: :responsible_party, render_empty: true
      map "implemented-components", to: :implemented_component, render_empty: true
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class SetParameter < Base
    attribute :param_id, :string
    attribute :remarks, :remarks
    attribute :value, :string, collection: true

    xml do
      element "set-parameter"
      ordered
      map_attribute "param-id", to: :param_id
      map_element "remarks", to: :remarks
      map_element "value", to: :value
    end

    key_value do
      map "param-id", to: :param_id
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "value", to: :value, render_empty: true
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class ComponentDefinition < Base
    attribute :uuid, :string
    attribute :metadata, :metadata
    attribute :import_component_definition, :import_component_definition, collection: true
    attribute :defined_component, :defined_component, collection: true
    attribute :capability, :capability, collection: true
    attribute :back_matter, :back_matter

    xml do
      element "component-definition"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "metadata", to: :metadata
      map_element "import-component-definition", to: :import_component_definition
      map_element "component", to: :defined_component
      map_element "capability", to: :capability
      map_element "back-matter", to: :back_matter
    end

    key_value do
      map "uuid", to: :uuid
      map "import-component-definitions", to: :import_component_definition, render_empty: true
      map "components", to: :defined_component, render_empty: true
      map "capabilities", to: :capability, render_empty: true
      map "metadata", to: :metadata, with: { to: :json_assembly_soa_to_metadata_metadata, from: :json_assembly_soa_from_metadata_metadata }
      map "back-matter", to: :back_matter, with: { to: :json_assembly_soa_to_back_matter_back_matter, from: :json_assembly_soa_from_back_matter_back_matter }
    end

    def json_assembly_soa_from_metadata_metadata(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::Metadata.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@metadata, parsed)
    end

    def json_assembly_soa_to_metadata_metadata(instance, doc)
      current = instance.instance_variable_get(:@metadata)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::Metadata.as_json(item)
          else
            item
          end
        end
        doc["metadata"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_back_matter_back_matter(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::BackMatter.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@back_matter, parsed)
    end

    def json_assembly_soa_to_back_matter_back_matter(instance, doc)
      current = instance.instance_variable_get(:@back_matter)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::BackMatter.as_json(item)
          else
            item
          end
        end
        doc["back-matter"] = result.length == 1 ? result.first : result
      end
    end

    def self.of_json(doc, options = {})
      if doc.is_a?(Hash) && doc.key?("component-definition")
        super(doc["component-definition"], options)
      else
        super(doc, options)
      end
    end

    def self.to_json(instance, options = {})
      json_str = super(instance, options)
      { "component-definition" => JSON.parse(json_str) }.to_json
    end

    def self.of_yaml(doc, options = {})
      if doc.is_a?(Hash) && doc.key?("component-definition")
        super(doc["component-definition"], options)
      else
        super(doc, options)
      end
    end

    def self.to_yaml(instance, options = {})
      yaml_str = super(instance, options)
      data = YAML.safe_load(yaml_str, permitted_classes: [Date, Time, Symbol])
      { "component-definition" => data }.to_yaml
    end

    def to_json(options = {})
      self.class.to_json(self, options)
    end

    def to_yaml(options = {})
      self.class.to_yaml(self, options)
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class ImportComponentDefinition < Base
    attribute :href, :string
    attribute :remarks, :remarks

    xml do
      element "import-component-definition"
      ordered
      map_attribute "href", to: :href
      map_element "remarks", to: :remarks
    end

    key_value do
      map "href", to: :href
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class DefinedComponent < Base
    attribute :uuid, :string
    attribute :defined_component_type, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :responsible_role, :responsible_role, collection: true
    attribute :protocol, :protocol, collection: true
    attribute :control_implementation, :control_implementation, collection: true
    attribute :title, :defined_component_title
    attribute :description, :defined_component_description
    attribute :purpose, :defined_component_purpose

    xml do
      element "defined-component"
      ordered
      map_attribute "uuid", to: :uuid
      map_attribute "defined-component-type", to: :defined_component_type
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "responsible-role", to: :responsible_role
      map_element "protocol", to: :protocol
      map_element "control-implementation", to: :control_implementation
      map_element "title", to: :title
      map_element "description", to: :description
      map_element "purpose", to: :purpose
    end

    key_value do
      map "uuid", to: :uuid
      map "defined-component-type", to: :defined_component_type
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "title", to: :title, render_empty: true
      map "description", to: :description, render_empty: true
      map "purpose", to: :purpose, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "responsible-roles", to: :responsible_role, render_empty: true
      map "protocols", to: :protocol, render_empty: true
      map "control-implementations", to: :control_implementation, render_empty: true
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class Capability < Base
    attribute :uuid, :string
    attribute :name, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :incorporates_component, :incorporates_component, collection: true
    attribute :control_implementation, :control_implementation, collection: true
    attribute :description, :capability_description

    xml do
      element "capability"
      ordered
      map_attribute "uuid", to: :uuid
      map_attribute "name", to: :name
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "incorporates-component", to: :incorporates_component
      map_element "control-implementation", to: :control_implementation
      map_element "description", to: :description
    end

    key_value do
      map "uuid", to: :uuid
      map "name", to: :name
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "description", to: :description, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "incorporates-components", to: :incorporates_component, render_empty: true
      map "control-implementations", to: :control_implementation, render_empty: true
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class ControlImplementation < Base
    attribute :uuid, :string
    attribute :source, :string
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :set_parameter, :set_parameter, collection: true
    attribute :implemented_requirement, :implemented_requirement, collection: true
    attribute :description, :control_implementation_description

    xml do
      element "control-implementation"
      ordered
      map_attribute "uuid", to: :uuid
      map_attribute "source", to: :source
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "set-parameter", to: :set_parameter
      map_element "implemented-requirement", to: :implemented_requirement
      map_element "description", to: :description
    end

    key_value do
      map "uuid", to: :uuid
      map "source", to: :source
      map "description", to: :description, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "set-parameters", to: :set_parameter, render_empty: true
      map "implemented-requirements", to: :implemented_requirement, render_empty: true
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class IncorporatesComponent < Base
    attribute :component_uuid, :string
    attribute :description, :incorporates_component_description

    xml do
      element "incorporates-component"
      ordered
      map_attribute "component-uuid", to: :component_uuid
      map_element "description", to: :description
    end

    key_value do
      map "component-uuid", to: :component_uuid
      map "description", to: :description, render_empty: true
    end
  end
  class ImplementedRequirement < Base
    attribute :uuid, :string
    attribute :control_id, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :set_parameter, :set_parameter, collection: true
    attribute :responsible_role, :responsible_role, collection: true
    attribute :statement, :statement, collection: true
    attribute :description, :implemented_requirement_description

    xml do
      element "implemented-requirement"
      ordered
      map_attribute "uuid", to: :uuid
      map_attribute "control-id", to: :control_id
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "set-parameter", to: :set_parameter
      map_element "responsible-role", to: :responsible_role
      map_element "statement", to: :statement
      map_element "description", to: :description
    end

    key_value do
      map "uuid", to: :uuid
      map "control-id", to: :control_id
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "description", to: :description, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "set-parameters", to: :set_parameter, render_empty: true
      map "responsible-roles", to: :responsible_role, render_empty: true
      map "statements", to: :statement, render_empty: true
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class Statement < Base
    attribute :uuid, :string
    attribute :statement_id, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :responsible_role, :responsible_role, collection: true
    attribute :description, :statement_description

    xml do
      element "statement"
      ordered
      map_attribute "uuid", to: :uuid
      map_attribute "statement-id", to: :statement_id
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "responsible-role", to: :responsible_role
      map_element "description", to: :description
    end

    key_value do
      map "uuid", to: :uuid
      map "statement-id", to: :statement_id
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "description", to: :description, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "responsible-roles", to: :responsible_role, render_empty: true
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class SystemSecurityPlan < Base
    attribute :uuid, :string
    attribute :metadata, :metadata
    attribute :import_profile, :import_profile
    attribute :system_characteristics, :system_characteristics
    attribute :system_implementation, :system_implementation
    attribute :control_implementation, :control_implementation
    attribute :back_matter, :back_matter

    xml do
      element "system-security-plan"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "metadata", to: :metadata
      map_element "import-profile", to: :import_profile
      map_element "system-characteristics", to: :system_characteristics
      map_element "system-implementation", to: :system_implementation
      map_element "control-implementation", to: :control_implementation
      map_element "back-matter", to: :back_matter
    end

    key_value do
      map "uuid", to: :uuid
      map "metadata", to: :metadata, with: { to: :json_assembly_soa_to_metadata_metadata, from: :json_assembly_soa_from_metadata_metadata }
      map "import-profile", to: :import_profile, with: { to: :json_assembly_soa_to_import_profile_import_profile, from: :json_assembly_soa_from_import_profile_import_profile }
      map "system-characteristics", to: :system_characteristics, with: { to: :json_assembly_soa_to_system_characteristics_system_characteristics, from: :json_assembly_soa_from_system_characteristics_system_characteristics }
      map "system-implementation", to: :system_implementation, with: { to: :json_assembly_soa_to_system_implementation_system_implementation, from: :json_assembly_soa_from_system_implementation_system_implementation }
      map "control-implementation", to: :control_implementation, with: { to: :json_assembly_soa_to_control_implementation_control_implementation, from: :json_assembly_soa_from_control_implementation_control_implementation }
      map "back-matter", to: :back_matter, with: { to: :json_assembly_soa_to_back_matter_back_matter, from: :json_assembly_soa_from_back_matter_back_matter }
    end

    def json_assembly_soa_from_metadata_metadata(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::Metadata.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@metadata, parsed)
    end

    def json_assembly_soa_to_metadata_metadata(instance, doc)
      current = instance.instance_variable_get(:@metadata)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::Metadata.as_json(item)
          else
            item
          end
        end
        doc["metadata"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_back_matter_back_matter(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::BackMatter.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@back_matter, parsed)
    end

    def json_assembly_soa_to_back_matter_back_matter(instance, doc)
      current = instance.instance_variable_get(:@back_matter)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::BackMatter.as_json(item)
          else
            item
          end
        end
        doc["back-matter"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_import_profile_import_profile(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::ImportProfile.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@import_profile, parsed)
    end

    def json_assembly_soa_from_system_characteristics_system_characteristics(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::SystemCharacteristics.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@system_characteristics, parsed)
    end

    def json_assembly_soa_to_system_characteristics_system_characteristics(instance, doc)
      current = instance.instance_variable_get(:@system_characteristics)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::SystemCharacteristics.as_json(item)
          else
            item
          end
        end
        doc["system-characteristics"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_system_implementation_system_implementation(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::SystemImplementation.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@system_implementation, parsed)
    end

    def json_assembly_soa_to_system_implementation_system_implementation(instance, doc)
      current = instance.instance_variable_get(:@system_implementation)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::SystemImplementation.as_json(item)
          else
            item
          end
        end
        doc["system-implementation"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_control_implementation_control_implementation(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::ControlImplementation.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@control_implementation, parsed)
    end

    def json_assembly_soa_to_import_profile_import_profile(instance, doc)
      current = instance.instance_variable_get(:@import_profile)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::ImportProfile.as_json(item)
          else
            item
          end
        end
        doc["import-profile"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_to_control_implementation_control_implementation(instance, doc)
      current = instance.instance_variable_get(:@control_implementation)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::ControlImplementation.as_json(item)
          else
            item
          end
        end
        doc["control-implementation"] = result.length == 1 ? result.first : result
      end
    end

    def self.of_json(doc, options = {})
      if doc.is_a?(Hash) && doc.key?("system-security-plan")
        super(doc["system-security-plan"], options)
      else
        super(doc, options)
      end
    end

    def self.to_json(instance, options = {})
      json_str = super(instance, options)
      { "system-security-plan" => JSON.parse(json_str) }.to_json
    end

    def self.of_yaml(doc, options = {})
      if doc.is_a?(Hash) && doc.key?("system-security-plan")
        super(doc["system-security-plan"], options)
      else
        super(doc, options)
      end
    end

    def self.to_yaml(instance, options = {})
      yaml_str = super(instance, options)
      data = YAML.safe_load(yaml_str, permitted_classes: [Date, Time, Symbol])
      { "system-security-plan" => data }.to_yaml
    end

    def to_json(options = {})
      self.class.to_json(self, options)
    end

    def to_yaml(options = {})
      self.class.to_yaml(self, options)
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class ImportProfile < Base
    attribute :href, :string
    attribute :remarks, :remarks

    xml do
      element "import-profile"
      ordered
      map_attribute "href", to: :href
      map_element "remarks", to: :remarks
    end

    key_value do
      map "href", to: :href
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class SystemCharacteristics < Base
    attribute :system_id, :system_id, collection: true
    attribute :date_authorized, :date_authorized
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :system_information, :system_information
    attribute :security_impact_level, :security_impact_level
    attribute :status, :status
    attribute :authorization_boundary, :authorization_boundary
    attribute :network_architecture, :network_architecture
    attribute :data_flow, :data_flow
    attribute :responsible_party, :responsible_party, collection: true
    attribute :system_name, :string
    attribute :system_name_short, :string
    attribute :description, :system_characteristics_description
    attribute :security_sensitivity_level, :string

    xml do
      element "system-characteristics"
      ordered
      map_element "system-id", to: :system_id
      map_element "date-authorized", to: :date_authorized
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "system-information", to: :system_information
      map_element "security-impact-level", to: :security_impact_level
      map_element "status", to: :status
      map_element "authorization-boundary", to: :authorization_boundary
      map_element "network-architecture", to: :network_architecture
      map_element "data-flow", to: :data_flow
      map_element "responsible-party", to: :responsible_party
      map_element "system-name", to: :system_name
      map_element "system-name-short", to: :system_name_short
      map_element "description", to: :description
      map_element "security-sensitivity-level", to: :security_sensitivity_level
    end

    key_value do
      map "date-authorized", to: :date_authorized, with: { to: :json_to_date_authorized_date_authorized, from: :json_from_date_authorized_date_authorized }
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "system-name", to: :system_name, render_empty: true
      map "system-name-short", to: :system_name_short, render_empty: true
      map "description", to: :description, render_empty: true
      map "security-sensitivity-level", to: :security_sensitivity_level, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "responsible-parties", to: :responsible_party, render_empty: true
      map "system-ids", to: :system_id, with: { to: :json_soa_to_system_id_system_ids, from: :json_soa_from_system_id_system_ids }
      map "system-id", to: :system_id, with: { to: :json_soa_to_system_id_system_ids, from: :json_soa_from_system_id_system_ids }
      map "system-information", to: :system_information, with: { to: :json_assembly_soa_to_system_information_system_information, from: :json_assembly_soa_from_system_information_system_information }
      map "security-impact-level", to: :security_impact_level, with: { to: :json_assembly_soa_to_security_impact_level_security_impact_level, from: :json_assembly_soa_from_security_impact_level_security_impact_level }
      map "status", to: :status, with: { to: :json_assembly_soa_to_status_status, from: :json_assembly_soa_from_status_status }
      map "authorization-boundary", to: :authorization_boundary, with: { to: :json_assembly_soa_to_authorization_boundary_authorization_boundary, from: :json_assembly_soa_from_authorization_boundary_authorization_boundary }
      map "network-architecture", to: :network_architecture, with: { to: :json_assembly_soa_to_network_architecture_network_architecture, from: :json_assembly_soa_from_network_architecture_network_architecture }
      map "data-flow", to: :data_flow, with: { to: :json_assembly_soa_to_data_flow_data_flow, from: :json_assembly_soa_from_data_flow_data_flow }
    end

    def json_assembly_soa_to_system_information_system_information(instance, doc)
      current = instance.instance_variable_get(:@system_information)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::SystemInformation.as_json(item)
          else
            item
          end
        end
        doc["system-information"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_security_impact_level_security_impact_level(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::SecurityImpactLevel.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@security_impact_level, parsed)
    end

    def json_assembly_soa_to_security_impact_level_security_impact_level(instance, doc)
      current = instance.instance_variable_get(:@security_impact_level)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::SecurityImpactLevel.as_json(item)
          else
            item
          end
        end
        doc["security-impact-level"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_authorization_boundary_authorization_boundary(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::AuthorizationBoundary.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@authorization_boundary, parsed)
    end

    def json_assembly_soa_to_authorization_boundary_authorization_boundary(instance, doc)
      current = instance.instance_variable_get(:@authorization_boundary)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::AuthorizationBoundary.as_json(item)
          else
            item
          end
        end
        doc["authorization-boundary"] = result.length == 1 ? result.first : result
      end
    end

    def json_from_date_authorized_date_authorized(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::DateAuthorized.of_json(v) }
        instance.instance_variable_set(:@date_authorized, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::DateAuthorized.new(content: "")
          instance.instance_variable_set(:@date_authorized, inst)
        else
          instance.instance_variable_set(:@date_authorized, Oscal::V1_2_1::DateAuthorized.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@date_authorized, Oscal::V1_2_1::DateAuthorized.of_json(value))
      end
    end

    def json_assembly_soa_to_network_architecture_network_architecture(instance, doc)
      current = instance.instance_variable_get(:@network_architecture)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::NetworkArchitecture.as_json(item)
          else
            item
          end
        end
        doc["network-architecture"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_network_architecture_network_architecture(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::NetworkArchitecture.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@network_architecture, parsed)
    end

    def json_assembly_soa_to_data_flow_data_flow(instance, doc)
      current = instance.instance_variable_get(:@data_flow)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::DataFlow.as_json(item)
          else
            item
          end
        end
        doc["data-flow"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_data_flow_data_flow(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::DataFlow.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@data_flow, parsed)
    end

    def json_assembly_soa_from_status_status(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::Status.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@status, parsed)
    end

    def json_assembly_soa_to_status_status(instance, doc)
      current = instance.instance_variable_get(:@status)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::Status.as_json(item)
          else
            item
          end
        end
        doc["status"] = result.length == 1 ? result.first : result
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_to_date_authorized_date_authorized(instance, doc)
      current = instance.instance_variable_get(:@date_authorized)
      if current.is_a?(Array)
        doc["date-authorized"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["date-authorized"] = Oscal::V1_2_1::DateAuthorized.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["date-authorized"] = val
        end
      end
    end

    def json_soa_from_system_id_system_ids(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              when String then [value]
              else return
              end
      parsed = items.map do |item|
        case item
        when Hash then Oscal::V1_2_1::SystemId.of_json(item)
        when String then Oscal::V1_2_1::SystemId.of_json(item)
        else item
        end
      end
      instance.instance_variable_set(:@system_id, parsed)
    end

    def json_soa_to_system_id_system_ids(instance, doc)
      current = instance.instance_variable_get(:@system_id)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::SystemId.as_json(item)
          else
            item
          end
        end
        doc["system-ids"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_system_information_system_information(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::SystemInformation.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@system_information, parsed)
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class SystemImplementation < Base
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :system_user, :system_user, collection: true
    attribute :system_component, :system_component, collection: true
    attribute :inventory_item, :inventory_item, collection: true
    attribute :leveraged_authorization, :system_implementation_leveraged_authorization, collection: true

    xml do
      element "system-implementation"
      ordered
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "user", to: :system_user
      map_element "component", to: :system_component
      map_element "inventory-item", to: :inventory_item
      map_element "leveraged-authorization", to: :leveraged_authorization
    end

    key_value do
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "users", to: :system_user, render_empty: true
      map "components", to: :system_component, render_empty: true
      map "inventory-items", to: :inventory_item, render_empty: true
      map "leveraged-authorizations", to: :leveraged_authorization, render_empty: true
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class SystemInformation < Base
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :information_type, :system_information_information_type, collection: true

    xml do
      element "system-information"
      ordered
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "information-type", to: :information_type
    end

    key_value do
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "information-types", to: :information_type, render_empty: true
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end
  end
  class SecurityImpactLevel < Base
    attribute :security_objective_confidentiality, :string
    attribute :security_objective_integrity, :string
    attribute :security_objective_availability, :string

    xml do
      element "security-impact-level"
      ordered
      map_element "security-objective-confidentiality", to: :security_objective_confidentiality
      map_element "security-objective-integrity", to: :security_objective_integrity
      map_element "security-objective-availability", to: :security_objective_availability
    end

    key_value do
      map "security-objective-confidentiality", to: :security_objective_confidentiality, render_empty: true
      map "security-objective-integrity", to: :security_objective_integrity, render_empty: true
      map "security-objective-availability", to: :security_objective_availability, render_empty: true
    end
  end
  class Status < Base
    attribute :state, :string
    attribute :remarks, :remarks

    xml do
      element "status"
      ordered
      map_attribute "state", to: :state
      map_element "remarks", to: :remarks
    end

    key_value do
      map "state", to: :state
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class AuthorizationBoundary < Base
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :diagram, :diagram, collection: true
    attribute :description, :authorization_boundary_description

    xml do
      element "authorization-boundary"
      ordered
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "diagram", to: :diagram
      map_element "description", to: :description
    end

    key_value do
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "description", to: :description, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "diagrams", to: :diagram, render_empty: true
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class NetworkArchitecture < Base
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :diagram, :diagram, collection: true
    attribute :description, :network_architecture_description

    xml do
      element "network-architecture"
      ordered
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "diagram", to: :diagram
      map_element "description", to: :description
    end

    key_value do
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "description", to: :description, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "diagrams", to: :diagram, render_empty: true
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class DataFlow < Base
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :diagram, :diagram, collection: true
    attribute :description, :data_flow_description

    xml do
      element "data-flow"
      ordered
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "diagram", to: :diagram
      map_element "description", to: :description
    end

    key_value do
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "description", to: :description, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "diagrams", to: :diagram, render_empty: true
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class Impact < Base
    attribute :base, :base_field
    attribute :selected, :selected
    attribute :adjustment_justification, :adjustment_justification
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true

    xml do
      element "impact"
      ordered
      map_element "base", to: :base
      map_element "selected", to: :selected
      map_element "adjustment-justification", to: :adjustment_justification
      map_element "prop", to: :property
      map_element "link", to: :link
    end

    key_value do
      map "base", to: :base, with: { to: :json_to_base_base, from: :json_from_base_base }
      map "selected", to: :selected, with: { to: :json_to_selected_selected, from: :json_from_selected_selected }
      map "adjustment-justification", to: :adjustment_justification, with: { to: :json_to_adjustment_justification_adjustment_justification, from: :json_from_adjustment_justification_adjustment_justification }
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
    end

    def json_from_adjustment_justification_adjustment_justification(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::AdjustmentJustification.of_json(v) }
        instance.instance_variable_set(:@adjustment_justification, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::AdjustmentJustification.new(content: "")
          instance.instance_variable_set(:@adjustment_justification, inst)
        else
          instance.instance_variable_set(:@adjustment_justification, Oscal::V1_2_1::AdjustmentJustification.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@adjustment_justification, Oscal::V1_2_1::AdjustmentJustification.of_json(value))
      end
    end

    def json_from_base_base(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::BaseField.of_json(v) }
        instance.instance_variable_set(:@base, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::BaseField.new(content: "")
          instance.instance_variable_set(:@base, inst)
        else
          instance.instance_variable_set(:@base, Oscal::V1_2_1::BaseField.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@base, Oscal::V1_2_1::BaseField.of_json(value))
      end
    end

    def json_to_base_base(instance, doc)
      current = instance.instance_variable_get(:@base)
      if current.is_a?(Array)
        doc["base"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["base"] = Oscal::V1_2_1::BaseField.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["base"] = val
        end
      end
    end

    def json_from_selected_selected(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Selected.of_json(v) }
        instance.instance_variable_set(:@selected, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Selected.new(content: "")
          instance.instance_variable_set(:@selected, inst)
        else
          instance.instance_variable_set(:@selected, Oscal::V1_2_1::Selected.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@selected, Oscal::V1_2_1::Selected.of_json(value))
      end
    end

    def json_to_selected_selected(instance, doc)
      current = instance.instance_variable_get(:@selected)
      if current.is_a?(Array)
        doc["selected"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["selected"] = Oscal::V1_2_1::Selected.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["selected"] = val
        end
      end
    end

    def json_to_adjustment_justification_adjustment_justification(instance, doc)
      current = instance.instance_variable_get(:@adjustment_justification)
      if current.is_a?(Array)
        doc["adjustment-justification"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["adjustment-justification"] = Oscal::V1_2_1::AdjustmentJustification.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["adjustment-justification"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class Diagram < Base
    attribute :uuid, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :description, :diagram_description
    attribute :caption, :diagram_caption

    xml do
      element "diagram"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "description", to: :description
      map_element "caption", to: :caption
    end

    key_value do
      map "uuid", to: :uuid
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "description", to: :description, render_empty: true
      map "caption", to: :caption, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class ByComponent < Base
    attribute :component_uuid, :string
    attribute :uuid, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :set_parameter, :set_parameter, collection: true
    attribute :implementation_status, :implementation_status
    attribute :responsible_role, :responsible_role, collection: true
    attribute :description, :by_component_description
    attribute :export, :by_component_export
    attribute :inherited, :by_component_inherited, collection: true
    attribute :satisfied, :by_component_satisfied, collection: true

    xml do
      element "by-component"
      ordered
      map_attribute "component-uuid", to: :component_uuid
      map_attribute "uuid", to: :uuid
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "set-parameter", to: :set_parameter
      map_element "implementation-status", to: :implementation_status
      map_element "responsible-role", to: :responsible_role
      map_element "description", to: :description
      map_element "export", to: :export
      map_element "inherited", to: :inherited
      map_element "satisfied", to: :satisfied
    end

    key_value do
      map "component-uuid", to: :component_uuid
      map "uuid", to: :uuid
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "description", to: :description, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "set-parameters", to: :set_parameter, render_empty: true
      map "responsible-roles", to: :responsible_role, render_empty: true
      map "inherited", to: :inherited, render_empty: true
      map "satisfied", to: :satisfied, render_empty: true
      map "implementation-status", to: :implementation_status, with: { to: :json_assembly_soa_to_implementation_status_implementation_status, from: :json_assembly_soa_from_implementation_status_implementation_status }
      map "export", to: :export, with: { to: :json_assembly_soa_to_export_export, from: :json_assembly_soa_from_export_export }
    end

    def json_assembly_soa_from_implementation_status_implementation_status(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::ImplementationStatus.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@implementation_status, parsed)
    end

    def json_assembly_soa_from_export_export(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::ByComponentExport.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@export, parsed)
    end

    def json_assembly_soa_to_export_export(instance, doc)
      current = instance.instance_variable_get(:@export)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::ByComponentExport.as_json(item)
          else
            item
          end
        end
        doc["export"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_to_implementation_status_implementation_status(instance, doc)
      current = instance.instance_variable_get(:@implementation_status)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::ImplementationStatus.as_json(item)
          else
            item
          end
        end
        doc["implementation-status"] = result.length == 1 ? result.first : result
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class ImportSsp < Base
    attribute :href, :string
    attribute :remarks, :remarks

    xml do
      element "import-ssp"
      ordered
      map_attribute "href", to: :href
      map_element "remarks", to: :remarks
    end

    key_value do
      map "href", to: :href
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class LocalObjective < Base
    attribute :control_id, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :part, :part, collection: true
    attribute :description, :local_objective_description

    xml do
      element "local-objective"
      ordered
      map_attribute "control-id", to: :control_id
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "part", to: :part
      map_element "description", to: :description
    end

    key_value do
      map "control-id", to: :control_id
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "description", to: :description, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "parts", to: :part, render_empty: true
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class AssessmentMethod < Base
    attribute :uuid, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :assessment_part, :assessment_part
    attribute :description, :assessment_method_description

    xml do
      element "assessment-method"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "part", to: :assessment_part
      map_element "description", to: :description
    end

    key_value do
      map "uuid", to: :uuid
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "description", to: :description, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "assessment-part", to: :assessment_part, with: { to: :json_assembly_soa_to_assessment_part_assessment_part, from: :json_assembly_soa_from_assessment_part_assessment_part }
    end

    def json_assembly_soa_to_assessment_part_assessment_part(instance, doc)
      current = instance.instance_variable_get(:@assessment_part)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::AssessmentPart.as_json(item)
          else
            item
          end
        end
        doc["assessment-part"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_assessment_part_assessment_part(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::AssessmentPart.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@assessment_part, parsed)
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class AssessmentPart < Base
    attribute :uuid, :string
    attribute :name, :string
    attribute :ns, :string
    attribute :class_attr, :string
    attribute :property, :property, collection: true
    attribute :assessment_part, :assessment_part, collection: true
    attribute :link, :link, collection: true
    attribute :title, :assessment_part_title
    attribute :prose, :assessment_part_prose

    xml do
      element "assessment-part"
      ordered
      map_attribute "uuid", to: :uuid
      map_attribute "name", to: :name
      map_attribute "ns", to: :ns
      map_attribute "class", to: :class_attr
      map_element "prop", to: :property
      map_element "part", to: :assessment_part
      map_element "link", to: :link
      map_element "title", to: :title
      map_element "prose", to: :prose
    end

    key_value do
      map "uuid", to: :uuid
      map "name", to: :name
      map "ns", to: :ns
      map "class", to: :class_attr
      map "title", to: :title, render_empty: true
      map "prose", to: :prose, render_empty: true
      map "props", to: :property, render_empty: true
      map "parts", to: :assessment_part, render_empty: true
      map "links", to: :link, render_empty: true
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end
  end
  class Activity < Base
    attribute :uuid, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :reviewed_controls, :reviewed_controls
    attribute :responsible_role, :responsible_role, collection: true
    attribute :title, :activity_title
    attribute :description, :activity_description
    attribute :step, :activity_step, collection: true

    xml do
      element "activity"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "related-controls", to: :reviewed_controls
      map_element "responsible-role", to: :responsible_role
      map_element "title", to: :title
      map_element "description", to: :description
      map_element "step", to: :step
    end

    key_value do
      map "uuid", to: :uuid
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "title", to: :title, render_empty: true
      map "description", to: :description, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "responsible-roles", to: :responsible_role, render_empty: true
      map "steps", to: :step, render_empty: true
      map "related-controls", to: :reviewed_controls, with: { to: :json_assembly_soa_to_reviewed_controls_related_controls, from: :json_assembly_soa_from_reviewed_controls_related_controls }
    end

    def json_assembly_soa_to_reviewed_controls_related_controls(instance, doc)
      current = instance.instance_variable_get(:@reviewed_controls)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::ReviewedControls.as_json(item)
          else
            item
          end
        end
        doc["related-controls"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_reviewed_controls_related_controls(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::ReviewedControls.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@reviewed_controls, parsed)
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class ReviewedControls < Base
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :description, :reviewed_controls_description
    attribute :control_selection, :reviewed_controls_control_selection, collection: true
    attribute :control_objective_selection, :reviewed_controls_control_objective_selection, collection: true

    xml do
      element "reviewed-controls"
      ordered
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "description", to: :description
      map_element "control-selection", to: :control_selection
      map_element "control-objective-selection", to: :control_objective_selection
    end

    key_value do
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "description", to: :description, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "control-selections", to: :control_selection, render_empty: true
      map "control-objective-selections", to: :control_objective_selection, render_empty: true
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class Task < Base
    attribute :uuid, :string
    attribute :type, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :task, :task, collection: true
    attribute :assessment_subject, :assessment_subject, collection: true
    attribute :responsible_role, :responsible_role, collection: true
    attribute :title, :task_title
    attribute :description, :task_description
    attribute :timing, :task_timing
    attribute :dependency, :task_dependency, collection: true
    attribute :associated_activity, :task_associated_activity, collection: true

    xml do
      element "task"
      ordered
      map_attribute "uuid", to: :uuid
      map_attribute "type", to: :type
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "task", to: :task
      map_element "subject", to: :assessment_subject
      map_element "responsible-role", to: :responsible_role
      map_element "title", to: :title
      map_element "description", to: :description
      map_element "timing", to: :timing
      map_element "dependency", to: :dependency
      map_element "associated-activity", to: :associated_activity
    end

    key_value do
      map "uuid", to: :uuid
      map "type", to: :type
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "title", to: :title, render_empty: true
      map "description", to: :description, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "tasks", to: :task, render_empty: true
      map "subjects", to: :assessment_subject, render_empty: true
      map "responsible-roles", to: :responsible_role, render_empty: true
      map "dependencies", to: :dependency, render_empty: true
      map "associated-activities", to: :associated_activity, render_empty: true
      map "timing", to: :timing, with: { to: :json_assembly_soa_to_timing_timing, from: :json_assembly_soa_from_timing_timing }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_assembly_soa_from_timing_timing(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::TaskTiming.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@timing, parsed)
    end

    def json_assembly_soa_to_timing_timing(instance, doc)
      current = instance.instance_variable_get(:@timing)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::TaskTiming.as_json(item)
          else
            item
          end
        end
        doc["timing"] = result.length == 1 ? result.first : result
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class AssessmentSubject < Base
    attribute :type, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :select_subject_by_id, :select_subject_by_id, collection: true
    attribute :description, :assessment_subject_description
    attribute :include_all, :include_all

    xml do
      element "assessment-subject"
      ordered
      map_attribute "type", to: :type
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "exclude-subject", to: :select_subject_by_id
      map_element "description", to: :description
      map_element "include-all", to: :include_all
      map_element "include-subject", to: :select_subject_by_id
    end

    key_value do
      map "type", to: :type
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "description", to: :description, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "exclude-subjects", to: :select_subject_by_id, render_empty: true
      map "include-subjects", to: :select_subject_by_id, render_empty: true
      map "include-all", to: :include_all, with: { to: :json_assembly_soa_to_include_all_include_all, from: :json_assembly_soa_from_include_all_include_all }
    end

    def json_assembly_soa_from_include_all_include_all(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::IncludeAll.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@include_all, parsed)
    end

    def json_assembly_soa_to_include_all_include_all(instance, doc)
      current = instance.instance_variable_get(:@include_all)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::IncludeAll.as_json(item)
          else
            item
          end
        end
        doc["include-all"] = result.length == 1 ? result.first : result
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class SelectObjectiveById < Base
    attribute :objective_id, :string
    attribute :remarks, :remarks

    xml do
      element "select-objective-by-id"
      ordered
      map_attribute "objective-id", to: :objective_id
      map_element "remarks", to: :remarks
    end

    key_value do
      map "objective-id", to: :objective_id
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class AssessmentSubjectPlaceholder < Base
    attribute :uuid, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :description, :assessment_subject_placeholder_description
    attribute :source, :assessment_subject_placeholder_source, collection: true

    xml do
      element "assessment-subject-placeholder"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "description", to: :description
      map_element "source", to: :source
    end

    key_value do
      map "uuid", to: :uuid
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "description", to: :description, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "sources", to: :source, render_empty: true
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class SelectSubjectById < Base
    attribute :subject_uuid, :string
    attribute :subject_type, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true

    xml do
      element "select-subject-by-id"
      ordered
      map_attribute "subject-uuid", to: :subject_uuid
      map_attribute "subject-type", to: :subject_type
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
    end

    key_value do
      map "subject-uuid", to: :subject_uuid
      map "subject-type", to: :subject_type
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class SubjectReference < Base
    attribute :subject_uuid, :string
    attribute :subject_type, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :title, :subject_reference_title

    xml do
      element "subject-reference"
      ordered
      map_attribute "subject-uuid", to: :subject_uuid
      map_attribute "subject-type", to: :subject_type
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "title", to: :title
    end

    key_value do
      map "subject-uuid", to: :subject_uuid
      map "subject-type", to: :subject_type
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "title", to: :title, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class AssessmentAssets < Base
    attribute :system_component, :system_component, collection: true
    attribute :assessment_platform, :assessment_assets_assessment_platform, collection: true

    xml do
      element "assessment-assets"
      ordered
      map_element "component", to: :system_component
      map_element "assessment-platform", to: :assessment_platform
    end

    key_value do
      map "components", to: :system_component, render_empty: true
      map "assessment-platforms", to: :assessment_platform, render_empty: true
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end
  end
  class FindingTarget < Base
    attribute :type, :string
    attribute :target_id, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :implementation_status, :implementation_status
    attribute :title, :finding_target_title
    attribute :description, :finding_target_description
    attribute :status, :finding_target_status

    xml do
      element "finding-target"
      ordered
      map_attribute "type", to: :type
      map_attribute "target-id", to: :target_id
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "implementation-status", to: :implementation_status
      map_element "title", to: :title
      map_element "description", to: :description
      map_element "status", to: :status
    end

    key_value do
      map "type", to: :type
      map "target-id", to: :target_id
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "title", to: :title, render_empty: true
      map "description", to: :description, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "implementation-status", to: :implementation_status, with: { to: :json_assembly_soa_to_implementation_status_implementation_status, from: :json_assembly_soa_from_implementation_status_implementation_status }
      map "status", to: :status, with: { to: :json_assembly_soa_to_status_status, from: :json_assembly_soa_from_status_status }
    end

    def json_assembly_soa_to_implementation_status_implementation_status(instance, doc)
      current = instance.instance_variable_get(:@implementation_status)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::ImplementationStatus.as_json(item)
          else
            item
          end
        end
        doc["implementation-status"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_implementation_status_implementation_status(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::ImplementationStatus.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@implementation_status, parsed)
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_assembly_soa_from_status_status(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::FindingTargetStatus.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@status, parsed)
    end

    def json_assembly_soa_to_status_status(instance, doc)
      current = instance.instance_variable_get(:@status)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::FindingTargetStatus.as_json(item)
          else
            item
          end
        end
        doc["status"] = result.length == 1 ? result.first : result
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class Finding < Base
    attribute :uuid, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :origin, :origin, collection: true
    attribute :finding_target, :finding_target
    attribute :related_observation, :related_observation, collection: true
    attribute :associated_risk, :associated_risk, collection: true
    attribute :title, :finding_title
    attribute :description, :finding_description
    attribute :implementation_statement_uuid, :string

    xml do
      element "finding"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "origin", to: :origin
      map_element "target", to: :finding_target
      map_element "related-observation", to: :related_observation
      map_element "associated-risk", to: :associated_risk
      map_element "title", to: :title
      map_element "description", to: :description
      map_element "implementation-statement-uuid", to: :implementation_statement_uuid
    end

    key_value do
      map "uuid", to: :uuid
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "title", to: :title, render_empty: true
      map "description", to: :description, render_empty: true
      map "implementation-statement-uuid", to: :implementation_statement_uuid, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "origins", to: :origin, render_empty: true
      map "related-observations", to: :related_observation, render_empty: true
      map "related-risks", to: :associated_risk, render_empty: true
      map "target", to: :finding_target, with: { to: :json_assembly_soa_to_finding_target_target, from: :json_assembly_soa_from_finding_target_target }
    end

    def json_assembly_soa_from_finding_target_target(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::FindingTarget.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@finding_target, parsed)
    end

    def json_assembly_soa_to_finding_target_target(instance, doc)
      current = instance.instance_variable_get(:@finding_target)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::FindingTarget.as_json(item)
          else
            item
          end
        end
        doc["target"] = result.length == 1 ? result.first : result
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class Origin < Base
    attribute :origin_actor, :origin_actor, collection: true
    attribute :related_task, :related_task, collection: true

    xml do
      element "origin"
      ordered
      map_element "actor", to: :origin_actor
      map_element "related-task", to: :related_task
    end

    key_value do
      map "actors", to: :origin_actor, render_empty: true
      map "related-tasks", to: :related_task, render_empty: true
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class RelatedObservation < Base
    attribute :observation_uuid, :string
    attribute :remarks, :remarks

    xml do
      element "related-observation"
      ordered
      map_attribute "observation-uuid", to: :observation_uuid
      map_element "remarks", to: :remarks
    end

    key_value do
      map "observation-uuid", to: :observation_uuid
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class AssociatedRisk < Base
    attribute :risk_uuid, :string
    attribute :remarks, :remarks

    xml do
      element "associated-risk"
      ordered
      map_attribute "risk-uuid", to: :risk_uuid
      map_element "remarks", to: :remarks
    end

    key_value do
      map "risk-uuid", to: :risk_uuid
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class Observation < Base
    attribute :uuid, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :origin, :origin, collection: true
    attribute :subject_reference, :subject_reference, collection: true
    attribute :title, :observation_title
    attribute :description, :observation_description
    attribute :method_attr, :string, collection: true
    attribute :type, :string, collection: true
    attribute :collected, :string
    attribute :expires, :string
    attribute :relevant_evidence, :observation_relevant_evidence, collection: true

    xml do
      element "observation"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "origin", to: :origin
      map_element "subject", to: :subject_reference
      map_element "title", to: :title
      map_element "description", to: :description
      map_element "method", to: :method_attr
      map_element "type", to: :type
      map_element "collected", to: :collected
      map_element "expires", to: :expires
      map_element "relevant-evidence", to: :relevant_evidence
    end

    key_value do
      map "uuid", to: :uuid
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "title", to: :title, render_empty: true
      map "description", to: :description, render_empty: true
      map "method", to: :method_attr, render_empty: true
      map "type", to: :type, render_empty: true
      map "collected", to: :collected, render_empty: true
      map "expires", to: :expires, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "origins", to: :origin, render_empty: true
      map "subjects", to: :subject_reference, render_empty: true
      map "relevant-evidence", to: :relevant_evidence, render_empty: true
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class OriginActor < Base
    attribute :type, :string
    attribute :actor_uuid, :string
    attribute :role_id, :string
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true

    xml do
      element "origin-actor"
      ordered
      map_attribute "type", to: :type
      map_attribute "actor-uuid", to: :actor_uuid
      map_attribute "role-id", to: :role_id
      map_element "prop", to: :property
      map_element "link", to: :link
    end

    key_value do
      map "type", to: :type
      map "actor-uuid", to: :actor_uuid
      map "role-id", to: :role_id
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
    end
  end
  class RelatedTask < Base
    attribute :task_uuid, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :responsible_party, :responsible_party, collection: true
    attribute :assessment_subject, :assessment_subject, collection: true
    attribute :identified_subject, :related_task_identified_subject

    xml do
      element "related-task"
      ordered
      map_attribute "task-uuid", to: :task_uuid
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "responsible-party", to: :responsible_party
      map_element "subject", to: :assessment_subject
      map_element "identified-subject", to: :identified_subject
    end

    key_value do
      map "task-uuid", to: :task_uuid
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "responsible-parties", to: :responsible_party, render_empty: true
      map "subjects", to: :assessment_subject, render_empty: true
      map "identified-subject", to: :identified_subject, with: { to: :json_assembly_soa_to_identified_subject_identified_subject, from: :json_assembly_soa_from_identified_subject_identified_subject }
    end

    def json_assembly_soa_to_identified_subject_identified_subject(instance, doc)
      current = instance.instance_variable_get(:@identified_subject)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::RelatedTaskIdentifiedSubject.as_json(item)
          else
            item
          end
        end
        doc["identified-subject"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_identified_subject_identified_subject(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::RelatedTaskIdentifiedSubject.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@identified_subject, parsed)
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class Risk < Base
    attribute :uuid, :string
    attribute :risk_status, :risk_status
    attribute :threat_id, :threat_id, collection: true
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :origin, :origin, collection: true
    attribute :characterization, :characterization, collection: true
    attribute :response, :response, collection: true
    attribute :related_observation, :related_observation, collection: true
    attribute :title, :risk_title
    attribute :description, :risk_description
    attribute :statement, :risk_statement
    attribute :deadline, :string
    attribute :mitigating_factor, :risk_mitigating_factor, collection: true
    attribute :risk_log, :risk_risk_log

    xml do
      element "risk"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "status", to: :risk_status
      map_element "threat-id", to: :threat_id
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "origin", to: :origin
      map_element "characterization", to: :characterization
      map_element "response", to: :response
      map_element "related-observation", to: :related_observation
      map_element "title", to: :title
      map_element "description", to: :description
      map_element "statement", to: :statement
      map_element "deadline", to: :deadline
      map_element "mitigating-factor", to: :mitigating_factor
      map_element "risk-log", to: :risk_log
    end

    key_value do
      map "uuid", to: :uuid
      map "status", to: :risk_status, with: { to: :json_to_risk_status_status, from: :json_from_risk_status_status }
      map "title", to: :title, render_empty: true
      map "description", to: :description, render_empty: true
      map "statement", to: :statement, render_empty: true
      map "deadline", to: :deadline, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "origins", to: :origin, render_empty: true
      map "characterizations", to: :characterization, render_empty: true
      map "remediations", to: :response, render_empty: true
      map "related-observations", to: :related_observation, render_empty: true
      map "mitigating-factors", to: :mitigating_factor, render_empty: true
      map "threat-ids", to: :threat_id, with: { to: :json_soa_to_threat_id_threat_ids, from: :json_soa_from_threat_id_threat_ids }
      map "threat-id", to: :threat_id, with: { to: :json_soa_to_threat_id_threat_ids, from: :json_soa_from_threat_id_threat_ids }
      map "risk-log", to: :risk_log, with: { to: :json_assembly_soa_to_risk_log_risk_log, from: :json_assembly_soa_from_risk_log_risk_log }
    end

    def json_from_risk_status_status(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::RiskStatus.of_json(v) }
        instance.instance_variable_set(:@risk_status, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::RiskStatus.new(content: "")
          instance.instance_variable_set(:@risk_status, inst)
        else
          instance.instance_variable_set(:@risk_status, Oscal::V1_2_1::RiskStatus.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@risk_status, Oscal::V1_2_1::RiskStatus.of_json(value))
      end
    end

    def json_to_risk_status_status(instance, doc)
      current = instance.instance_variable_get(:@risk_status)
      if current.is_a?(Array)
        doc["status"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["status"] = Oscal::V1_2_1::RiskStatus.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["status"] = val
        end
      end
    end

    def json_soa_from_threat_id_threat_ids(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              when String then [value]
              else return
              end
      parsed = items.map do |item|
        case item
        when Hash then Oscal::V1_2_1::ThreatId.of_json(item)
        when String then Oscal::V1_2_1::ThreatId.of_json(item)
        else item
        end
      end
      instance.instance_variable_set(:@threat_id, parsed)
    end

    def json_soa_to_threat_id_threat_ids(instance, doc)
      current = instance.instance_variable_get(:@threat_id)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::ThreatId.as_json(item)
          else
            item
          end
        end
        doc["threat-ids"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_to_risk_log_risk_log(instance, doc)
      current = instance.instance_variable_get(:@risk_log)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::RiskRiskLog.as_json(item)
          else
            item
          end
        end
        doc["risk-log"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_risk_log_risk_log(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::RiskRiskLog.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@risk_log, parsed)
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class Characterization < Base
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :origin, :origin
    attribute :facet, :characterization_facet, collection: true

    xml do
      element "characterization"
      ordered
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "origin", to: :origin
      map_element "facet", to: :facet
    end

    key_value do
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "facets", to: :facet, render_empty: true
      map "origin", to: :origin, with: { to: :json_assembly_soa_to_origin_origin, from: :json_assembly_soa_from_origin_origin }
    end

    def json_assembly_soa_from_origin_origin(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::Origin.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@origin, parsed)
    end

    def json_assembly_soa_to_origin_origin(instance, doc)
      current = instance.instance_variable_get(:@origin)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::Origin.as_json(item)
          else
            item
          end
        end
        doc["origin"] = result.length == 1 ? result.first : result
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class Response < Base
    attribute :uuid, :string
    attribute :lifecycle, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :origin, :origin, collection: true
    attribute :task, :task, collection: true
    attribute :title, :response_title
    attribute :description, :response_description
    attribute :required_asset, :response_required_asset, collection: true

    xml do
      element "response"
      ordered
      map_attribute "uuid", to: :uuid
      map_attribute "lifecycle", to: :lifecycle
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "origin", to: :origin
      map_element "task", to: :task
      map_element "title", to: :title
      map_element "description", to: :description
      map_element "required-asset", to: :required_asset
    end

    key_value do
      map "uuid", to: :uuid
      map "lifecycle", to: :lifecycle
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "title", to: :title, render_empty: true
      map "description", to: :description, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "origins", to: :origin, render_empty: true
      map "tasks", to: :task, render_empty: true
      map "required-assets", to: :required_asset, render_empty: true
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class LoggedBy < Base
    attribute :party_uuid, :string
    attribute :role_id, :string
    attribute :remarks, :remarks

    xml do
      element "logged-by"
      ordered
      map_attribute "party-uuid", to: :party_uuid
      map_attribute "role-id", to: :role_id
      map_element "remarks", to: :remarks
    end

    key_value do
      map "party-uuid", to: :party_uuid
      map "role-id", to: :role_id
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class AssessmentPlan < Base
    attribute :uuid, :string
    attribute :metadata, :metadata
    attribute :import_ssp, :import_ssp
    attribute :reviewed_controls, :reviewed_controls
    attribute :assessment_subject, :assessment_subject, collection: true
    attribute :assessment_assets, :assessment_assets
    attribute :task, :task, collection: true
    attribute :back_matter, :back_matter
    attribute :local_definitions, :assessment_plan_local_definitions
    attribute :terms_and_conditions, :assessment_plan_terms_and_conditions

    xml do
      element "assessment-plan"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "metadata", to: :metadata
      map_element "import-ssp", to: :import_ssp
      map_element "reviewed-controls", to: :reviewed_controls
      map_element "assessment-subject", to: :assessment_subject
      map_element "assessment-assets", to: :assessment_assets
      map_element "task", to: :task
      map_element "back-matter", to: :back_matter
      map_element "local-definitions", to: :local_definitions
      map_element "terms-and-conditions", to: :terms_and_conditions
    end

    key_value do
      map "uuid", to: :uuid
      map "assessment-subjects", to: :assessment_subject, render_empty: true
      map "tasks", to: :task, render_empty: true
      map "metadata", to: :metadata, with: { to: :json_assembly_soa_to_metadata_metadata, from: :json_assembly_soa_from_metadata_metadata }
      map "import-ssp", to: :import_ssp, with: { to: :json_assembly_soa_to_import_ssp_import_ssp, from: :json_assembly_soa_from_import_ssp_import_ssp }
      map "reviewed-controls", to: :reviewed_controls, with: { to: :json_assembly_soa_to_reviewed_controls_reviewed_controls, from: :json_assembly_soa_from_reviewed_controls_reviewed_controls }
      map "assessment-assets", to: :assessment_assets, with: { to: :json_assembly_soa_to_assessment_assets_assessment_assets, from: :json_assembly_soa_from_assessment_assets_assessment_assets }
      map "back-matter", to: :back_matter, with: { to: :json_assembly_soa_to_back_matter_back_matter, from: :json_assembly_soa_from_back_matter_back_matter }
      map "local-definitions", to: :local_definitions, with: { to: :json_assembly_soa_to_local_definitions_local_definitions, from: :json_assembly_soa_from_local_definitions_local_definitions }
      map "terms-and-conditions", to: :terms_and_conditions, with: { to: :json_assembly_soa_to_terms_and_conditions_terms_and_conditions, from: :json_assembly_soa_from_terms_and_conditions_terms_and_conditions }
    end

    def json_assembly_soa_from_metadata_metadata(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::Metadata.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@metadata, parsed)
    end

    def json_assembly_soa_to_metadata_metadata(instance, doc)
      current = instance.instance_variable_get(:@metadata)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::Metadata.as_json(item)
          else
            item
          end
        end
        doc["metadata"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_back_matter_back_matter(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::BackMatter.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@back_matter, parsed)
    end

    def json_assembly_soa_to_back_matter_back_matter(instance, doc)
      current = instance.instance_variable_get(:@back_matter)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::BackMatter.as_json(item)
          else
            item
          end
        end
        doc["back-matter"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_to_import_ssp_import_ssp(instance, doc)
      current = instance.instance_variable_get(:@import_ssp)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::ImportSsp.as_json(item)
          else
            item
          end
        end
        doc["import-ssp"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_import_ssp_import_ssp(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::ImportSsp.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@import_ssp, parsed)
    end

    def json_assembly_soa_to_reviewed_controls_reviewed_controls(instance, doc)
      current = instance.instance_variable_get(:@reviewed_controls)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::ReviewedControls.as_json(item)
          else
            item
          end
        end
        doc["reviewed-controls"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_reviewed_controls_reviewed_controls(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::ReviewedControls.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@reviewed_controls, parsed)
    end

    def json_assembly_soa_to_assessment_assets_assessment_assets(instance, doc)
      current = instance.instance_variable_get(:@assessment_assets)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::AssessmentAssets.as_json(item)
          else
            item
          end
        end
        doc["assessment-assets"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_assessment_assets_assessment_assets(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::AssessmentAssets.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@assessment_assets, parsed)
    end

    def json_assembly_soa_to_local_definitions_local_definitions(instance, doc)
      current = instance.instance_variable_get(:@local_definitions)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::AssessmentPlanLocalDefinitions.as_json(item)
          else
            item
          end
        end
        doc["local-definitions"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_local_definitions_local_definitions(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::AssessmentPlanLocalDefinitions.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@local_definitions, parsed)
    end

    def json_assembly_soa_to_terms_and_conditions_terms_and_conditions(instance, doc)
      current = instance.instance_variable_get(:@terms_and_conditions)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::AssessmentPlanTermsAndConditions.as_json(item)
          else
            item
          end
        end
        doc["terms-and-conditions"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_terms_and_conditions_terms_and_conditions(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::AssessmentPlanTermsAndConditions.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@terms_and_conditions, parsed)
    end

    def self.of_json(doc, options = {})
      if doc.is_a?(Hash) && doc.key?("assessment-plan")
        super(doc["assessment-plan"], options)
      else
        super(doc, options)
      end
    end

    def self.to_json(instance, options = {})
      json_str = super(instance, options)
      { "assessment-plan" => JSON.parse(json_str) }.to_json
    end

    def self.of_yaml(doc, options = {})
      if doc.is_a?(Hash) && doc.key?("assessment-plan")
        super(doc["assessment-plan"], options)
      else
        super(doc, options)
      end
    end

    def self.to_yaml(instance, options = {})
      yaml_str = super(instance, options)
      data = YAML.safe_load(yaml_str, permitted_classes: [Date, Time, Symbol])
      { "assessment-plan" => data }.to_yaml
    end

    def to_json(options = {})
      self.class.to_json(self, options)
    end

    def to_yaml(options = {})
      self.class.to_yaml(self, options)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class AssessmentResults < Base
    attribute :uuid, :string
    attribute :metadata, :metadata
    attribute :import_ap, :import_ap
    attribute :result, :result, collection: true
    attribute :back_matter, :back_matter
    attribute :local_definitions, :assessment_results_local_definitions

    xml do
      element "assessment-results"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "metadata", to: :metadata
      map_element "import-ap", to: :import_ap
      map_element "result", to: :result
      map_element "back-matter", to: :back_matter
      map_element "local-definitions", to: :local_definitions
    end

    key_value do
      map "uuid", to: :uuid
      map "results", to: :result, render_empty: true
      map "metadata", to: :metadata, with: { to: :json_assembly_soa_to_metadata_metadata, from: :json_assembly_soa_from_metadata_metadata }
      map "import-ap", to: :import_ap, with: { to: :json_assembly_soa_to_import_ap_import_ap, from: :json_assembly_soa_from_import_ap_import_ap }
      map "back-matter", to: :back_matter, with: { to: :json_assembly_soa_to_back_matter_back_matter, from: :json_assembly_soa_from_back_matter_back_matter }
      map "local-definitions", to: :local_definitions, with: { to: :json_assembly_soa_to_local_definitions_local_definitions, from: :json_assembly_soa_from_local_definitions_local_definitions }
    end

    def json_assembly_soa_from_metadata_metadata(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::Metadata.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@metadata, parsed)
    end

    def json_assembly_soa_to_metadata_metadata(instance, doc)
      current = instance.instance_variable_get(:@metadata)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::Metadata.as_json(item)
          else
            item
          end
        end
        doc["metadata"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_back_matter_back_matter(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::BackMatter.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@back_matter, parsed)
    end

    def json_assembly_soa_to_back_matter_back_matter(instance, doc)
      current = instance.instance_variable_get(:@back_matter)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::BackMatter.as_json(item)
          else
            item
          end
        end
        doc["back-matter"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_local_definitions_local_definitions(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::AssessmentResultsLocalDefinitions.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@local_definitions, parsed)
    end

    def json_assembly_soa_to_local_definitions_local_definitions(instance, doc)
      current = instance.instance_variable_get(:@local_definitions)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::AssessmentResultsLocalDefinitions.as_json(item)
          else
            item
          end
        end
        doc["local-definitions"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_import_ap_import_ap(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::ImportAp.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@import_ap, parsed)
    end

    def json_assembly_soa_to_import_ap_import_ap(instance, doc)
      current = instance.instance_variable_get(:@import_ap)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::ImportAp.as_json(item)
          else
            item
          end
        end
        doc["import-ap"] = result.length == 1 ? result.first : result
      end
    end

    def self.of_json(doc, options = {})
      if doc.is_a?(Hash) && doc.key?("assessment-results")
        super(doc["assessment-results"], options)
      else
        super(doc, options)
      end
    end

    def self.to_json(instance, options = {})
      json_str = super(instance, options)
      { "assessment-results" => JSON.parse(json_str) }.to_json
    end

    def self.of_yaml(doc, options = {})
      if doc.is_a?(Hash) && doc.key?("assessment-results")
        super(doc["assessment-results"], options)
      else
        super(doc, options)
      end
    end

    def self.to_yaml(instance, options = {})
      yaml_str = super(instance, options)
      data = YAML.safe_load(yaml_str, permitted_classes: [Date, Time, Symbol])
      { "assessment-results" => data }.to_yaml
    end

    def to_json(options = {})
      self.class.to_json(self, options)
    end

    def to_yaml(options = {})
      self.class.to_yaml(self, options)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class ImportAp < Base
    attribute :href, :string
    attribute :remarks, :remarks

    xml do
      element "import-ap"
      ordered
      map_attribute "href", to: :href
      map_element "remarks", to: :remarks
    end

    key_value do
      map "href", to: :href
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class Result < Base
    attribute :uuid, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :reviewed_controls, :reviewed_controls
    attribute :observation, :observation, collection: true
    attribute :risk, :risk, collection: true
    attribute :finding, :finding, collection: true
    attribute :title, :result_title
    attribute :description, :result_description
    attribute :start, :string
    attribute :end, :string
    attribute :local_definitions, :result_local_definitions
    attribute :attestation, :result_attestation, collection: true
    attribute :assessment_log, :result_assessment_log

    xml do
      element "result"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "reviewed-controls", to: :reviewed_controls
      map_element "observation", to: :observation
      map_element "risk", to: :risk
      map_element "finding", to: :finding
      map_element "title", to: :title
      map_element "description", to: :description
      map_element "start", to: :start
      map_element "end", to: :end
      map_element "local-definitions", to: :local_definitions
      map_element "attestation", to: :attestation
      map_element "assessment-log", to: :assessment_log
    end

    key_value do
      map "uuid", to: :uuid
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "title", to: :title, render_empty: true
      map "description", to: :description, render_empty: true
      map "start", to: :start, render_empty: true
      map "end", to: :end, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "observations", to: :observation, render_empty: true
      map "risks", to: :risk, render_empty: true
      map "findings", to: :finding, render_empty: true
      map "attestations", to: :attestation, render_empty: true
      map "reviewed-controls", to: :reviewed_controls, with: { to: :json_assembly_soa_to_reviewed_controls_reviewed_controls, from: :json_assembly_soa_from_reviewed_controls_reviewed_controls }
      map "local-definitions", to: :local_definitions, with: { to: :json_assembly_soa_to_local_definitions_local_definitions, from: :json_assembly_soa_from_local_definitions_local_definitions }
      map "assessment-log", to: :assessment_log, with: { to: :json_assembly_soa_to_assessment_log_assessment_log, from: :json_assembly_soa_from_assessment_log_assessment_log }
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def json_assembly_soa_from_reviewed_controls_reviewed_controls(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::ReviewedControls.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@reviewed_controls, parsed)
    end

    def json_assembly_soa_to_reviewed_controls_reviewed_controls(instance, doc)
      current = instance.instance_variable_get(:@reviewed_controls)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::ReviewedControls.as_json(item)
          else
            item
          end
        end
        doc["reviewed-controls"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_local_definitions_local_definitions(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::ResultLocalDefinitions.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@local_definitions, parsed)
    end

    def json_assembly_soa_to_local_definitions_local_definitions(instance, doc)
      current = instance.instance_variable_get(:@local_definitions)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::ResultLocalDefinitions.as_json(item)
          else
            item
          end
        end
        doc["local-definitions"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_assessment_log_assessment_log(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::ResultAssessmentLog.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@assessment_log, parsed)
    end

    def json_assembly_soa_to_assessment_log_assessment_log(instance, doc)
      current = instance.instance_variable_get(:@assessment_log)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::ResultAssessmentLog.as_json(item)
          else
            item
          end
        end
        doc["assessment-log"] = result.length == 1 ? result.first : result
      end
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class PlanOfActionAndMilestones < Base
    attribute :uuid, :string
    attribute :system_id, :system_id
    attribute :metadata, :metadata
    attribute :import_ssp, :import_ssp
    attribute :local_definitions, :local_definitions
    attribute :observation, :observation, collection: true
    attribute :risk, :risk, collection: true
    attribute :finding, :finding, collection: true
    attribute :poam_item, :poam_item, collection: true
    attribute :back_matter, :back_matter

    xml do
      element "plan-of-action-and-milestones"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "system-id", to: :system_id
      map_element "metadata", to: :metadata
      map_element "import-ssp", to: :import_ssp
      map_element "local-definitions", to: :local_definitions
      map_element "observation", to: :observation
      map_element "risk", to: :risk
      map_element "finding", to: :finding
      map_element "poam-item", to: :poam_item
      map_element "back-matter", to: :back_matter
    end

    key_value do
      map "uuid", to: :uuid
      map "system-id", to: :system_id, with: { to: :json_to_system_id_system_id, from: :json_from_system_id_system_id }
      map "observations", to: :observation, render_empty: true
      map "risks", to: :risk, render_empty: true
      map "findings", to: :finding, render_empty: true
      map "poam-items", to: :poam_item, render_empty: true
      map "metadata", to: :metadata, with: { to: :json_assembly_soa_to_metadata_metadata, from: :json_assembly_soa_from_metadata_metadata }
      map "import-ssp", to: :import_ssp, with: { to: :json_assembly_soa_to_import_ssp_import_ssp, from: :json_assembly_soa_from_import_ssp_import_ssp }
      map "local-definitions", to: :local_definitions, with: { to: :json_assembly_soa_to_local_definitions_local_definitions, from: :json_assembly_soa_from_local_definitions_local_definitions }
      map "back-matter", to: :back_matter, with: { to: :json_assembly_soa_to_back_matter_back_matter, from: :json_assembly_soa_from_back_matter_back_matter }
    end

    def json_to_system_id_system_id(instance, doc)
      current = instance.instance_variable_get(:@system_id)
      if current.is_a?(Array)
        doc["system-id"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["system-id"] = Oscal::V1_2_1::SystemId.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["system-id"] = val
        end
      end
    end

    def json_assembly_soa_to_metadata_metadata(instance, doc)
      current = instance.instance_variable_get(:@metadata)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::Metadata.as_json(item)
          else
            item
          end
        end
        doc["metadata"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_metadata_metadata(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::Metadata.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@metadata, parsed)
    end

    def json_assembly_soa_to_back_matter_back_matter(instance, doc)
      current = instance.instance_variable_get(:@back_matter)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::BackMatter.as_json(item)
          else
            item
          end
        end
        doc["back-matter"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_back_matter_back_matter(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::BackMatter.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@back_matter, parsed)
    end

    def json_assembly_soa_to_import_ssp_import_ssp(instance, doc)
      current = instance.instance_variable_get(:@import_ssp)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::ImportSsp.as_json(item)
          else
            item
          end
        end
        doc["import-ssp"] = result.length == 1 ? result.first : result
      end
    end

    def json_assembly_soa_from_import_ssp_import_ssp(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::ImportSsp.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@import_ssp, parsed)
    end

    def json_assembly_soa_from_local_definitions_local_definitions(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::LocalDefinitions.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@local_definitions, parsed)
    end

    def json_assembly_soa_to_local_definitions_local_definitions(instance, doc)
      current = instance.instance_variable_get(:@local_definitions)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::LocalDefinitions.as_json(item)
          else
            item
          end
        end
        doc["local-definitions"] = result.length == 1 ? result.first : result
      end
    end

    def json_from_system_id_system_id(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::SystemId.of_json(v) }
        instance.instance_variable_set(:@system_id, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::SystemId.new(content: "")
          instance.instance_variable_set(:@system_id, inst)
        else
          instance.instance_variable_set(:@system_id, Oscal::V1_2_1::SystemId.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@system_id, Oscal::V1_2_1::SystemId.of_json(value))
      end
    end

    def self.of_json(doc, options = {})
      if doc.is_a?(Hash) && doc.key?("plan-of-action-and-milestones")
        super(doc["plan-of-action-and-milestones"], options)
      else
        super(doc, options)
      end
    end

    def self.to_json(instance, options = {})
      json_str = super(instance, options)
      { "plan-of-action-and-milestones" => JSON.parse(json_str) }.to_json
    end

    def self.of_yaml(doc, options = {})
      if doc.is_a?(Hash) && doc.key?("plan-of-action-and-milestones")
        super(doc["plan-of-action-and-milestones"], options)
      else
        super(doc, options)
      end
    end

    def self.to_yaml(instance, options = {})
      yaml_str = super(instance, options)
      data = YAML.safe_load(yaml_str, permitted_classes: [Date, Time, Symbol])
      { "plan-of-action-and-milestones" => data }.to_yaml
    end

    def to_json(options = {})
      self.class.to_json(self, options)
    end

    def to_yaml(options = {})
      self.class.to_yaml(self, options)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class LocalDefinitions < Base
    attribute :remarks, :remarks
    attribute :system_component, :system_component, collection: true
    attribute :inventory_item, :inventory_item, collection: true
    attribute :assessment_assets, :assessment_assets

    xml do
      element "local-definitions"
      ordered
      map_element "remarks", to: :remarks
      map_element "component", to: :system_component
      map_element "inventory-item", to: :inventory_item
      map_element "assessment-assets", to: :assessment_assets
    end

    key_value do
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "components", to: :system_component, render_empty: true
      map "inventory-items", to: :inventory_item, render_empty: true
      map "assessment-assets", to: :assessment_assets, with: { to: :json_assembly_soa_to_assessment_assets_assessment_assets, from: :json_assembly_soa_from_assessment_assets_assessment_assets }
    end

    def json_assembly_soa_from_assessment_assets_assessment_assets(instance, value)
      items = case value
              when Hash then [value]
              when Array then value
              else return
              end
      parsed = items.map { |item| Oscal::V1_2_1::AssessmentAssets.of_json(item.is_a?(Hash) ? item : {}) }
      instance.instance_variable_set(:@assessment_assets, parsed)
    end

    def json_assembly_soa_to_assessment_assets_assessment_assets(instance, doc)
      current = instance.instance_variable_get(:@assessment_assets)
      if current.is_a?(Array)
        result = current.map do |item|
          if item.is_a?(Lutaml::Model::Serializable)
            Oscal::V1_2_1::AssessmentAssets.as_json(item)
          else
            item
          end
        end
        doc["assessment-assets"] = result.length == 1 ? result.first : result
      end
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
  class PoamItem < Base
    attribute :uuid, :string
    attribute :remarks, :remarks
    attribute :property, :property, collection: true
    attribute :link, :link, collection: true
    attribute :related_observation, :related_observation, collection: true
    attribute :associated_risk, :associated_risk, collection: true
    attribute :title, :poam_item_title
    attribute :description, :poam_item_description
    attribute :origin, :poam_item_origin, collection: true
    attribute :related_finding, :poam_item_related_finding, collection: true

    xml do
      element "poam-item"
      ordered
      map_attribute "uuid", to: :uuid
      map_element "remarks", to: :remarks
      map_element "prop", to: :property
      map_element "link", to: :link
      map_element "related-observation", to: :related_observation
      map_element "associated-risk", to: :associated_risk
      map_element "title", to: :title
      map_element "description", to: :description
      map_element "origin", to: :origin
      map_element "related-finding", to: :related_finding
    end

    key_value do
      map "uuid", to: :uuid
      map "remarks", to: :remarks, with: { to: :json_to_remarks_remarks, from: :json_from_remarks_remarks }
      map "title", to: :title, render_empty: true
      map "description", to: :description, render_empty: true
      map "props", to: :property, render_empty: true
      map "links", to: :link, render_empty: true
      map "related-observations", to: :related_observation, render_empty: true
      map "related-risks", to: :associated_risk, render_empty: true
      map "origins", to: :origin, render_empty: true
      map "related-findings", to: :related_finding, render_empty: true
    end

    def json_from_remarks_remarks(instance, value)
      if value.is_a?(Array)
        parsed = value.map { |v| Oscal::V1_2_1::Remarks.of_json(v) }
        instance.instance_variable_set(:@remarks, parsed)
      elsif value.is_a?(Hash)
        if value.empty?
          inst = Oscal::V1_2_1::Remarks.new(content: "")
          instance.instance_variable_set(:@remarks, inst)
        else
          instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
        end
      elsif value
        instance.instance_variable_set(:@remarks, Oscal::V1_2_1::Remarks.of_json(value))
      end
    end

    def json_to_remarks_remarks(instance, doc)
      current = instance.instance_variable_get(:@remarks)
      if current.is_a?(Array)
        doc["remarks"] = current.map { |item| item.respond_to?(:content) ? item.content : item }
      elsif current
        if current.is_a?(Lutaml::Model::Serializable)
          doc["remarks"] = Oscal::V1_2_1::Remarks.as_json(current)
        else
          val = current.respond_to?(:content) ? current.content : current
          doc["remarks"] = val
        end
      end
    end

    def self.metaschema_constraints
      @metaschema_constraints
    end

    def validate_constraints
      validator = Metaschema::ConstraintValidator.new
      validator.validate(self, self.class.metaschema_constraints)
    end

    def validate_occurrences
      Metaschema::ConstraintValidator.validate_occurrences(self, self.class.instance_variable_get(:@occurrence_constraints))
    end
  end
end
