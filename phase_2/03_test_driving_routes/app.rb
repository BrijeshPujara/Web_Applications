require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base

    configure :development do
        register Sinatra::Reloader
      end

  get '/tasks/new' do 
    return erb(:new_tasks)
  end

  post '/tasks' do 
    @task_name = params[:task_name]
    return erb(:create_task)
  end

  
end