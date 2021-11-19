class UserBlueprint < Blueprinter::Base
  identifier :id

  fields :first_name, :last_name, :email, :address

  view :incl_orders do
    association :orders, blueprint: OrderBlueprint
  end
end
