patch '/product/cart/add/:pcode' do
    if customer_logged_in?
        if params[:quantity].to_i < get_quantity(params[:pcode]).to_i
            # session[:cart][:product_name] << params[:pcode]
            # session[:cart][:quantity] << params[:quantity]
            session[:cart] << { :pcode =>params[:pcode], :quan => params[:quantity]}
            redirect '/'
        else
            erb :error
        end
    else
        resetsession()
        redirect '/'
    end
end

get '/cart/view' do
    erb :"orders/cart"
end

post '/cart/submit' do
    add_order(session["user_id"].to_i)
    session[:orderid] = get_order_id()["id"].to_i
    confirm_order()
    session[:cart] = []
    erb :"orders/success"
end

get '/orders/view' do
    @orders = list_customer_order(session["user_id"].to_i)
    erb :"orders/view"
end

get '/order/view/:order_id' do
    @details = list_order_details(params[:order_id])
    erb :"orders/detail"
end