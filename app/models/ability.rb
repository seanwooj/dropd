class Ability
  include CanCan::Ability

  def initialize(user)
    @user =  user || User.new # guest user (not logged in)
    if user.boss?
      can :manage, :all
    else
      can :read, :all
    end

    can_view_user_resources
  end
end
