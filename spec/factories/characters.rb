FactoryGirl.define do
  factory :character do
    name "Ragnar"
    race {FactoryGirl.create :human}
    deity_name "Azathoth"
  end
end
