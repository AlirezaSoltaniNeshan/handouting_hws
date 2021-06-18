select * from payment join customers using(cust_id) join products using(product_id);

select * from products join product_details using(product_id)