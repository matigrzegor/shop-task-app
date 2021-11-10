# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  render_views

  describe 'GET index' do
    let(:category_one) { create :category, name: 'category 1' }
    let(:category_two) { create :category, name: 'category 2' }
    let(:product_one) do
      create :product,
             name: 'name 1',
             price_in_cents: 300,
             categories: [category_one]
    end
    let(:product_two) do
      create :product,
             name: 'name 2',
             price_in_cents: 100,
             categories: [category_two]
    end
    let(:product_three) do
      create :product,
             name: 'name 3',
             price_in_cents: 150,
             categories: [category_one, category_two]
    end
    let(:product_four) do
      create :product,
             name: 'name 4',
             price_in_cents: 500,
             categories: [category_one]
    end

    before do
      product_one
      product_two
      product_three
      product_four
    end

    context 'when no filters are provided' do
      it 'returns page one' do
        get :index, params: { page: 1, per_page: 3 }
        expect(response.status).to eq(200)
        body = JSON.parse(response.body)
        expect(body['data'].size).to eq(3)
        expect(body['page']).to eq(1)
        expect(body['per_page']).to eq(3)
      end

      it 'returns page two' do
        get :index, params: { page: 2, per_page: 3 }

        expect(response.status).to eq(200)
        body = JSON.parse(response.body)
        expect(body['data'].size).to eq(1)
        expect(body['data'].first.keys).to eq(%w[id name categories price_in_cents])
        expect(body['page']).to eq(2)
        expect(body['per_page']).to eq(3)
      end
    end

    context 'when category_name filter is provided' do
      it 'returns page one' do
        get :index, params: {
          page: 1,
          per_page: 3,
          category_name: 'category 2'
        }

        expect(response.status).to eq(200)
        body = JSON.parse(response.body)
        expect(body['data'].size).to eq(2)
        expect(body['page']).to eq(1)
        expect(body['per_page']).to eq(3)
      end

      it 'returns page two' do
        get :index, params: {
          page: 2,
          per_page: 3,
          category_name: 'category 2'
        }

        expect(response.status).to eq(200)
        body = JSON.parse(response.body)
        expect(body['data'].size).to eq(0)
        expect(body['page']).to eq(2)
        expect(body['per_page']).to eq(3)
      end
    end

    context 'when price_in_cents_order filter is desc' do
      it 'returns page one' do
        get :index, params: {
          page: 1,
          per_page: 3,
          price_in_cents_order: 'desc'
        }

        expect(response.status).to eq(200)
        body = JSON.parse(response.body)
        expect(body['data'].map { |e| e['id'] }).to eq(
          [
            product_four.id,
            product_one.id,
            product_three.id
          ]
        )
        expect(body['page']).to eq(1)
        expect(body['per_page']).to eq(3)
      end

      it 'returns page two' do
        get :index, params: {
          page: 2,
          per_page: 3,
          price_in_cents_order: 'desc'
        }

        expect(response.status).to eq(200)
        body = JSON.parse(response.body)
        expect(body['data'].size).to eq(1)
        expect(body['data'].map { |e| e['id'] }).to eq([product_two.id])
        expect(body['page']).to eq(2)
        expect(body['per_page']).to eq(3)
      end
    end

    context 'when price_in_cents_order filter is asc' do
      it 'returns page one' do
        get :index, params: {
          page: 1,
          per_page: 3,
          price_in_cents_order: 'asc'
        }

        expect(response.status).to eq(200)
        body = JSON.parse(response.body)
        expect(body['data'].map { |e| e['id'] }).to eq(
          [
            product_two.id,
            product_three.id,
            product_one.id
          ]
        )
        expect(body['page']).to eq(1)
        expect(body['per_page']).to eq(3)
      end

      it 'returns page two' do
        get :index, params: {
          page: 2,
          per_page: 3,
          price_in_cents_order: 'asc'
        }

        expect(response.status).to eq(200)
        body = JSON.parse(response.body)
        expect(body['data'].size).to eq(1)
        expect(body['data'].map { |e| e['id'] }).to eq([product_four.id])
        expect(body['page']).to eq(2)
        expect(body['per_page']).to eq(3)
      end
    end

    context 'when category_name and price_in_cents_order filters are provided' do
      it 'returns page one' do
        get :index, params: {
          page: 1,
          per_page: 3,
          price_in_cents_order: 'desc',
          category_name: 'category 2'
        }

        expect(response.status).to eq(200)
        body = JSON.parse(response.body)
        expect(body['data'].map { |e| e['id'] }).to eq(
          [
            product_three.id,
            product_two.id
          ]
        )
        expect(body['page']).to eq(1)
        expect(body['per_page']).to eq(3)
      end

      it 'returns page two' do
        get :index, params: {
          page: 2,
          per_page: 3,
          price_in_cents_order: 'desc',
          category_name: 'category 2'
        }

        expect(response.status).to eq(200)
        body = JSON.parse(response.body)
        expect(body['data'].size).to eq(0)
        expect(body['data'].map { |e| e['id'] }).to eq([])
        expect(body['page']).to eq(2)
        expect(body['per_page']).to eq(3)
      end
    end
  end
end
