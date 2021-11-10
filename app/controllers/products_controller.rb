# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    result = paginate_products

    @products = result[:products]
    @total = result[:total]
    @page = result[:page]
    @per_page = result[:per_page]

    render 'products/index.json.jbuilder'
  end

  private

  def paginate_products
    ProductsPaginator.new(
      filter_data: {
        category_name: params[:category_name],
        price_in_cents_order: params[:price_in_cents_order]
      },
      per_page: params[:per_page],
      page: params[:page]
    ).call
  end
end
