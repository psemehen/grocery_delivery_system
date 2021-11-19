class SupplierBlueprint < Blueprinter::Base
  identifier :id

  fields :name

  view :incl_grocery do
    association :grocery, blueprint: GroceryBlueprint
  end

  view :extended do
    fields :description
    include_view :incl_grocery
  end
end
