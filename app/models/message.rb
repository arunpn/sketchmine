class Message
	# Remove the inheritance from ActiveRecord::Base (class Message < ActiveRecord::Base)

	# Include ActiveAttr functionality
	include ActiveAttr::Model

	# Include ActiveModel::Validations
	include ActiveModel::Validations

	# Define attributes
	attribute :name
	attribute :email
	attribute :title
	attribute :author
	attribute :author_link
	attribute :download_link
	attribute :image

	# Mass assignment security
	# Whitelist attributes that you want to mass assign user given data to
  	attr_accessible :name, :email, :title, :author, :author_link, :download_link, :image

  	# Validations
  	# Name must be present
  	validates_presence_of :name

  	# Email must be present and valid email format
  	validates_presence_of :email
  	validates :email, email_format: { message: "is not looking like a valid email address"}

  	# Title must be present
  	validates_presence_of :title

  	# Author must be present
  	validates_presence_of :author

  	validates :author_link, presence: true, :format => URI::regexp(%w(http https))
  	validates :download_link, presence: true, :format => URI::regexp(%w(http https))
  	validates :image, presence: true, :format => URI::regexp(%w(http https))


  	
end
