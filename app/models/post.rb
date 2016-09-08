class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :board
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :user, presence: true
  scope :nationality, -> (nationality) { joins(user: :nationality).where('nationalities.name = ?', nationality) }

  def nationality
  	user.nationality
  end
end
