# frozen_string_literal: true

class ProductsSearchesController < ApplicationController
  def create
    result = search_products

    @products = result[:products]

    respond_to do |format|
      format.json
    end
  end

  private

  def search_products
    ProductsSearcher.new(
      query: params[:query]
    ).call
  end
end
