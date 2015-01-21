class ModsDsl::ModNormalizer
  attr_reader :mods

  def initialize(mods)
    @mods = mods
  end

  def normalize
    mods.each do |m|
      create_mod(m)
    end
  end

  private

  def create_mod(mod)
    Mod.create(
      role: mod[:role],
      trait: mod[:trait],
      modifier: mod[:modifier]
    )
  end

end
