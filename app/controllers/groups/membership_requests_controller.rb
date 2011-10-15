class Groups::MembershipRequestsController < ApplicationController
  filter_resource_access nested_in: :groups

  def create
    @membership_request.member = current_user
    if @membership_request.save
      flash.notice = "Successfully requested membership"
    else
      flash.alert = "Failed to request membership"
    end
    redirect_to :back
  end
end
