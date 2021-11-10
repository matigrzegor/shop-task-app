# frozen_string_literal: true

class ProductCategoryAttachment < ApplicationRecord
  belongs_to :product
  belongs_to :category
end
