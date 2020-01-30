require 'sinatra'
require_relative 'shared.rb'
require_relative 'models/users.rb'
require_relative 'models/product.rb'
require_relative 'controllers/product.rb'
require_relative 'controllers/user.rb'
require_relative 'controllers/orders.rb'
if development?
  require 'sinatra/reloader'
  require 'pry'
  also_reload 'models/users'
  also_reload 'shared.rb'
  also_reload 'models/product.rb'
  also_reload 'controllers/product.rb'
  also_reload 'controllers/user.rb'
end
enable :sessions
  

get '/' do
  if session[:role] == 'admin'
    redirect '/admin'
  elsif session[:role] == 'customer'
    redirect '/customer'
  else  
    resetsession()
    erb :index
  end
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
    initialize_cart()
    @products = show_all_product()
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
