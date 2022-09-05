#Q1
SELECT productName, buyPrice
	FROM products
;
#Q2
SELECT lastName, firstName
	FROM employees
		WHERE reportsTo=1143
;
#Q3
SELECT DISTINCT productName
	FROM orderdetails, products
		WHERE orderdetails.productCode=products.productCode AND quantityOrdered>=45
;

#Q4
SELECT DISTINCT products.productCode, products.productName
	FROM orderdetails, products, orders
		WHERE  orderdetails.orderNumber=orders.orderNumber AND orderdetails.productCode=products.productCode AND quantityOrdered>=1 AND orderDate BETWEEN '2004-01-01' AND '2004-12-31'
;

#Q5
SELECT DISTINCT orderdetails.orderNumber
	FROM orderdetails, products, orders, customers
		WHERE orderdetails.productCode=products.productCode AND orderdetails.orderNumber=orders.orderNumber AND orders.customerNumber=customers.customerNumber AND (products.productName="The Titanic" OR customers.contactFirstName="julie")
;	

#Q6
SELECT DISTINCT productName, orderDate
	FROM products NATURAL LEFT JOIN (orders, orderdetails)
		WHERE orderDate BETWEEN '2004-01-01' AND '2004-12-31' IS NULL
;

#Q7
SELECT emp.lastName, emp.firstName
	FROM employees AS emp, employees AS emp_mng
		WHERE emp.reportsTo=emp_mng.employeeNumber AND emp_mng.jobTitle LIKE 'Sales Manager%'
;

#Q8
SELECT CONCAT(emp_mng.lastName, emp_mng.firstName) AS 'Non-managerial employees'
	FROM employees AS emp RIGHT OUTER JOIN employees AS emp_mng ON emp.reportsTo = emp_mng.employeeNumber
		WHERE emp.firstName IS NULL
;		    

#Q9
SELECT p1.productName
	FROM products AS p1, products AS p2
		WHERE p1.buyPrice>p2.buyPrice AND p2.productName='The Titanic'
;