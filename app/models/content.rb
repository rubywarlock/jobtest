class Content < ActiveRecord::Base
	validates :title, presence: true, length: { maximum: 255 }
	validates :text, presence: true, length: { maximum: 1000 }
	belongs_to :second_page
	belongs_to :first_page
	belongs_to :third_page
end