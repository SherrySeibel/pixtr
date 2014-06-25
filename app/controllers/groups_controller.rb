class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      GroupMembership.create(
        user_id: current_user.id,
        group_id: @group.id
      )

      redirect_to :groups
    else
      render :new
    end
  end

  def index
    @groups = Group.all
    @group_membership = GroupMembership.new
    @my_groups = current_user.groups
  end

  def show
    @group = Group.find(params[:id])
  end

  private

  def group_params
    params.require(:group).
      permit(:name, :description)
  end
end
