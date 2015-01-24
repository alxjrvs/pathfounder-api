module ModsDsl
  class Mod
    attr_reader :trait, :modifier, :name, :source
    def initialize(options, source)
      @trait = options[:trait]
      @modifier = options[:modifier]
      @name = options[:name]
      @source = source
    end
  end
end
