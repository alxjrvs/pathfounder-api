module Skills
  path = "#{Rails.root}/app/rules/skills.json"
  DETAILS = JSON.parse(
    File.read(path),
    symbolize_names: true
    )
  ALL = DETAILS.keys
end
