class Event < ApplicationRecord
  belongs_to :group, optional: true
  has_many :user_events
  has_many :users, through: :user_events


  def join_by_user?(user)
    user_events.where(user_id: user,apply_status: true).exists?
  end


end
