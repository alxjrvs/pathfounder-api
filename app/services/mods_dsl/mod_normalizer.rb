class ModsDsl::ModNormalizer
  attr_reader :mods, :source, :character

  def initialize(mods, source: source, character: character)
    @mods = mods
    @source = source
    @character = character
  end

  def normalize
    mods.each do |m|
      create_mod(m)
    end
  end

  private

  def create_mod(mod)
    Mod.create(
      source: mod[:source] || source,
      character: character,
      role: mod[:role],
      trait: mod[:trait],
      modifier: mod[:modifier]
    )
  end

end
