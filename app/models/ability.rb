class Ability
  include CanCan::Ability

  def initialize(user)
  user ||= User.new


    if user.is_a?(User)
      can [:create, :update,:show], [User, Profile]

      elsif user.is_a?(Admin)
        if user.role?('admin')
          can :manage, [Admin, Profile,ProfileAdmin]
        elsif user.role?('super_admin')
          can :manage, :all
        end

    end
  end
end
