def create_product(product_code,name,image_url,quantity_on_hand)
    sql = <<~SQL 
        INSERT INTO product
        (product_code,name,image_url,quantity_on_hand)
        VALUES ($1, $2, $3, $4);
    SQL
    run_sql(sql, [product_code,name,image_url,quantity_on_hand])
end


def find_by_product_code(product_code)
    sql = <<~SQL 
        select * from product where product_code = $1 ;
    SQL
    run_sql(sql,[product_code])[0]
end

def update_product(product_code,name,image_url,quantity_on_hand,old_code)
    sql = <<~SQL
        UPDATE product
        SET product_code = $1, name = $2, image_url = $3, quantity_on_hand = $4
        WHERE product_code = $5;
    SQL
    #binding.pry
    run_sql(sql,[product_code,name,image_url,quantity_on_hand,old_code])
end

def delete_product(product_code)
    sql = <<~SQL
        DELETE FROM product
        WHERE product_code = $1;
    SQL
    run_sql(sql,[product_code])
end