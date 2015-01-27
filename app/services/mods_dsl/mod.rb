module ModsDsl
  class Mod
    attr_reader :trait, :modifier, :name, :source
    def initialize(trait: trait, modifier: modifier, name: nil, source: source)
      @trait = trait.to_sym
      @modifier = modifier
      @name = name
      @source = source
    end
  end
end
