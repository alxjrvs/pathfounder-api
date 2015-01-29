module Null
  include ActiveModel::SerializerSupport
  def nil?
    true
  end
end
