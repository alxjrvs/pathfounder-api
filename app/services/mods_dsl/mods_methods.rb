module ModsDsl::ModsMethods
  def mods(hash)
    mod = ModsDsl::Mod.new(
      trait: hash.keys.first,
      modifier: hash.values.first,
      name: hash[:name],
      source: source
    )
    mods_array.push mod
  end

  def mods_array
    @_mods_array ||= []
  end
end
