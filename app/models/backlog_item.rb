class BacklogItem < ActiveRecord::Base

  belongs_to :user
  belongs_to :product_backlog
  belongs_to :product
  has_many :tasks

  PRIORITY_MAP = {
        0 => 'Normal',
        1 => 'Important',
        2 => 'Very important',
        3 => 'High biz demand',
        4 => 'Super high biz demand'}

  PRIORITY = PRIORITY_MAP.collect{|k, v| [v, k]}

  def author?(logged_in_user)
    (logged_in_user && logged_in_user.id == user_id) || (logged_in_user && logged_in_user.admin?)
  end

  def name
    self.title
  end

end
