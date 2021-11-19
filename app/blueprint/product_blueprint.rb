class ProductBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :sku
  field :price do |product|
    product.price_in_usd
  end

  view :incl_category do
    association :category, blueprint: CategoryBlueprint
  end

  view :incl_supplier do
    association :supplier, blueprint: SupplierBlueprint
  end

  view :incl_orders do
    association :orders, blueprint: OrderBlueprint
  end

  view :extended do
    fields :description
    include_view :incl_category
    include_view :incl_supplier
    include_view :incl_orders
  end
end
