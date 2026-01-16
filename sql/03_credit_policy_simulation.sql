SET search_path TO finance;

WITH base_invoice AS (
    SELECT
        si.invoice_id,
        si.customer_id,
        c.customer_name,
        si.invoice_date,
        si.invoice_amount,
        COALESCE(si.paid_amount, 0) AS paid_amount,
        (si.invoice_amount - COALESCE(si.paid_amount, 0)) AS outstanding_amount
    FROM sales_invoices si
    JOIN customers c
        ON si.customer_id = c.customer_id
),

payment_term_simulation AS (
    SELECT
        *,
        -- Menggunakan EXTRACT DAY untuk mendapatkan angka murni dari durasi interval
        EXTRACT(DAY FROM (CURRENT_DATE - (invoice_date + INTERVAL '30 days'))) AS overdue_net_30,
        EXTRACT(DAY FROM (CURRENT_DATE - (invoice_date + INTERVAL '45 days'))) AS overdue_net_45,
        EXTRACT(DAY FROM (CURRENT_DATE - (invoice_date + INTERVAL '60 days'))) AS overdue_net_60
    FROM base_invoice
    WHERE outstanding_amount > 0
)

SELECT
    customer_id,
    customer_name,
    ROUND(SUM(outstanding_amount), 2) AS total_outstanding,
    ROUND(AVG(overdue_net_30)::NUMERIC, 1) AS avg_overdue_net_30,
    ROUND(AVG(overdue_net_45)::NUMERIC, 1) AS avg_overdue_net_45,
    ROUND(AVG(overdue_net_60)::NUMERIC, 1) AS avg_overdue_net_60,
    CASE
        WHEN AVG(overdue_net_60) > 60 THEN 'High Cashflow Risk'
        WHEN AVG(overdue_net_60) BETWEEN 31 AND 60 THEN 'Medium Cashflow Risk'
        ELSE 'Low Cashflow Risk'
    END AS projected_risk_tier
FROM payment_term_simulation
GROUP BY customer_id, customer_name
ORDER BY total_outstanding DESC;