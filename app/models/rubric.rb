class Rubric < ActiveRecord::Base
  validates_presence_of :name

  has_many :tags, dependent: :destroy
end
