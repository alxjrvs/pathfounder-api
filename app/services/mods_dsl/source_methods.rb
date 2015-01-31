module ModsDsl::SourceMethods
  def source
    @_source ||= ModsDsl::Source.new(self, self.role_val)
  end
end
