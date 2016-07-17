module Archangel
  class Post < ApplicationRecord
    acts_as_paranoid

    # Callbacks
    before_validation :parameterize_slug
    before_save :build_path_before_save
    after_destroy :column_reset

    # Uploader
    mount_uploader :feature, Archangel::FeatureUploader

    # Validation
    validates :author_id, presence: true
    validates :content, presence: true, allow_blank: true
    validates :excerpt, presence: true, allow_blank: true
    validates :path, uniqueness: true
    validates :published_at, allow_blank: true, date: true
    validates :slug, presence: true
    validates :title, presence: true

    # Associations
    belongs_to :author, class_name: Archangel::User

    has_many :categorizations, as: :categorizable
    has_many :categories, through: :categorizations
    has_many :taggings, as: :taggable
    has_many :tags, through: :taggings

    # Default scope
    default_scope { order(published_at: :desc) }

    # Scope
    scope :published, -> { where("published_at <= ?", Time.now) }

    scope :unpublished, lambda {
      where("published_at IS NULL OR published_at > ?", Time.now)
    }

    scope :in_year, lambda { |year|
      unless year.nil?
        where("cast(strftime('%Y', published_at) as int) = ?", year)
      end
    }

    scope :in_month, lambda { |month|
      unless month.nil?
        where("cast(strftime('%m', published_at) as int) = ?", month)
      end
    }

    scope :in_year_and_month, ->(year, month) { in_month(month).in_year(year) }

    scope :published_this_month, lambda {
      where(published_at: Time.now.beginning_of_month..Time.now)
    }

    protected

    def parameterize_slug
      self.slug = slug.to_s.downcase.parameterize
    end

    def build_path_before_save
      year = published_at.nil? ? nil : published_at.year
      month = published_at.nil? ? nil : "%02d" % published_at.month

      self.path = [year, month, slug].compact.join("/")
    end

    def column_reset
      self.slug = "#{Time.current.to_i}_#{slug}"
      self.save
    end
  end
end
