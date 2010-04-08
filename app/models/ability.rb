class Ability
  include CanCan::Ability

  def initialize(player)
    if player
      can :manage, :all
    else
      can :create, PlayerSession
    end
  end
end