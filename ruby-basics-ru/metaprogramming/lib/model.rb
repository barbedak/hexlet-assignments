# frozen_string_literal: true

# BEGIN
module Model
  # добавляем методы класса (extend), при добавлении методов экземпляра (include Model в классе Post)
  def self.included(klass)
    klass.extend(ClassMethod)
  end
  
  module ClassMethod
    attr_accessor :attr_type

    def attribute(name, options = {})
      @attr_type ||= {}
      @attr_type[name] = options.fetch(:type, false)

      type = @attr_type.fetch(name, false)
      
      case type
      when :integer
        define_method("#{name}") do
          self.instance_variable_get("@#{name}").to_i
        end
      when :datetime
        define_method("#{name}") do
          DateTime.parse(self.instance_variable_get("@#{name}"))
        end
      when :string
        define_method("#{name}") do
          self.instance_variable_get("@#{name}").to_s
        end
      else
        define_method("#{name}") do
          self.instance_variable_get("@#{name}")
        end
      end
    
      define_method("#{name}=") do |value|
        self.instance_variable_set "@#{name}", value
      end
    end
  end
  
  def initialize(attrbts = {})
    attrbts.each do |attr|
      name, value = attr
      method("#{name}=").call(value)
    end
  end

  def attributes()
    attributes = {}
    self.instance_variables.each do |attr|
      name = "#{attr}"[1..].to_sym
      attributes = attributes.merge( {name =>  method("#{name}").call} )
    end
    attributes
  end
  
end
# END
