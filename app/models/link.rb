class Link < ApplicationRecord
    scope :recent_posts, -> { order(created_at: :desc, id: :desc) }
    validates :url, presence: true
end
