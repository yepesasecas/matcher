class GroupsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new group_params
    if @group.save
      redirect_to @group, notice: "Group successfully Created"
    else
      puts @group.errors.inspect
      render :new, "Group was not valid to save."
    end
  end

  private
    def group_params
      params.require(:group).permit(:weekend_value, :talk_about_value, :social_status_value, :meet_value)
    end
end
