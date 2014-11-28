class SecondPage < ActiveRecord::Base
	validates :title, presence: true, length: { maximum: 255 }
	validates :text, presence: true, length: { maximum: 500 }

	belongs_to :first_page
	has_many :third_pages
	has_many :contents
end
