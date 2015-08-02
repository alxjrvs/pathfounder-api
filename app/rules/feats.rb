class Feats
  require 'json'
  RAW = JSON.parse(IO.binread("#{Rails.root}/app/rules/feat.json"))

  def construct(name)
    feats.select { |f| f.name == name }.first
  end

  def feats
    @_feats ||= begin
      RAW.map do |raw_feat|
        Feat.new(
          name: raw_feat["name"],
          description: raw_feat["description"],
          types: raw_feat["types"],
          prerequisites: raw_feat["prerequisites"],
          raw_mods: raw_feat["mods"],
          bonus_text: raw_feat["bonus"]
        )
      end
    end
  end
end
