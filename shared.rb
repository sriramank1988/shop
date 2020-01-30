def run_sql(sql, args = [])
    conn = PG.connect(ENV['DATABASE_URL'] || {dbname: 'shop'})
    #conn = PG.connect(dbname: 'shop')
    #binding.pry
    results = conn.exec_params(sql, args)
    conn.close
    results
end

def resetsession()
    session[:user_id] = nil  
    session[:role] = nil 
end

def initialize_cart()
    session[:cart] = {
        :product_name => [],
        :quantity => []
    }
end
