class Pin < ActiveRecord::Base
  attr_accessible :title, :author, :author_link, :download_link

  validates :title, presence: true
  validates :author, presence: true
  validates :author_link, presence: true, :format => URI::regexp(%w(http https))
  validates :download_link, presence: true, :format => URI::regexp(%w(http https))


  belongs_to :user
  validates :user_id, presence: true

end
