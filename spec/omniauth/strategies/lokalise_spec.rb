# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OmniAuth::Strategies::Lokalise do
  let(:access_token) { instance_double('AccessToken', :options => {}, :[] => 'user') }

  let(:strat) do
    described_class.new({})
  end

  before do
    allow(strat).to receive(:access_token).and_return(access_token)
  end

  context 'client options' do
    it 'has correct site' do
      expect(strat.options.client_options.site).to eq('https://app.lokalise.com')
    end

    it 'has correct authorize_url' do
      expect(strat.options.client_options.authorize_url).to eq('oauth2/auth')
    end

    it 'has correct token_url' do
      expect(strat.options.client_options.token_url).to eq('oauth2/token')
    end

    it 'has correct grant_type' do
      expect(strat.options.client_options.grant_type).to eq('authorization_code')
    end
  end
end
