# frozen_string_literal: true

class Product
  class SortQueryFilter
    attr_reader :category_name, :price_in_cents_order

    def initialize(args)
      @category_name = args.fetch(:category_name, nil)
      @price_in_cents_order = args.fetch(:price_in_cents_order, nil)
    end
  end
end
