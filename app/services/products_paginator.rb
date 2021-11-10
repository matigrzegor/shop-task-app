# frozen_string_literal: true

class ProductsPaginator
  DEFAULT_PER_PAGE = 3
  DEFAULT_PAGE = 1

  def initialize(filter_data:, per_page:, page:)
    @filter_data = filter_data
    @per_page = validate_per_page(per_page)
    @page = validate_page(page)
  end

  def call
    {
      products: fetch_products,
      total: count_total,
      per_page: per_page,
      page: page
    }
  end

  private

  attr_reader :filter_data, :per_page, :page

  def validate_per_page(per_page)
    per_page = per_page.to_i
    if per_page.positive?
      per_page
    else
      DEFAULT_PER_PAGE
    end
  end

  def validate_page(page)
    page = page.to_i
    if page.positive?
      page
    else
      DEFAULT_PAGE
    end
  end

  def fetch_products
    ProductsFetcher.new(
      filter_data: filter_data,
      limit: per_page,
      offset: calculate_offset
    ).call
  end

  def count_total
    Product::CountQuery.new.call
  end

  def calculate_offset
    per_page * (page - 1)
  end
end
