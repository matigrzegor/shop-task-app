# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsSearchesController, type: :controller do
  render_views

  describe 'POST create' do
    let(:category) { create :category, name: 'category' }
    let(:product_one) do
      create :product,
             name: '##Mk  ',
             price_in_cents: 300,
             categories: [category]
    end
    let(:product_two) do
      create :product,
             name: '##mkk',
             price_in_cents: 100,
             categories: [category]
    end
    let(:product_three) do
      create :product,
             name: 'MK  ',
             price_in_cents: 150,
             categories: [category]
    end
    let(:product_four) do
      create :product,
             name: 'Mm KK',
             price_in_cents: 500,
             categories: [category]
    end

    before do
      request.env['HTTP_ACCEPT'] = 'application/json'

      product_one
      product_two
      product_three
      product_four
    end

    it 'returns products that match query "mk"' do
      post :create, params: { query: 'mK' }
      expect(response.status).to eq(200)
      body = JSON.parse(response.body)
      expect(body['data'].map { |e| e['id'] }.sort).to eq(
        [
          product_one.id,
          product_two.id,
          product_three.id
        ]
      )
    end

    it 'returns products that match query "MK"' do
      post :create, params: { query: 'MK' }
      expect(response.status).to eq(200)
      body = JSON.parse(response.body)
      expect(body['data'].map { |e| e['id'] }.sort).to eq(
        [
          product_one.id,
          product_two.id,
          product_three.id
        ]
      )
    end

    it 'returns products that match query "Mk"' do
      post :create, params: { query: 'Mk' }
      expect(response.status).to eq(200)
      body = JSON.parse(response.body)
      expect(body['data'].map { |e| e['id'] }.sort).to eq(
        [
          product_one.id,
          product_two.id,
          product_three.id
        ]
      )
    end

    it 'returns products that match query "mk"' do
      post :create, params: { query: 'mk' }
      expect(response.status).to eq(200)
      body = JSON.parse(response.body)
      expect(body['data'].map { |e| e['id'] }.sort).to eq(
        [
          product_one.id,
          product_two.id,
          product_three.id
        ]
      )
    end

    it 'returns products that match query "m K"' do
      post :create, params: { query: 'm K' }
      expect(response.status).to eq(200)
      body = JSON.parse(response.body)
      expect(body['data'].map { |e| e['id'] }.sort).to eq([product_four.id])
    end
  end
end
