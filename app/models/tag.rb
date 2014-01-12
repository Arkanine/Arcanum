class Tag < ActiveRecord::Base
  validates_presence_of :name, :rubric_id

  belongs_to :rubric
  has_many :companies, dependent: :destroy
end
