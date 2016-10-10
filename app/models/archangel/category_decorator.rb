Archangel::Category.class_eval do
  # Associations
  has_many :posts, through: :categorizations,
                   source: :categorizable,
                   source_type: "Archangel::Post"
end
