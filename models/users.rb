
# create
require 'pg'
require 'bcrypt'
require_relative '../shared.rb'
require 'pry'


#create - CRUD
def create_user(email, password, user_role)
    password_digest = BCrypt::Password.create(password)
    sql = <<~SQL
    INSERT INTO users 
    (email, password_digest, user_role)
    VALUES
    ($1, $2, $3);
  SQL
  run_sql(sql, [email, password_digest, user_role])
end

#read - CRUD
def login_user(email, password)
    sql = "select * from users where email = '#{email}';"
    results = run_sql(sql,[])
    if results.count == 1 && BCrypt::Password.new(results[0]['password_digest']) == password 
        #session has to be established
        session[:user_id] = results[0]['id']
        session[:role] = results[0]['user_role']
        if session[:role] == 'admin'
            redirect '/admin'
        elsif session[:role] == 'customer'
            redirect '/customer'
        else
            redirect '/'
        end   
    else
        redirect '/'
    end
end
def admin_logged_in?
    if session[:user_id] != nil && session[:role] == 'admin'
      return true
    else
      return false
    end
end
 
def current_user
    run_sql("select * from users where id = #{session[:user_id]};")[0]
end
def all_users
    sql = "SELECT * FROM users;"
    # implicit return
    run_sql(sql)
end
def find_one_user_by_email(email)
    sql = "SELECT * FROM users WHERE email = $1;"
    run_sql(sql, [email])[0]
end

def show_all_users
    sql = "SELECT id, email, user_role FROM users;"
    run_sql(sql, [])
end