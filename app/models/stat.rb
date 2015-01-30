Stat = Struct.new(:name, :value) do
  include ActiveModel::SerializerSupport

  def modifier
    @_modifier ||= (value - 10) / 2
  end
end

