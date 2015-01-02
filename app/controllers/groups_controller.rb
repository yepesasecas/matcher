class GroupsController < ApplicationController
  def index
  end

  def show
    @group = Group.find params[:id]
  end

  def new
    @group = Group.new
  end

  def create
    if @group = current_user.groups.create(group_params)
      @group.owner = current_user
      redirect_to @group, flash: {success: "Group successfully Created"}
    else
      puts @group.errors.inspect
      render :new, "Group was not valid. Please try again."
    end
  end

  private
    def group_params
      params.require(:group).permit(:weekend_value, :talk_about_value, :social_status_value, :meet_value)
    end
end
