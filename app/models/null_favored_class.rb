class NullFavoredClass
  Character::CLASS_DELEGATES.each do |m|
    define_method m do
      nil
    end
  end

end
