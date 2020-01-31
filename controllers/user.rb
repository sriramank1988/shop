get '/user/create' do
    erb :"/user/new"
end

post '/user/create' do
    if admin_logged_in?
        #binding.pry
        create_user(params[:email],params[:psw],params[:role])
        redirect '/admin'
    else
        resetsession()
        redirect '/'
    end
end

get '/user/all' do
    if admin_logged_in?
        @users = show_all_users();
        erb :"user/all"
    else
        resetsession()
        redirect '/'
    end
end

get '/user/update/:user_id' do
    if admin_logged_in?
      @user = find_user_by_id(params[:user_id])
      erb :"user/update"
    else
      resetsession()
      redirect '/'
    end 
end

patch '/user/update/:uid' do
    if admin_logged_in?
        update_by_id(params[:uid],params[:email],params[:role])
        redirect '/user/all'
    else
        resetsession()
        redirect '/'
    end 
end
  