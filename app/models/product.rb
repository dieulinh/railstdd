class Product < ActiveRecord::Base
	validates :title, :description, presence: true
	validates :price, numericality: { greater_than: 0}
	validate :title_is_shorter_than_description
	before_validation { |product| product.title.downcase! if product.title }


	def title_is_shorter_than_description
		return if title.blank? or description.blank?

		if title.length > description.length
			errors.add(:title,  "title is longer than description")
		end
	end
end