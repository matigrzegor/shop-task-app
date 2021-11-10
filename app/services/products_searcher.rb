# frozen_string_literal: true

class ProductsSearcher
  def initialize(query:)
    @query = query
  end

  def call
    products = Product::SearchQuery.new(
      query: query
    ).call

    {
      products: products
    }
  end

  private

  attr_reader :query
end
