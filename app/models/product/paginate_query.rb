# frozen_string_literal: true

class Product
  class PaginateQuery
    def initialize(sorter:, limit:, offset:)
      @sorter = sorter
      @limit = limit
      @offset = offset
    end

    def call
      base_query.limit(limit).offset(offset)
    end

    private

    attr_reader :sorter, :limit, :offset

    def base_query
      sorter.call
    end
  end
end
