module ModsDsl
  class Mod
    attr_reader :trait, :modifier, :name, :source
    def initialize(trait: , modifier:, name: nil, source:)
      @trait = trait.to_sym
      @modifier = modifier
      @name = name
      @source = source
    end
  end
end
