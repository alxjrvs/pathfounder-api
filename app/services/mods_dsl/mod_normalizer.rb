class ModsDsl::ModNormalizer
  attr_reader :mods, :source

  def initialize(mods, source: source)
    @mods = mods
    @source = source
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
      role: mod[:role],
      trait: mod[:trait],
      modifier: mod[:modifier]
    )
  end

end
