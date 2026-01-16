SET search_path TO finance;

SELECT
    c.customer_name,
    SUM(si.invoice_amount - si.paid_amount) AS outstanding,
    ROUND(
        SUM(si.invoice_amount - si.paid_amount) * 1.0 /
        NULLIF((SELECT SUM(invoice_amount - paid_amount) FROM sales_invoices), 0),
        2
    ) AS exposure_ratio
FROM sales_invoices si
JOIN customers c ON si.customer_id = c.customer_id
WHERE (si.invoice_amount - si.paid_amount) > 0
GROUP BY c.customer_name
ORDER BY exposure_ratio DESC;