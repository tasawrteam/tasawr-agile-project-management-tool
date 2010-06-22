class Product < ActiveRecord::Base

  belongs_to :user
  has_many :product_backlogs
  has_many :backlog_items

  STATUS_MAP = {
      0 => 'Planning',
      1 => 'In development',
      2 => 'In maintenance',
      3 => 'Phase out'
  }

  STATUS = STATUS_MAP.collect{|k, v| [v, k]}

  def author?(logged_in_user)
    (logged_in_user && logged_in_user.id == user_id) || (logged_in_user && logged_in_user.admin?)
  end
  
end
