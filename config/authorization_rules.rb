authorization do
  role :guest do
    has_permission_on :groups, :users, to: :read
  end

  role :user do
    includes :guest

    has_permission_on :groups, :groups_membership_requests, to: :create
    has_permission_on :groups, to: [:update, :delete] do
      if_attribute :managers => contains {user}
    end
    has_permission_on :groups_memberships, :groups_questions, :questions, to: [:read, :create, :update, :delete] do
      if_permitted_to :update, :group
    end
  end

  role :admin do
    includes :user

    has_permission_on :groups, to: [:create, :update, :delete]
  end
end

privileges do
  privilege :read do
    includes :index, :show
  end
  privilege :update do
    includes :edit
  end
  privilege :delete do
    includes :destroy
  end
  privilege :create do
    includes :new
  end
end
