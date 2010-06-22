class ProductBacklog < ActiveRecord::Base

  belongs_to :user
  has_many :backlog_items
  belongs_to :product

  validates_presence_of :name, :product_id

  def author?(logged_in_user)
    (logged_in_user && logged_in_user.id == user_id) || (logged_in_user && logged_in_user.admin?)
  end

  def title
    self.name
  end
end
