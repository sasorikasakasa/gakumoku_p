class GroupsController < ApplicationController
  before_action :authenticate_user!

  def new
    @new_group = Group.new
  end

  def index
    @all_group = Group.all
  end

  def create
    @new_group = Group.new(group_params)
    @new_group.leader_user_id = current_user.id
    @new_group.save
    redirect_to @new_group
  end

  def show
    @group = Group.find(params[:id])
  end

  def followers
    @group = Group.find(params[:id])
    @followers = @group.user_groups.includes(:user).where(follow_status: true)
  end

  def members
    @group = Group.find(params[:id])
    @members = @group.user_groups.includes(:user).where(join_status: true)
  end

  def events
    @group = Group.find(params[:id])
    @group_events = Event.where(group_id: @group.id)
  end


  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to @group
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  def follow_status_update
    user_group = UserGroup.find_or_create_by(user_id: current_user.id,group_id: params[:id])
    user_group.update(follow_status: !user_group.follow_status)
    redirect_to groups_path
  end

  def join_status_update
    user_group = UserGroup.find_or_create_by(user_id: current_user.id,group_id: params[:id])
    user_group.update(join_status: !user_group.join_status)
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:group_name,:group_introduction,:group_image)
  end

end
