class Bodies::MembershipRequestsController < ApplicationController
  filter_resource_access nested_in: :bodies

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
