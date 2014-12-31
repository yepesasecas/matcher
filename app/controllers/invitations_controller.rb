class InvitationsController < ApplicationController
  def show
    @group = Group.find_by invitation_token: params[:id]
  end
end
