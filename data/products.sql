CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name TEXT,
    category TEXT
);

INSERT INTO products (product_name, category) VALUES
('Industrial Control Panel', 'Electrical'),
('Hydraulic Pump Unit', 'Mechanical'),
('Automation Sensor Kit', 'Automation'),
('Custom Fabrication Module', 'Fabrication');

