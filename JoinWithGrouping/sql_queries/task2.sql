Select 
city.name as city,
sum(order_details.price_with_discount*order_details.product_amount) as income
from city
INNER JOIN street
on city.id =street.city_id
INNER JOIN supermarket
on street.id=supermarket.street_id
INNER JOIN customer_order
on customer_order.supermarket_id=supermarket.id
INNER JOIN order_details
on order_details.customer_order_id=customer_order.id
where  customer_order.operation_time between '2020-11-1' and '2020-11-30'
Group By city.name
order by income ASC ,city ASC;