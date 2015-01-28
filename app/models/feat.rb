class Feat

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def mods(hash)
    mod = ModsDsl::Mod.new(
      trait: hash.keys.first,
      modifier: hash.values.first,
      name: hash[:name],
      source: source
    )
    mods_array.push mod
  end

  def all_mods
    mods_array
  end

  private

  def mods_array
    @_mods_array ||= []
  end

  def source
    @_source ||= ModsDsl::Source.new(self, name)
  end

end
