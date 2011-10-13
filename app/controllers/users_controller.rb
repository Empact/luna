class UsersController < ApplicationController
  filter_resource_access

  def show
    @member_bodies = @user.bodies
    @created_bodies = @user.created_bodies
  end
end
