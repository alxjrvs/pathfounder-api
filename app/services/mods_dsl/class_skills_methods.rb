module ModsDsl::ClassSkillsMethods
  def class_skills(*args)
    args.each do |arg|
      class_skills_array.push(arg)
    end
  end

  def class_skills_array
    @_class_skills_array ||= []
  end
end
