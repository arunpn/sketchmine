class Pin < ActiveRecord::Base
  attr_accessible :title, :author, :author_link, :download_link, :image, :image_remote_url, :tag_list
  acts_as_taggable

  validates :title, presence: true
  validates :author, presence: true
  validates :author_link, presence: true, :format => URI::regexp(%w(http https))
  validates :download_link, presence: true, :format => URI::regexp(%w(http https))
  validates :user_id, presence: true
  validates_attachment :image, presence: true,
  											content_type: { content_type: [ 'image/jpeg', 'image/jpg', 'image/png', 'image/gif' ]},
  											size: { less_than: 5.megabytes }
  validates :tag_list, presence: true

  belongs_to :user
  has_attached_file :image, styles: { medium: "350x260^"},
                    convert_options: { medium: "-gravity center -extent 350x260" }

  def image_remote_url=(url_value)
    self.image=URI.parse(url_value) unless url_value.blank?
    super 
  end

end
