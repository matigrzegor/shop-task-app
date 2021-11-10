# frozen_string_literal: true

json.partial! 'products', products: @products
json.page @page
json.per_page @per_page
json.total @total
