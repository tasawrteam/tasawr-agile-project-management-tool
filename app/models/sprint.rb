class Sprint < ActiveRecord::Base

  validates_presence_of :name

  STATUS_MAP = {
      0 => 'Scheduled',
      1 => 'Canceled'
  }

  STATUS = STATUS_MAP.collect{|k, v| [v, k]}

  def author?(logged_in_user)
    (logged_in_user && logged_in_user.id == user_id) || (logged_in_user && logged_in_user.admin?)
  end
end
