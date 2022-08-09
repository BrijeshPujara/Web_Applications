require 'spec_helper'
require 'rack/test'
require_relative '../../app.rb'

RSpec.describe Application do
  include Rack::Test::Methods

  let(:app) {Application.new}

  context "GET /" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
    #   response = get('/names?name=Julia,Mary,Karim')
    response = post('/names?name=Joe,Alice,Zoe,Julia,Kieran')

      expect(response.status).to eq(200)
      expect(response.body).to eq("Alice, Joe, Julia, Kieran, Zoe")
    end

    it 'returns 404 Not Found' do
      response = get('/')

      expect(response.status).to eq(404)
    
    end
  end
    

  
    
end
