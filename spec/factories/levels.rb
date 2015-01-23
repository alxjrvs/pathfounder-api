FactoryGirl.define do
  factory :level do
    character
    pf_class { FactoryGirl.create :fighter }
  end
end
