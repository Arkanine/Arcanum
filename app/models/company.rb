class Company < ActiveRecord::Base
  validates_presence_of :user_id, :tag_id, :name, :address, :phone

  belongs_to :user
  belongs_to :tag

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ? OR address LIKE ? OR phone LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end
end
