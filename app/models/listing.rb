class Listing < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, :styles => { 
			:medium => "300x300>", 
			:thumb => "64x64!" }, 
			:default_url => "default.jpg"
		validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	else
		has_attached_file :image, :styles => { 
			:medium => "300x300>", 
			:thumb => "64x64!" }, 
			:default_url => "default.jpg",
	   		:storage => :dropbox,
		    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
		    :path => "style/:id_:filename"
  		validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  	end
end
