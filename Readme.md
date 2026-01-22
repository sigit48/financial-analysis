# Manufacturing Credit Risk & Cashflow Exposure Analytics

## Overview
This project delivers an **executive-level credit risk and cashflow exposure analysis** for manufacturing and B2B environments.  
Using **Accounts Receivable (AR)** data, the analysis identifies **customer dependency risk, exposure concentration, and overdue payment behavior** that materially impact working capital stability and operational continuity.

The project is designed to reflect **CFO-oriented financial risk analytics**, similar to practices used in enterprise finance and risk management functions.

---

## Business Context
In manufacturing and B2B operations, delayed customer payments and excessive revenue concentration expose organizations to:

- Cashflow instability  
- Working capital pressure  
- Operational disruption due to dependency on a limited number of customers  

This analysis evaluates AR exposure through a **risk-based financial lens**, enabling early identification of structural credit risk.

---

## Business Objectives
- Identify customers contributing disproportionately to total AR exposure  
- Measure dependency risk that may threaten operational continuity  
- Analyze overdue payment behavior using AR aging structure  
- Support data-driven credit policy and risk mitigation decisions  

---

## Key Business Questions
1. Which customers present the highest cashflow and dependency risk?
2. How concentrated is AR exposure across customers?
3. What proportion of outstanding receivables exceeds acceptable overdue thresholds?
4. Which customers require immediate credit policy intervention?

---

## Core KPIs
- **Total Outstanding Accounts Receivable**
- **Exposure Ratio (%)**
- **Average Days Overdue**
- **AR Aging Distribution**
- **Customer Risk Tier**

---

## Credit Risk Classification Logic

| Exposure Ratio | Risk Tier |
|----------------|-----------|
| ≥ 60% | Operational Shutdown Risk |
| ≥ 50% | Dependency Risk |
| ≥ 30% | High Risk |
| < 30% | Controlled |

This classification framework enables executives to **prioritize intervention** based on financial materiality rather than volume alone.

---

## Analytical Approach
1. Data validation and preparation using **PostgreSQL**
2. Outstanding AR calculation and customer-level exposure analysis
3. Credit risk classification based on exposure thresholds
4. AR aging and overdue structure evaluation
5. Executive-ready dashboard development using **Power BI**

All analytical steps emphasize **reproducibility, transparency, and business relevance**.

---

## Dashboard Overview
The Power BI dashboard is structured into four executive-focused sections:

1. **Executive Overview**  
   High-level KPIs summarizing AR exposure and financial risk indicators

2. **Credit Exposure by Customer**  
   Identification of concentration and dependency risk

3. **AR Aging Structure**  
   Distribution of overdue receivables by aging bucket

4. **Risk Matrix**  
   Exposure versus overdue behavior to support prioritization and policy decisions

---

## Key Insight Example
> **Borneo Mining Services contributes 56% of total AR exposure**, exceeding the dependency risk threshold.  
This level of concentration represents a material threat to cashflow stability and working capital, requiring immediate executive-level credit policy review.

---

## Business Recommendations
- Immediate credit limit and payment term review for high-risk customers  
- CFO-led audit for customers exceeding dependency thresholds  
- Stricter credit controls for accounts with persistent overdue behavior  

---

## Tools & Technologies
- **PostgreSQL** – data querying and validation  
- **Power BI Desktop** – data modeling, DAX, and executive visualization  
- **Microsoft Excel** – initial data inspection  

---

## Project Structure
```text
financial-analysis/
│
├── data/
│   ├── customers.sql
│   ├── products.sql
│   └── sales_invoices.sql
│
├── sql/
│   ├── 01_ar_aging.sql
│   ├── 02_exposure_analysis.sql
│   ├── 03_credit_policy_simulation.sql
│   └── 04_bad_probability_credit_scoring.sql
│
├── power_BI/
│   └── finance.pbix
│
├── images/
│   ├── Screenshot (815).png
│   ├── Screenshot (816).png
│   ├── Screenshot (817).png
│   └── Screenshot (818).png
│
└── README.md
```

---

## Disclaimer

This project uses simulated and anonymized data for analytical and portfolio demonstration purposes only.
No real customer or company data is disclosed.

---

## Author

Sigit Dwiantoro
Data Analyst — Financial Risk & Cashflow Analytics
