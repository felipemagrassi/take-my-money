# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Events', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      create(:event)
      get '/events'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      event = create(:event)
      get "/events/#{event.id}" 
      expect(response).to have_http_status(:success)
    end
  end
end
