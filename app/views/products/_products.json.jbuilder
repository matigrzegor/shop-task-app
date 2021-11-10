# frozen_string_literal: true

json.data @products.each do |product|
  json.id product.id
  json.name product.name
  json.categories product.categories do |category|
    json.id category.id
    json.name category.name
  end
  json.price_in_cents product.price_in_cents
end
