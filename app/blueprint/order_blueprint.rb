class OrderBlueprint < Blueprinter::Base
  identifier :id

  fields :sku, :qty, :issue_time, :delivery_time, :deliver_until

  view :incl_product do
    association :product, blueprint: ProductBlueprint
  end

  view :incl_user do
    association :user, blueprint: UserBlueprint
  end

  view :incl_user_product do
    include_view :incl_user
    include_view :incl_product
  end
end
