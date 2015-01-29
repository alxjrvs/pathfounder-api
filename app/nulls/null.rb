module Null
  def self.included(klass)
    klass.class_eval do
      include ActiveModel::SerializerSupport
    end
  end

  def nil?
    true
  end

  def default_serializer_options
    {
      serializer: NullSerializer
    }
  end

  def serializable_hash(options = nil)
    {}
  end
end
