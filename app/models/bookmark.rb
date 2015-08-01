class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy
  
  default_scope { order('bookmarks.created_at DESC') }
  
  validates :url, presence: true
  validates :user, presence: true
end
