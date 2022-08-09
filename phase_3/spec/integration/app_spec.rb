require 'spec_helper'
require 'rack/test'
require_relative '../../app.rb'

RSpec.describe Application do
  include Rack::Test::Methods

  let(:app) {Application.new}

  context "GET /hello" do
    it "returns h1 as Hello!" do
      res = get('/hello')
      expected_response = ("<h1>Hello!</h1>")

      expect(res.status).to eq(200)  
      expect(res.body).to include(expected_response)  
        
    end
    it "returns img Makers.jpg" do
      res = get('/hello')
      expected_response = ("<img src=\"makers.jpg\">")

      expect(res.status).to eq(200)  
      expect(res.body).to include(expected_response)  
        
    end
  end
  
end