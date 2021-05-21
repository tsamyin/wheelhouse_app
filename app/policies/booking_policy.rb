class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def update?
    # th = TinyHome.find(record.tiny_home_id)
    record.user == user || record.tiny_home.user == user
  end

  def destroy?
    record.user == user
  end
end
