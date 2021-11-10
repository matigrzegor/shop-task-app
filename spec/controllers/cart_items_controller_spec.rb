# frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe CartItemsController, type: :controller do
#   render_views

#   describe 'POST create' do
#     let(:category) { create :category, name: 'category' }
#     let(:product_one) do
#       create :product,
#              name: '##Mk  ',
#              price_in_cents: 300,
#              categories: [category]
#     end
#     let(:product_two) do
#       create :product,
#              name: '##mkk',
#              price_in_cents: 100,
#              categories: [category]
#     end
#     let(:product_three) do
#       create :product,
#              name: 'MK  ',
#              price_in_cents: 150,
#              categories: [category]
#     end
#     let(:product_four) do
#       create :product,
#              name: 'Mm KK',
#              price_in_cents: 500,
#              categories: [category]
#     end

#     before do
#       request.env['HTTP_ACCEPT'] = 'application/json'

#       product_one
#       product_two
#       product_three
#       product_four
#     end

#     it 'returns products that match query "mk"' do
#       post :create, params: { product_id: product_one.id }
#       post :create, params: { product_id: product_two.id }
#     end
#   end
# end
