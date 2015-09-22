class Recipe < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :reviews

	has_attached_file :recipe_img, :styles => { :recipe_index => "250x350>", :recipe_show => "1325x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :recipe_img, :content_type => /\Aimage\/.*\Z/
end
