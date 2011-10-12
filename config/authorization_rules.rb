authorization do
  role :guest do
    has_permission_on :bodies, to: :read
  end

  role :user do
    includes :guest

    has_permission_on :bodies, to: :create
    has_permission_on :bodies, to: [:update, :delete] do
      if_attribute :managers => contains {user}
    end
  end

  role :admin do
    includes :user

    has_permission_on :bodies, to: [:create, :update, :delete]
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
