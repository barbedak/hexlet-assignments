# frozen_string_literal: true

# BEGIN
module Model
  def to_type(attr, type)
    puts attr
    # case type
    # when :string
    #   attr.to_s
    # when :integer
    #   attr.to_i
    # when :boolean
    #   attr.to_b
    # when :datetime
    #   attr.to_datetime
    # else
    #   attr
    # end
  end

  def attribute(name, options = {})
    type = options.fetch(:type, false)
    define_method(name) do
      instance_variable_get("@#{name}")
    end

    puts self.method("@#{name}")

    define_method("#{name}=") do |value|
      instance_variable_set("@#{name}", value)
    end
  end

  def initialize(attributes = {})
    
    attributes.each do |attr|
  
    end
  end

  def attributes()
    false
  end
end
# END
