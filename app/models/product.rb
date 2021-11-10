# frozen_string_literal: true

class Product < ApplicationRecord
  validates_presence_of :name, :price_in_cents
  validates_uniqueness_of :name

  has_many :product_category_attachments
  has_many :categories, through: :product_category_attachments
end
