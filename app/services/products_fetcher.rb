# frozen_string_literal: true

class ProductsFetcher
  def initialize(filter_data:, limit:, offset:)
    @filter_data = filter_data
    @limit = limit
    @offset = offset
  end

  def call
    Product::PaginateQuery.new(
      sorter: initialize_sorter,
      limit: limit,
      offset: offset
    ).call
  end

  private

  attr_reader :filter_data, :limit, :offset

  def initialize_sorter
    Product::SortQuery.new(filter: create_filter)
  end

  def create_filter
    Product::SortQueryFilter.new(
      category_name: filter_data[:category_name],
      price_in_cents_order: filter_data[:price_in_cents_order]
    )
  end
end
