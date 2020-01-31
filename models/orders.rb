def get_quantity(pcode)
    sql = <<~SQL
        select quantity_on_hand from product where product_code = $1 ;
    SQL
    run_sql(sql,[pcode])[0]["quantity_on_hand"]
end

def add_order(cust_id)
    sql = <<~SQL
        INSERT INTO orders (customer_id, status) values ($1,$2);
    SQL
    run_sql(sql,[cust_id, "open"])
end

def get_order_id()
    sql = <<~SQL
        SELECT id FROM orders ORDER BY id DESC;
    SQL
    run_sql(sql,[])[0]
end

def confirm_order()
    session[:cart].each do |item|
        sql = <<~SQL
            INSERT INTO orders_products (order_id, product_id, quantity) values ($1, $2, $3);
         SQL
        run_sql(sql,[session[:orderid], item[:pcode], item[:quan]])
        update_quantity(item[:pcode],(get_quantity(item[:pcode]).to_i - item[:quan].to_i))
    end
end

def list_customer_order(cust_id)
    sql = <<~SQL
        select * from orders where customer_id = $1;
    SQL
    run_sql(sql,[cust_id])
end

def list_order_details(order_id)
    sql = <<~SQL
        select * from orders_products where order_id = $1;
    SQL
    run_sql(sql,[order_id.to_i])
end

def get_open_orders()
    sql = <<~SQL
        SELECT * FROM orders where status = 'open';
    SQL
    run_sql(sql,[])
end