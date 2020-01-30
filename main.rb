require 'sinatra'
if development?
  require 'sinatra/reloader'
  require 'pry'
  also_reload 'models/users'
  also_reload 'shared.rb'
  also_reload 'models/product.rb'
  also_reload 'controllers/product.rb'
  also_reload 'controllers/user.rb'
end
require_relative 'shared.rb'
  require_relative 'models/users.rb'
  require_relative 'models/product.rb'
  require_relative 'controllers/product.rb'
  require_relative 'controllers/user.rb'
  
enable :sessions

get '/' do
  session[:role] = nil
  erb :index
end

post '/' do
  login_user(params[:uname],params[:psw])
end

get '/admin' do
  if session[:role] == 'admin'
    erb :admin
  else
    resetsession()
    redirect '/'
  end
end

get '/customer' do
  if session[:role] == 'customer'
    erb :customer
  else
    resetsession()
    redirect '/'
  end
end

delete '/session' do
  resetsession()
  redirect '/'
end
