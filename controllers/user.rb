get '/user/create' do
    erb :"/user/new"
end

post '/user/create' do
    if admin_logged_in?
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