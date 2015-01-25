class ModIndexer
  def initialize(mods)
    @mods = mods
  end

  def total_bonus_for(trait)
    bonuses = find_by_trait trait
    return 0 if bonuses.empty?
    bonuses.sum(&:modifier)
  end

  def find_by_trait(trait)
    indexed_mods_by_trait[trait.to_sym].to_a
  end

  private
  attr_accessor :mods

  def indexed_mods_by_trait
    @_indexed_mods_by_trait ||= begin
      index = {}
      mods.each do |mod|
        current_value = index[mod.trait].to_a
        index[mod.trait] = current_value + [mod]
      end
      index
    end
  end
end
