class StatBlock < ActiveRecord::Base
  belongs_to :character

  STATS =
    :constitution,
    :charisma,
    :intelligence,
    :wisdom,
    :strength,
    :dexterity

  STATS.each do |stat|
    define_method "#{stat}" do
      Stat.new(stat, calculated_value(stat))
    end
  end

  def all_stats
    STATS.map do |stat|
      self.send(stat)
    end
  end

  def character_sheet
    if character.present?
      character
    else
      NullCharacter.new
    end
  end

  private

  def calculated_value(stat)
    normalized_cal(stat) + character_modifiers(stat)
  end

  def normalized_val(stat)
    self.send("#{stat}_val").to_i
  end

  def character_modifiers(stat)
    character_sheet.total_modifier_for(stat).to_i
  end


end
