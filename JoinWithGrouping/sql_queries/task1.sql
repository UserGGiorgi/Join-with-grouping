Select 
product_category.name as category,
count(product.id) as count
From product_category
INNER JOIN product_title 
ON product_category.id = product_title.product_category_id
INNER JOIN product
ON product_title .id = product.product_title_id
GROUP BY product_category.name
HAVING COUNT(product.id) > 0
ORDER BY category ASC;