# frozen_string_literal: true

class Category < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :product_category_attachments
  has_many :products, through: :product_category_attachments
end
