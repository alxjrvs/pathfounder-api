class Equipment
  require 'json'
  #http://nessy.info/?p=82
  HASH = JSON.parse(IO.binread("#{Rails.root}/app/rules/equipment.json"))

  def weapons
    {
      simple: by_category["Simple Weapons"],
      exotic: by_category["Exotic Weapons"],
      martial: by_category["Martial Weapons"]
    }
  end

  def armor
    {
      light: by_subcategory["Light armor"],
      medium: by_subcategory["Medium armor"],
      heavy: by_subcategory["Heavy armor"],
      shields: by_subcategory["Shields"]
    }
  end

  def construct(name)
    equipment = find_equipment(name)
    OpenStruct.new(equipment)
  end

  def by_subcategory
    @_by_subcategory ||= begin
      HASH.group_by do |e|
        e["subcategory"]
      end
    end
  end

  def by_category
    @_by_category ||= begin
      HASH.group_by do |e|
        e["category"]
      end
    end
  end

  private

  def find_equipment(name)
    match = HASH.select { |i| i["name"] == name}.first
    return match if match.present?
    {}
  end

end
