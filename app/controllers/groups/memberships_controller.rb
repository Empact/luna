class Groups::MembershipsController < ApplicationController
  filter_resource_access nested_in: :groups

  def index
    @memberships = @group.memberships.page(params[:page])
    @prospective_members = User.exclude(@group.members)
  end

  def create
    @membership.created_by = current_user
    if @membership.save
      flash.notice = "Successfully joined group"
    else
      flash.alert = "Failed to join group"
    end
    redirect_to :back
  end

  def destroy
    @membership.destroy
    redirect_to :back
  end
end
