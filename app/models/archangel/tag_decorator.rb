Archangel::Tag.class_eval do
  # Associations
  has_many :posts, through: :taggings,
                   source: :taggable,
                   source_type: "Archangel::Post"
end
