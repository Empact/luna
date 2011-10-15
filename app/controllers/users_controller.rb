class UsersController < ApplicationController
  filter_resource_access

  def show
    @member_groups = @user.groups
    @created_groups = @user.created_groups
  end
end
