class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true  # Anyone can view a restaurant
  end

  def create?
    true  # Anyone can create a restaurant
  end

  def update?
    record.user == user  # Only restaurant creator can update it
  end

  def destroy?
    record.user == user  # Only restaurant creator can update it
  end
end
