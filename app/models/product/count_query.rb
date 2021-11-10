# frozen_string_literal: true

class Product
  class CountQuery
    def call
      Product.count
    end
  end
end
