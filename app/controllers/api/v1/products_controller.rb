class Api::V1::ProductsController < Api::V1::ApiController
  def index
    @products = ProductBlueprint.render_as_hash(Product.filter(params[:filter]), view: :extended)
    render json: { products: @products }, status: :ok
  end
end
