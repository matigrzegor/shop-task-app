# frozen_string_literal: true

class Product
  class SortQuery
    def initialize(filter:)
      @filter = filter
    end

    def call
      Product.includes(:categories)
             .where(category_name_condition)
             .order(price_in_cents_order_condition)
    end

    private

    attr_reader :filter

    def category_name_condition
      { categories: { name: filter.category_name } } if filter.category_name
    end

    def price_in_cents_order_condition
      { price_in_cents: filter.price_in_cents_order } if filter.price_in_cents_order
    end
  end
end
