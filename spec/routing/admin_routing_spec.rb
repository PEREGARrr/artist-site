# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin').to route_to('admin#index')
    end

    context 'artwork' do
      it 'routes to #pastel' do
        expect(get: '/admin/pastel').to route_to('admin#pastel')
      end

      it 'routes to #paintings' do
        expect(get: '/admin/paintings').to route_to('admin#paintings')
      end

      it 'routes to #sketches' do
        expect(get: '/admin/sketches').to route_to('admin#sketches')
      end

      it 'routes to #for_sale' do
        expect(get: '/admin/for_sale').to route_to('admin#for_sale')
      end
    end
  end
end
