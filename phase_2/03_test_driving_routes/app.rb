require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base

    configure :development do
        register Sinatra::Reloader
      end

  # GET /
  # Root path (homepage, index page)

  
  get '/names' do
    name = params[:name]
    name.split(",").join(", ")
  end
  
  post '/sort-names' do
    name = params[:name]
    name.split(",").sort.join(", ")
  end
  # end
  #   name = params[:name]
  #   cohort_name = params[:cohort_name]
  #   #  http://localhost:9292/posts?name=brijesh&cohort_name=July

  #   # p name
  #   # p cohort_name
    
  #   return "Hello #{name} you're in cohort #{cohort_name}"

  # end

  # post '/submit' do
  #   name = params[:name]
  #   message = params[:message]

  #   "Thanks #{name}, you sent this message: #{message}"
  # end
end