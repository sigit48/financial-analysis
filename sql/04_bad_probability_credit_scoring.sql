WITH ar_profile AS (
    SELECT
        si.customer_id,
        c.customer_name,
        SUM(si.invoice_amount - COALESCE(si.paid_amount, 0)) AS total_outstanding,
        AVG(CURRENT_DATE - si.due_date) AS avg_days_overdue
    FROM finance.sales_invoices si
    JOIN finance.customers c
        ON si.customer_id = c.customer_id
    WHERE si.invoice_amount > COALESCE(si.paid_amount, 0)
    GROUP BY si.customer_id, c.customer_name
),

scoring_model AS (
    SELECT
        *,
        CASE
            WHEN total_outstanding >= 200000000 THEN 0.45
            WHEN total_outstanding >= 100000000 THEN 0.30
            ELSE 0.15
        END AS exposure_score,

        CASE
            WHEN avg_days_overdue >= 60 THEN 0.35
            WHEN avg_days_overdue >= 30 THEN 0.20
            ELSE 0.10
        END AS delinquency_score
    FROM ar_profile
),

final_scoring AS (
    SELECT
        customer_id,
        customer_name,
        total_outstanding,
        ROUND(avg_days_overdue, 1) AS avg_days_overdue,
        ROUND(exposure_score + delinquency_score, 2) AS bad_debt_probability,
        CASE
            WHEN (exposure_score + delinquency_score) >= 0.60 THEN 'High Risk'
            WHEN (exposure_score + delinquency_score) >= 0.40 THEN 'Medium Risk'
            ELSE 'Low Risk'
        END AS risk_tier
    FROM scoring_model
)

SELECT *
FROM final_scoring
ORDER BY bad_debt_probability DESC;
