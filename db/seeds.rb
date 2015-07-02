
ragnar = Character.create name: "Ragnar"
StatBlock.create character: ragnar,
  wisdom_val: 7,
  intelligence_val: 11,
  strength_val: 16,
  constitution_val: 14,
  dexterity_val: 12,
  charisma_val: 13
SkillList.create character: ragnar

klass = Fighter.create
Level.create character: ragnar, pf_class: klass
ragnar.race = Human.create
ragnar.save!

gods = YAML.load_file('./deities.yaml')

gods.each do |god|
  Deity.create(name: god["name"],
               alignment: god["alignment"].to_sym,
               domains: god["domains"],
               subdomains: god["subdomains"],
               favored_weapon: god["favored_weapon"])
end
