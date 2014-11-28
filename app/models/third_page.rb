class ThirdPage < ActiveRecord::Base
	validates :title, presence: true, length: { maximum: 255 }
	validates :text, presence: true, length: { maximum: 500 }

	belongs_to :second_page
	has_many :contents
end
