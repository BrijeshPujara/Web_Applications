require 'spec_helper'
require 'rack/test'
require_relative '../../app.rb'

RSpec.describe Application do
  include Rack::Test::Methods

  let(:app) {Application.new}

  context "GET /tasks/new" do
    it 'should return HTML form to create a new task' do
      res = get('/tasks/new')

      expect(res.status).to eq(200)  
      expect(res.body).to include('<form method="POST" action="/tasks">')  
      expect(res.body).to include('<input type="text" name="task_name"/>')  

  end
end

  context "POST /tasks" do
    it 'should create a new task and return confirmation page with the different name' do
      res = post('/tasks', task_name: 'Go the the Gym')

      expect(res.status).to eq(200)  
      expect(res.body).to include('<h1>You saved task: Go the the Gym </h1>')  

  end
end
  

  

  
    
end
