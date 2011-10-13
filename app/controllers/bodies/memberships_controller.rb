class Bodies::MembershipsController < ApplicationController
  filter_resource_access nested_in: :bodies

  def index
    @memberships = @body.memberships.page(params[:page])
    @prospective_members = User.exclude(@body.members)
  end

  def create
    @membership.created_by = current_user
    if @membership.save
      flash.notice = "Successfully joined body"
    else
      flash.alert = "Failed to join body"
    end
    redirect_to :back
  end

  def destroy
    @membership.destroy
    redirect_to :back
  end
end
