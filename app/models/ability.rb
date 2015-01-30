class Ability
  include CanCan::Ability

  def initialize(user)
  user ||= User.new
    if user.class.equal?(User)
      can [:create, :update,:show], [User, Profile]

      elsif user.class.equal?(Admin)
        if user.role?('admin')

        elsif user.role?('super_admin')

        end

    end
  end
end
