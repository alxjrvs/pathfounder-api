module Weapon
  MELEE = {
    dogslicer: {
      cost: 8,
      dmg_s: 4,
      dmg_m: 6,
      critical: "19-20/x2",
      range: nil,
      weight: 1,
      type: :s,
      special: "fragile"
    }
  }

  RANGED ={
    sling: {
      cost: 0,
      dmg_s: 3,
      dmg_m: 4,
      critical: "x2",
      range: 50,
      weight: 0,
      type: :b,
      special: nil
    }
  }
end
