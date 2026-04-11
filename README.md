# Mysql_1st_Training_Space
En este repositorio estaré practicando SQL desde cero, no como profesor sino como un alumno que no sabe nada del tema... Quieres acompañarme?

# Financial Forecasting Analysis with MySQL

Financial analysis project built using MySQL on a 10-year dataset.
Focused on turning raw financial data into structured insights for business evaluation and decision-making.

## Objective

### Develop a financial analysis system to:

Valuate company performance by year

Validate the reliability of financial metrics

Analyze year-over-year growth and variations

Automate queries for reporting

Simulate basic investment analysis criteria

## Dataset
Source: Kaggle

Period: 2015 to 2024

Frequency: Quarterly

### Includes:

Financial metrics: Revenue, Expenses, Net Income

Balance sheet: Assets, Liabilities, Equity

Indicators: ROE, ROA, EPS, Debt to Equity

External factors: inflation, interest rates

Target variables:

- Next quarter revenue

- Anomaly classification

## Tech Stack

- MySQL

- Advanced SQL

- CTEs

-Window Functions

- Views

- Stored Procedures

## Project Development


### Data validation

- Checked for null values in Company_ID

- Performed audit on financial metrics

### Manual calculations were compared against dataset values:

- Operating Income

- ROE

- ROA

- Debt to Equity


### Result: high consistency across financial indicators.

## Financial metrics construction
- Aggregated Revenue and Expenses by year

- Total Net Income calculation

- Manual calculation of ROE and ROA

- Margin analysis:
  - Operating margin
  
  -  Net margin
    
## Data modeling for analysis

### Created reusable views to structure analysis:

- P_and_L_Metrics
- Balance_Sheet
- Indicators
- Indicators_by_company
  

#### These enable faster and more consistent querying.

## Growth analysis

### Used window functions for time-based analysis:

- LAG function to compare periods
- Growth calculation for:

  - Revenue
  - Expenses
  - Net Income
  - Assets
  - Liabilities
  - Equity

#### Supports trend analysis and performance tracking.

## Query automation

### Developed stored procedures for dynamic reporting:

- P&L by year
- Balance sheet by year
- P&L by company
- Balance sheet by company

#### Enables efficient and repeatable data access.


## Investment analysis use case

### Built a simple ranking model based on:

- Stock price growth
- Revenue growth
- EPS
- ROE

#### Each company receives a composite score:

Invest_Value = sum of ranking positions across metrics


### Output:

- Company ranking by year
- Identification of top-performing companies based on defined criteria

## Example Usage

### CALL INVEST_PROPUSE(2022);

#### Returns company ranking based on financial performance and growth.

# Key Insights
- High consistency between reported and calculated metrics
- Clear differences between operational and financial growth
- Companies with strong market growth do not always show strong profitability
- Combining multiple metrics improves investment evaluation

