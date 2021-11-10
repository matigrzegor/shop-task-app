# frozen_string_literal: true

class CartItemsController < ApplicationController
  def create
    @products = add_to_cart
  end

  private

  def add_to_cart
    CartService.new(session: session).add(params[:product_id])
  end
end
