CREATE TABLE sales_invoices (
    invoice_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    product_id INT REFERENCES products(product_id),
    invoice_date DATE,
    due_date DATE,
    invoice_amount NUMERIC,
    paid_amount NUMERIC
);

INSERT INTO sales_invoices
(customer_id, product_id, invoice_date, due_date, invoice_amount, paid_amount)
VALUES
-- Fully paid
(1,1,'2024-01-10','2024-02-10',120000000,120000000),
(2,2,'2024-01-15','2024-02-15',85000000,85000000),

-- Partially paid (RISK)
(3,2,'2024-02-01','2024-03-01',150000000,90000000),
(4,3,'2024-02-10','2024-03-10',95000000,50000000),

-- Overdue & unpaid (HIGH RISK)
(1,4,'2024-01-05','2024-02-05',180000000,0),
(5,3,'2024-01-20','2024-02-20',60000000,0);
