class CategoryBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :grocery_name

  view :incl_grocery do
    association :grocery, blueprint: GroceryBlueprint
  end

  view :incl_products do
    association :products, blueprint: ProductBlueprint
  end

  view :extended do
    fields :description
    include_view :incl_grocery
    include_view :incl_products
  end
end
