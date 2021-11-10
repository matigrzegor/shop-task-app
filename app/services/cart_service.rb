# frozen_string_literal: true

class CartService
  def initialize(session:)
    @session_service = CartSessionService.new(session: session)
  end

  def add(product_id)
    products_query(session_service.add(product_id))
  end

  def remove(product_id)
    products_query(cart.delete(product_id))
  end

  private

  attr_reader :session_service

  def products_query(ids)
    Product.where(id: ids)
  end
end
