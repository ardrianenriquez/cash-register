class CartsController < ApplicationController
  before_action :set_cart, only: [ :show, :add_item ]

  # To create cart and this will be used to add item to the cart that was created
  def create
    cart = Cart.create!

    render json: { cart_id: cart.id }
  end

  def show
    total = Checkout.new(@cart).total
    render json: {
      cart_id: @cart.id,
      items: @cart.cart_items.includes(:product).map do |cart_item|
        {
          code: cart_item.product.code,
          name: cart_item.product.name,
          quantity: cart_item.quantity
        }
      end,
      total: total
    }
  end

  def add_item
    product = Product.find_by(code: params[:code])

    return render json: { error: "Please enter a valid product code" }, status: :unprocessable_entity if product.nil?

    item = @cart.cart_items.find_or_initialize_by(product: product)
    item.quantity += 1
    item.save!

    render json: { message: "#{product.name} was added to cart id: #{@cart.id}" }
  end

  private

  def set_cart
    @cart = Cart.find_by(id: params[:id])

    render json: { message: "Please enter valid cart id" } if @cart.nil?
  end
end
