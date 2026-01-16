WITH customer_ar AS (
    SELECT
        c.customer_id,
        c.customer_name,
        c.customer_segment,
        c.region,
        COUNT(si.invoice_id) AS invoice_count,
        SUM(si.invoice_amount - COALESCE(si.paid_amount,0)) AS total_outstanding,
        -- Menggunakan ROUND agar hasil hari lebih rapi
        ROUND(AVG(GREATEST(CURRENT_DATE - si.due_date, 0)), 1) AS avg_days_overdue
    FROM finance.sales_invoices si -- Tanpa awalan finance.
    JOIN finance.customers c ON si.customer_id = c.customer_id
    WHERE (si.invoice_amount - COALESCE(si.paid_amount, 0)) > 0
    GROUP BY
        c.customer_id,
        c.customer_name,
        c.customer_segment,
        c.region
)

SELECT
    customer_name,
    customer_segment,
    region,
    invoice_count,
    total_outstanding,
    avg_days_overdue,
    CASE
        WHEN total_outstanding >= 150000000 OR avg_days_overdue > 60
            THEN 'HIGH RISK'
        WHEN total_outstanding BETWEEN 50000000 AND 149999999
            THEN 'MEDIUM RISK'
        ELSE 'LOW RISK'
    END AS credit_risk_tier
FROM customer_ar
ORDER BY total_outstanding DESC;