class Group < ApplicationRecord

  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :events


  def follow_by_user?(user)
    user_groups.where(user_id: user,follow_status: true).exists?
  end

  def join_by_user?(user)
    user_groups.where(user_id: user,join_status: true).exists?
  end


end
