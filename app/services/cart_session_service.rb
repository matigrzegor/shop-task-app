# frozen_string_literal: true

class CartSessionService
  def initialize(session:)
    @cart = fetch_cart(session)
  end

  def add(product_id)
    cart << product_id
  end

  def remove(product_id)
    cart.delete(product_id)
    cart
  end

  private

  attr_reader :cart

  def fetch_cart(session)
    cart = session[:current_cart]
    return cart if cart

    session[:current_cart] = []
    session[:current_cart]
  end
end
