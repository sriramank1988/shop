get '/product/new' do
    if admin_logged_in?
      erb :"/product/new"
    else
      resetsession()
      redirect '/'
    end
end

get '/product/all' do
  if session[:role] != nil
    @products = list_all_product()
    erb :"product/all"
  else
    resetsession()
    redirect '/'
  end
  
end
  
post '/product/new' do
    if admin_logged_in?
      create_product(params[:product_code],params[:name],params[:image_url],params[:quantity_on_hand])
      redirect "/product/#{params[:product_code]}"
    else
      resetsession()
      redirect '/'
    end
end

get '/read' do
  redirect "product/#{params[:pcode]}"
end

get '/product/:pcode' do
  if session[:role] != nil
    @product = find_by_product_code(params[:pcode])
    #binding.pry
    erb :"product/view"
  else
    resetsession()
    redirect '/'
  end
end

get '/product/update/:pcode' do
  if admin_logged_in?
    @product = find_by_product_code(params[:pcode])
    erb :"product/update"
  else
    resetsession()
    redirect '/'
  end 
end

patch '/product/update/:old_product_code' do
  if admin_logged_in?
    update_product(params[:product_code],params[:name],params[:image_url],params[:quantity_on_hand],params[:old_product_code])
    #binding.pry
    redirect "/product/#{params[:product_code]}"
  else
    resetsession()
    redirect '/'
  end
end

delete '/product/delete/:pcode' do
  if admin_logged_in?
    delete_product(params[:pcode])
    redirect '/admin'
  else
    resetsession()
    redirect '/'
  end
end