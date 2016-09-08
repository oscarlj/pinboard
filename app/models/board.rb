class Board < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	belongs_to :city
end
