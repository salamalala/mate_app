# class Ability
#   include CanCan::Ability

#   def initialize(user)
#     user ||= User.new

#     if user.role? :admin
#       can :manage, :all

#     elsif user.journeys_as_captain !nil   
#       can [:update, :destroy], Journey do |journey|
#         journey.user.id == user.id
#         end
#     else
#       can :read, :all
#     end

#   end
# end

