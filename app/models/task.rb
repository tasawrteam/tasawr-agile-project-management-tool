class Task < ActiveRecord::Base

  belongs_to :backlog_item
  belongs_to :user

  STATUS_MAP = {
      0 => 'Not started',
      1 => 'In progress',
      2 => 'In QA',
      3 => 'Bug reported',
      4 => 'Done',
      5 => 'Reopened'
  }

  STATUS = STATUS_MAP.collect{|k, v| [v, k]}

  TYPES_MAP = {
      0 => 'Task',
      1 => 'Bug',
      2 => 'Undiscovered task',
      3 => 'Issue'
  }

  TYPES = TYPES_MAP.collect{|k, v| [v, k]}

  def author?(logged_in_user)
    (logged_in_user && logged_in_user.id == user_id) || (logged_in_user && logged_in_user.admin?)
  end

end
