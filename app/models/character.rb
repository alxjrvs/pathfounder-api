class Character < ActiveRecord::Base
  has_one :pf_class

  def favored_class
    pf_class
  end
end
