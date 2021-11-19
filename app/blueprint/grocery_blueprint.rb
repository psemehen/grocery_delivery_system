class GroceryBlueprint < Blueprinter::Base
  identifier :id

  fields :name

  view :incl_categories do
    association :categories, blueprint: CategoryBlueprint
  end

  view :extended do
    fields :description
    include_view :incl_categories
  end
end
