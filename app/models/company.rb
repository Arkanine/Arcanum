class Company < ActiveRecord::Base
  validates_presence_of :user_id, :tag_id, :name, :address, :phone

  belongs_to :user
  belongs_to :tag
end
