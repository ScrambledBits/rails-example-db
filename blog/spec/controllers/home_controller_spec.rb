# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end
end
