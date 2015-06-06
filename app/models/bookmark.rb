class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  
  default_scope { order('created_at DESC') }
  
  validates :url, presence: true
  validates :user, presence: true
end
