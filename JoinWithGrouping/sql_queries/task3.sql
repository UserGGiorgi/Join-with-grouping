SELECT 
    person.surname AS surname,
    person.name AS name,
    person.birth_date AS birth_date,
    SUM(order_details.price*order_details.product_amount) AS [sum]
FROM person
Inner Join customer
on person.id=customer.person_id
inner join customer_order
on customer.person_id=customer_order.customer_id
inner join order_details
on customer_order.id=order_details.customer_order_id
where order_details.price-order_details.price_with_discount=0
AND  customer_order.operation_time between '2021-01-01' and '2021-12-31'
GROUP BY person.id
ORDER  By [sum] ASC ,surname ASC;