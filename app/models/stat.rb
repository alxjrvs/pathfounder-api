Stat = Struct.new(:name, :value) do
  def modifier
    @_modifier ||= (value - 10) / 2
  end
end

