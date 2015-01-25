module Skills
  #http://www.d20pfsrd.com/skills#TOC-Skills-List
  DETAILS = {
    acrobatics: {
      name: :acrobatics,
      untrained: true,
      armlor_check_penalty: true,
      key_stat: :dexterity
   },
    appraise: {
      name: :appraise,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    bluff: {
      name: :bluff,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    climb: {
      name: :climb,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :dexterity
    },
    craft_1: {
      name: :craft_1,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence,
      custom: true
    },
    craft_2: {
      name: :craft_2,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence,
      custom: true
    },
    craft_3: {
      name: :craft_3,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence,
      custom: true
    },
    diplomancy: {
      name: :diplomancy,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    disable_device: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    disguise: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    escape_artist: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    fly: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    handle_animal: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    heal: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    intimidate: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    knowledge_arcana: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    knowledge_dungeoneering: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    knowledge_engineering: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    knowledge_geography: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    knowledge_history: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    knowledge_local: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    knowledge_nature: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    knowledge_nobility: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    knowledge_planes: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    knowledge_religion: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    linguistics: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    perception: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    perform_1: {
      name: :perform_1,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence,
      custom: true
    },
    perform_2: {
      name: :perform_2,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence,
      custom: true
    },
    perform_3: {
      name: :perform_3,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence,
      custom: true
    },
    profession: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    ride: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    sense_motive: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    sleight_of_hand: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    spellcraft: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    stealth: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    survival: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    swim: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    },
    use_magic_device: {
      name: :disable_device,
      untrained: true,
      armor_check_penalty: false,
      key_stat: :intelligence
    }
  }

  ALL = DETAILS.keys
end
