class Feat
  include ModsDsl::ModsMethods

  attr_reader :name, :description, :prerequisites, :bonus_text

  def initialize(name:, description:, types:, prerequisites:, raw_mods:, bonus_text:)
    @name = name
    @description = description
    @types = types
    @prerequisites = prerequisites || []
    @raw_mods = raw_mods || []
    @bonus_text = bonus_text || []
  end

  def mods
    @_mods ||= begin
      array = []
      raw_mods.each do |mod|
        m = ModsDsl::Mod.new(
          trait: mod.keys.first,
          modifier: mod.values.first,
          name: name,
          source: source
        )
        array << m
      end
      array
    end
  end

  private

  attr_reader :raw_mods

  def source
    @_source ||= ModsDsl::Source.new(self, name)
  end
end
