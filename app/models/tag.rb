class Tag < ActiveRecord::Base
  validates_presence_of :rubric_id, :user_id

  belongs_to :user
  belongs_to :rubric
  has_many :companies, dependent: :destroy
end
