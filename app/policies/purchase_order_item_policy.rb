class PurchaseOrderItemPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5
  attr_reader :user, :purchase_order_item
  def initialize(user, purchase_order_item)
    @user = user
    @purchase_order_item = purchase_order_item
  end

  def update
    user.admin? || user.manager?
  end

  def create?
    user.admin? || user.manager?
  end
  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
