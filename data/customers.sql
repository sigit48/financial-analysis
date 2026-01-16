CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name TEXT,
    customer_segment TEXT,
    region TEXT
);

INSERT INTO customers (customer_name, customer_segment, region) VALUES
('PT Astra Manufacturing', 'Enterprise', 'Java'),
('Indo Logistics Corp', 'Mid-Market', 'Java'),
('Borneo Mining Services', 'Enterprise', 'Kalimantan'),
('Sulawesi Energy Group', 'Mid-Market', 'Sulawesi'),
('Papua Infrastructure Ltd', 'SME', 'Papua');
