# Manufacturing Credit Risk & Cashflow Exposure Analytics

## Business Context
In manufacturing and B2B environments, delayed customer payments and excessive exposure concentration pose significant risks to cashflow stability, working capital, and operational continuity.  
This project focuses on analyzing **Accounts Receivable (AR)** data to identify **credit exposure risk, dependency risk, and overdue payment behavior** from a CFO and executive decision-making perspective.

---

## Business Objectives
- Identify customers contributing disproportionately to total AR exposure  
- Measure dependency risk that may threaten operational continuity  
- Analyze overdue patterns through AR aging structure  
- Support data-driven credit policy and risk mitigation decisions  

---

## Key Business Questions
1. Which customers present the highest cashflow and dependency risk?
2. How concentrated is AR exposure across customers?
3. What proportion of outstanding receivables exceeds acceptable overdue thresholds?
4. Which customers require immediate credit policy intervention?

---

## Key KPIs
- **Total Outstanding Accounts Receivable**
- **Exposure Ratio (%)**
- **Average Days Overdue**
- **AR Aging Distribution**
- **Customer Risk Tier**

---

## Risk Classification Logic
| Exposure Ratio | Risk Tier |
|----------------|-----------|
| ≥ 60% | Operational Shutdown Risk |
| ≥ 50% | Dependency Risk |
| ≥ 30% | High Risk |
| < 30% | Controlled |

---

## Analytical Approach
1. Data validation and preparation using **PostgreSQL**
2. Outstanding AR calculation and exposure ratio analysis
3. Customer-level risk classification
4. AR aging and overdue structure analysis
5. Executive-ready dashboard development using **Power BI**

---

## Tools & Technology
- **PostgreSQL** – data querying and validation  
- **Power BI Desktop** – data modeling, DAX, and visualization  
- **Microsoft Excel** – initial data inspection  

---

## Dashboard Overview
The Power BI dashboard is structured into the following sections:

1. **Executive Overview**  
   High-level KPIs summarizing AR exposure and risk indicators

2. **Credit Exposure by Customer**  
   Identification of customer concentration and dependency risk

3. **AR Aging Structure**  
   Distribution of overdue receivables by aging bucket

4. **Risk Matrix**  
   Visualization of exposure versus overdue behavior to support prioritization

---

## Key Insight Example
> Borneo Mining Services contributes **56% of total AR exposure**, exceeding the dependency risk threshold. This level of concentration poses a material threat to cashflow stability and working capital, requiring immediate credit policy review at the executive level.

---

## Business Recommendations
- Immediate credit limit and payment term review for high-risk customers  
- CFO-led audit for customers exceeding dependency thresholds  
- Stricter credit controls for accounts with persistent overdue behavior  

---


---

## Disclaimer
This project uses simulated and anonymized data for analytical and portfolio demonstration purposes only. No real customer data is disclosed.

