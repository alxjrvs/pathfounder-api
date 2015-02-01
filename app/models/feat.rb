class Feat
  include ModsDsl::ModsMethods

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def all_mods
    mods_array
  end

  private

  def source
    @_source ||= ModsDsl::Source.new(self, name)
  end

end
