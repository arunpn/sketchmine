class Pin < ActiveRecord::Base
  attr_accessible :title, :author, :author_link, :download_link, :image

  validates :title, presence: true
  validates :author, presence: true
  validates :author_link, presence: true, :format => URI::regexp(%w(http https))
  validates :download_link, presence: true, :format => URI::regexp(%w(http https))
  validates :user_id, presence: true
  validates_attachment :image, presence: true,
  											content_type: { content_type: [ 'image/jpeg', 'image/jpg', 'image/png', 'image/gif' ]},
  											size: { less_than: 5.megabytes }

  belongs_to :user
  has_attached_file :image, styles: { medium: "320x240"}


end
