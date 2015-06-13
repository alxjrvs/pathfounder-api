module ModsDsl::ClassSkillsMethods

  def special(special_key)
    specials_array.push(special_key)
  end

  def specials_array
    @_specials_array ||= []
  end

  def class_skills(*args)
    args.each do |arg|
      class_skills_array.push(arg)
    end
  end

  def class_skills_array
    @_class_skills_array ||= []
  end
end
