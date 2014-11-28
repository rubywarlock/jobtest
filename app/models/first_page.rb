class FirstPage < ActiveRecord::Base
	validates :title, presence: true, length: { maximum: 255 }
	validates :text, presence: true, length: { maximum: 500 }

	has_many :second_pages
	has_many :contents
end
