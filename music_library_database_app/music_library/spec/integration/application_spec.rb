require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /albums" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = get('/albums')
      expected_response = "Surfer Rosa, Waterloo, Super Trouper, Bossanova, Lover, Folklore, I Put a Spell on You, Baltimore, Here Comes the Sun, Fodder on My Wings, Ring Ring"

      expect(response.status).to eq(200)
      expect(response.body).to eq(expected_response)
    end
  end

    it 'returns 404 Not Found' do
      response = get('/albu?title=marvel')

      expect(response.status).to eq(404)
      # expect(response.body).to eq(expected_response)
    end

  context "POST/albums - Creates new album" do
    it 'returns 200 ok and creates new album' do
      res = post('/albums',
        title: 'Take Care', 
        release_year: '2017', 
        artist_id: '5')

        expect(res.status).to eq(200)

      res = get('/albums')
        expect(res.body).to include('Take Care')  
    end
  end

    context "GET /artists" do
      it 'returns 200 OK' do
        # Assuming the post with id 1 exists.
        response = get('/artists')
        expected_response = "Pixies, ABBA, Taylor Swift, Nina Simone, Kiasmos"
  
        expect(response.status).to eq(200)
        expect(response.body).to eq(expected_response)
      end
    end

    context "POST/artists - Creates new artist" do
      it 'returns 200 ok and creates new artist' do
        res = post('/artists',
          name: 'Drake', 
          genre: 'Hip-Hop')
  
          expect(res.status).to eq(200)
    
           
        res = get('/artists')
        expected_response = "Pixies, ABBA, Taylor Swift, Nina Simone, Kiasmos, Drake"
        
        expect(res.status).to eq(200)
        expect(res.body).to eq(expected_response)  
      end
    end

    context "GET /albums/:id" do
      it "returns info about album 2" do
        res = get('/albums/2')

        expect(res.status).to eq(200)  
        expect(res.body).to include('<h1>Surfer Rosa</h1>')  
        expect(res.body).to include('<li>Release year: 1988</li>')  
        expect(res.body).to include('<li>Artist: Pixies</li>')  
    end
  end

    context "a context" do
      it "returns all albums in body" do 
        res = get('/albums')
  
        expect(res.status).to eq(200)
        expect(res.body).to include("Surfer Rosa, Waterloo, Super Trouper, Bossanova, Lover, Folklore, I Put a Spell on You, Baltimore, Here Comes the Sun, Fodder on My Wings, Ring Ring, Take Care")    
      end
    end
    

      
  
  
end
