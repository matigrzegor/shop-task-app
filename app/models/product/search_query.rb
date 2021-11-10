# frozen_string_literal: true

class Product
  class SearchQuery
    def initialize(query:)
      @query = query
    end

    def call
      Product.where('name ILIKE ?', "%#{query}%")
    end

    private

    attr_reader :query
  end
end
