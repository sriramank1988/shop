# shop
CRUD shop Ruby app

Problem :
Licensing cost for a popular cloud application is expensive and they charge per user.
It is impacting the Bottom line of Nuts and Bolts Pty Ltd.
They wanted to build a in house technology team and maintain their own web app.
They have hired a developer (Thats me) for a week to prove them it is worth investing on a in house technology team.

Requirements:

Product catalogue.
    List of all products.
        Create new product,
        View all prdoucts,
        Update existing products,
        deleta a product.
Customer portal : where they can place an order and track order details.
Admin portal : where they can CRUD on all resources, namely Users, orders and products.
Track orders and display order relevant to the user.

Sample login to view the app feature.

App link : https://shop-sri.herokuapp.com/

customer login :
user : customer@xyz.com
password : password

Admin login: admin@admin.com
password : pudding

Known issues:

ACID Properties in DBMS
    When multiple users log in to the system a queing system to gurantee the stock count.
