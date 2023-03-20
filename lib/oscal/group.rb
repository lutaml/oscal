module Oscal
  class Group
    KEYS = %i(id class title controls props parts groups)
    attr_accessor *KEYS

    def self.wrap(obj)
      return obj if obj.is_a? Group
      return Group.new(obj) unless obj.is_a? Array

      obj.map do |x|
        Group.wrap(x)
      end
    end

    def initialize(options={})
      options.each_pair.each do |key,val|
        key_name = key.gsub('-','_')

        unless KEYS.include?(key_name.to_sym)
          raise UnknownAttributeError.new("Unknown key `#{key}` in Group")
        end

        val = case key_name
        when 'groups'
          Group.wrap(val)
        when 'params'
          Parameter.wrap(val)
        when 'props'
          Property.wrap(val)
        when 'parts'
          Part.wrap(val)
        else
          val
        end

        self.send("#{key_name}=", val)
      end
    end

  end
end