class City < ActiveRecord::Base
  belongs_to :country
  has_many :boards, dependent: :destroy
end
