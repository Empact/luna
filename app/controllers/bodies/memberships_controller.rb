class Bodies::MembershipsController < ApplicationController
  filter_resource_access nested_in: :bodies

  def index
    @memberships = @body.memberships.page(params[:page])
  end

  def create
    @membership.created_by = current_user
    if @membership.save
      redirect_to body_memberships_path(@body)
    else
      render :index
    end
  end

  def destroy
    @membership.destroy
    redirect_to body_memberships_path(@body)
  end
end
