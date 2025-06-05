# Rockbuster Stealth: Analysis for a Digital Evolution
In response to increasing competition from streaming giants like Netflix and Amazon Prime, the Rockbuster Stealth management team plans to leverage its existing movie licenses to launch an online video rental service and maintain its competitive edge.

## Objective
The goal of this SQL-based analysis is to provide the Rockbuster Stealth management board with data-driven insights to guide their 2020 strategy and successfully launch their online video rental platform in a competitive streaming market. 

## Key Questions
1. Which movies contributed the most or least to revenue gain?
2. What was the average rental duration for all videos?
3. Which countries are Rockbuster customers based in?
4. Where are customers with a high lifetime value based?
5. Do sales figures vary between geographic regions?

_Some questions were answered using SQL queries, while others were addressed through visualizations created in Excel and Tableau, which are included in the final presentation._

## Data 
The dataset used for this analysis contains information about Rockbuster's film inventory, customers, and payments, among other variables.
A full data dictionary is available [here](docs/rockbuster-data-dictionary.pdf).

## Tools
- **PostgreSQL** for querying and data analysis
- **Tableau** for interactive dashboards and visualizations
- **PowerPoint** for presenting insights to stakeholders 

## SQL Queries 
This project includes multiple SQL queries organized by the type of technique used or the analytical goal. Some queries answer the same question using different approaches (CTE or subquery) to demonstrate versatility and understanding. 

### Analytical Queries 
**Top 5 paying customers (average payment):**
- [Using CTEs](sql/cte_avg_payment_top5_customers.sql)
- [Using Subquery](sql/subquery_avg_payment_top5_customers.sql)

**Countries where top 5 customers are located:**
- [Using CTEs](sql/cte_countries_top5_customers.sql)
- [Using Subquery](sql/subquery_countires_top5_customers.sql)

**Descriptive statistics:**
- [Film summary (max,min,avg,mode)](sql/summary_statistics_film_table.sql)
- [Customer mode values](sql/mode_summary_customer_table.sql)

## Presentation
You can view the final presentation prepared for Rockbuster Stealth stakeholders here:
[Download presentation (PDF)](docs/rockbuster-presentation.pdf)
This summary includes key insights, visualizations and strategic recommendations based on the analysis.

## Visualizations
Explore Rockbuster’s data overview in Tableau Public: [Rockbuster Dashboard](https://public.tableau.com/views/Rockbuster_17418751054630/ROCKBUSTERDATAOVERVIEW?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
