class StatCalculator

  def self.value(statblock, stat)
    character_mod = statblock.character_sheet.total_modifier_for(stat)
    normalized_val = statblock.send("#{stat}_val").to_i
    character_mod + normalized_val
  end
end
