require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base

    configure :development do
        register Sinatra::Reloader
      end

  get ('/hello') do 
    res = erb(:index)
    res
  end
end