

-- Importamos via CSV el Archivo que descargamos de Kaggle.com
-- This dataset contains structured and semi-structured financial data for multiple companies over a 10-year period (2015–2024).

-- It includes quarterly core accounting metrics (revenue, expenses, net income, assets, liabilities, equity, EPS, ROE, ROA, debt-to-equity ratio, cash flow, and stock prices) alongside contextual indicators such as news sentiment, social media buzz, sector trends, and macroeconomic factors (inflation, interest rates, exchange rates).

-- The dataset also includes target variables:

-- Target_Revenue_Next_Qtr – Regression target for revenue forecasting

-- Target_Anomaly_Class – Classification target for detecting anomalies such as audit issues, fraud, market shocks, or policy changes


-- This is my first repository and my first time using and working with MySQL

-- I tried to apply the little knowledge I was able to acquire by watching YouTube videos and free courses, as well as some paid ones.


-- A query of all columns is made to confirm all the columns

SELECT * FROM `financial forecasting dataset (2015–2024)`
LIMIT 10;
-- And it is checked that the column COMPANY_ID does not contain nulls
SELECT * FROM `financial forecasting dataset (2015–2024)`
WHERE Company_ID IS NULL;

-- The table is renamed to Financial_Data in order to make queries more conveniently and not use the original file name
ALTER TABLE `financial forecasting dataset (2015–2024)`
RENAME TO 'Financial_Data';

-- Originally, the goal was to practice views and stored procedures extensively
-- Therefore, there will not be much creation and manipulation of tables
-- but rather a lot of creation of views, stored procedures, CTEs, and window functions.


-- We proceed with the query of main indicators, by year and not by quarter as suggested by the dataset
-- therefore, it will be constantly grouped by year

-- We create a new view to see the original Dataset
CREATE VIEW all_data AS
    SELECT * FROM financial_forecasting.financial_data;

-- When referring to main indicators, it means those already included in the DATASET
-- (revenue, expenses, net income, assets, liabilities, equity, EPS, ROE, ROA, debt-to-equity ratio, cash flow, and stock prices)
-- alongside contextual indicators such as news sentiment, social media buzz, sector trends,
-- and macroeconomic factors (inflation, interest rates, exchange rates).
-- Main indicators:


SELECT 
	FD.Company_ID, 
    FD.Year, 
    SUM(FD.Revenue) as Total_Revenue, 
    SUM(FD.Expenses) As Total_Expenses,
    Round((SUM(FD.Revenue)-SUM(FD.Expenses)),2) AS Calculated_Operating_Income,
    Round((SUM(FD.Net_Income)/SUM(FD.Equity)),2) AS Calculated_ROE,
    Round((SUM(FD.Net_Income)/SUM(FD.Assetes)),2) AS Calculated_ROA,
    Round((SUM(FD.Liabilities)/SUM(FD.Equity)),2) AS Calculated_Debt_to_Equity,
    ROUND(SUM(FD.Operating_Income),2) AS Provided_OP_Income,
    round(SUM(FD.Net_Income),2) as Total_Net_Income
FROM Financial_forecasting.Financial_Data AS FD
GROUP BY
	FD.Company_ID,
    FD.Year
ORDER BY
	FD.Year,
    FD.Company_ID;

## AUDIT
--  We are going to measure whether the performance indicators show a variation that is significantly different from the ones that can be calculated
SELECT

    FD.`Company_ID`,          -- Calculate Operational INCOME     
    SUM(if((((FD.REVENUE -  FD.EXPENSES) - fd.`Operating_Income`)) BETWEEN  -10 and 10, 0, 1)) as manual_audit_Income, 
    SUM(if (((FD.`Net_Income`/FD.`Equity`)*100 -  FD.`ROE`) BETWEEN -0.01 and 0.01, 0,1)) as manual_audit_roe,
    SUM(if( ((FD.`Net_Income`/FD.`ASSETS`)*100 -FD.`ROA`) BETWEEN -0.01 and 0.01, 0, 1))as manual_audit_roA,
    SUM(if(((fd.`Liabilities`/fd.`Equity`) - fd.`Debt_to_Equity`) BETWEEN -0.01 and 0.01, 0, 1)) as manual_audit_debt_to_equity

FROM financial_forecasting.financial_data AS FD
GROUP BY
    FD.`Company_ID`;

## Conclusion: the reliability of the performance indicators is high


-- We'll create VIEWS for the P&L and the balance_sheet 

CREATE VIEW P_and_L_Metrics AS
    SELECT  
        FD.`Company_ID`,
        FD.Year,
        SUM(FD.`Revenue`) AS TOTAL_REVENUE,
        SUM(FD.`Expenses`) AS TOTAL_EXPENSES,
        SUM(FD.`Operating_Income`) AS TOTAL_OP_INCOME,
        SUM(FD.`Net_Income`) AS TOTAL_NET_INCOME
        

    FROM financial_forecasting.financial_data AS FD
    group by   FD.`Company_ID`, FD.Year; 



CREATE VIEW Balance_Sheet AS
    SELECT  
        FD.`Company_ID`,
        FD.Year,
        SUM(FD.`Assets`) AS TOTAL_ASSESTS,
        SUM(FD.`Liabilities`) AS TOTAL_LIABILITY,
        SUM(FD.`Equity`) AS TOTAL_EQUITY
        

    FROM financial_forecasting.financial_data AS FD
    group by   FD.`Company_ID`, FD.Year;




-- We'll Use the indicators in the DATASET
-- A view is created so you can find the indicators easily

    
    CREATE VIEW INDICATORS
		AS
			SELECT  
				FD.`Company_ID`,
				FD.Year,
				SUM(FD.`Revenue`) AS TOTAL_REVENUE,
				SUM(FD.`Expenses`) AS TOTAL_EXPENSES,
				SUM(FD.`Operating_Income`) AS TOTAL_OP_INCOME,
				SUM(FD.`Net_Income`) AS TOTAL_NET_INCOME,
				"-",
				SUM(FD.`Assets`) AS TOTAL_ASSESTS,
				SUM(FD.`Liabilities`) AS TOTAL_LIABILITY,
				SUM(FD.`Equity`) AS TOTAL_EQUITY,
				"-",
				SUM(FD.`Cash_Flow`) AS CASH_FLOW,
				"-",
				AVG(FD.`ROE`) AS AVG_ROE,
				AVG(FD.`ROA`) AS AVG_ROA,
				AVG(FD.`Debt_to_Equity`) AS AVG_Debt_to_Equity,
				"-",
				AVG(FD.`Stock_Price`) AS AVG_STOK_PRICE,
				"-",
				AVG(FD.`Inflation_Rate`) AS INFLATION,
				AVG(FD.`Interest_Rate`) AS AVG_Interest_Rate,
				"PROFITABILITY",
				(SUM(FD.`Net_Income`)/SUM(FD.`Revenue`)) AS Net_Margin,
				((SUM(FD.`Revenue`) - SUM(FD.`Expenses`))/
					SUM(FD.`Revenue`)) AS OPERATING_MARGIN,
				"EFFICIENT",
				(SUM(FD.`Revenue`)/SUM(FD.`Assets`)) AS Assets_Turnover,
				"LEVERAGE",
				(SUM(FD.`Liabilities`)/SUM(FD.`Assets`)) AS DEBT_RATIO,
				"LIQUITY",
				(SUM(FD.`Cash_Flow`)/SUM(FD.`Revenue`)) AS cashflow_ratio

			FROM financial_forecasting.financial_data AS FD
			group by   FD.`Company_ID`, FD.Year;




-- -- A window function should be created (to calculate the total sales per company and compute the margins)
-- also (to create a window function for lag and lead to perform horizontal and vertical analysis)


-- We create a view for the Balance_sheet_growth and P&l between years
-- as the 1st year (2015) do not have a previous years to compare with a 0% we'll be shows

-- We create a view for the Balance_sheet and P&l variance between years
CREATE VIEW balance_sheet_growth 
    AS
with current_period 
    as (
        select fd.Company_ID AS Company_ID,
            fd.Year AS Year,
            sum(fd.Assets) AS CURRENT_ASSETS,
            sum(fd.Liabilities) AS CURRENT_LIABILITY,
            sum(fd.Equity) AS CURRENT_EQUITY from financial_forecasting.financial_data as fd 
            group by fd.Company_ID,
                fd.Year
            ), 
                previous_period 
                    as (
                    select current_period.Company_ID AS Company_ID,
                        current_period.Year AS Year,
                        lag(current_period.CURRENT_ASSETS) 
                            OVER (
                                PARTITION BY current_period.Company_ID 
                                ORDER BY current_period.Year 
                                )  AS PREVIOUS_ASSETS,
                        lag(current_period.CURRENT_LIABILITY) 
                            OVER (
                                PARTITION BY current_period.Company_ID 
                                ORDER BY current_period.Year 
                                )  AS PREVIOUS_LIABILITY,
                        lag(current_period.CURRENT_EQUITY) 
                            OVER (
                                PARTITION BY current_period.Company_ID ORDER BY current_period.Year )  AS PREVIOUS_EQUITY,current_period.CURRENT_ASSETS AS CURRENT_ASSETS,current_period.CURRENT_LIABILITY AS CURRENT_LIABILITY,current_period.CURRENT_EQUITY AS CURRENT_EQUITY from current_period) 
                                select previous_period.Company_ID AS Company_ID,
                                previous_period.Year AS Year,
                                concat(round(ifnull(((previous_period.CURRENT_ASSETS / previous_period.PREVIOUS_ASSETS) - 1),0),2),"%") AS ASSETS_GROWTH,
                                concat(round(ifnull(((previous_period.CURRENT_LIABILITY / previous_period.PREVIOUS_LIABILITY) - 1),0),2),"%") AS LIABILITY_GROWTH,
                                concat(round(ifnull(((previous_period.CURRENT_EQUITY / previous_period.PREVIOUS_EQUITY) - 1),0),2),"%") AS EQUITY_GROWTH 
                                from previous_period;


-- Create a view for Variance of P&L

CREATE VIEW P_AND_L_GROWTH 
AS
	with current_period 
		as (
			select fd.Company_ID AS Company_ID,
				fd.Year AS Year,
				sum(fd.REVENUE) AS CURRENT_REVENUE,
				sum(fd.EXPENSES) AS CURRENT_EXPENSES,
				sum(fd.net_INCOME) AS CURRENT_net_INCOME from financial_forecasting.financial_data as fd 
				group by fd.Company_ID,
					fd.Year
				), 
					previous_period 
						as (
						select current_period.Company_ID AS Company_ID,
							current_period.Year AS Year,
							lag(current_period.CURRENT_REVENUE) 
								OVER (
									PARTITION BY current_period.Company_ID 
									ORDER BY current_period.Year 
									)  AS PREVIOUS_REVENUE,
							lag(current_period.CURRENT_EXPENSES) 
								OVER (
									PARTITION BY current_period.Company_ID 
									ORDER BY current_period.Year 
									)  AS PREVIOUS_EXPENSES,
							lag(current_period.CURRENT_net_INCOME) 
								OVER (
									PARTITION BY current_period.Company_ID ORDER BY current_period.Year )  AS PREVIOUS_net_INCOME,current_period.CURRENT_REVENUE AS CURRENT_REVENUE,current_period.CURRENT_EXPENSES AS CURRENT_EXPENSES,current_period.CURRENT_net_INCOME AS CURRENT_net_INCOME from current_period) 
									select previous_period.Company_ID AS Company_ID,
									previous_period.Year AS Year,
									concat(round(ifnull(((previous_period.CURRENT_REVENUE / previous_period.PREVIOUS_REVENUE) - 1),0),2),"%") AS REVENUE_GROWTH,
									concat(round(ifnull(((previous_period.CURRENT_EXPENSES / previous_period.PREVIOUS_EXPENSES) - 1),0),2),"%") AS EXPENSES_GROWTH,
									concat(round(ifnull(((previous_period.CURRENT_net_INCOME / previous_period.PREVIOUS_net_INCOME) - 1),0),2),"%") AS net_INCOME_GROWTH 
									from previous_period;


-- Now we're going to create a view for all those indicators stakeholders use to see
CREATE VIEW indicators_by_company
	AS 
	SELECT  
					FD.`Company_ID`,
					SUM(FD.`Cash_Flow`) AS CASH_FLOW,
					"-",
					AVG(FD.`ROE`) AS AVG_ROE,
					AVG(FD.`ROA`) AS AVG_ROA,
					AVG(FD.`Debt_to_Equity`) AS AVG_Debt_to_Equity,
					"-",
					"PROFITABILITY",
					(SUM(FD.`Net_Income`)/SUM(FD.`Revenue`)) AS Net_Margin,
					((SUM(FD.`Revenue`) - SUM(FD.`Expenses`))/
						SUM(FD.`Revenue`)) AS OPERATING_MARGIN,
					"EFFICIENT",
					(SUM(FD.`Revenue`)/SUM(FD.`Assets`)) AS Assets_Turnover,
					"LEVERAGE",
					(SUM(FD.`Liabilities`)/SUM(FD.`Assets`)) AS DEBT_RATIO,
					"LIQUITY",
					(SUM(FD.`Cash_Flow`)/SUM(FD.`Revenue`)) AS cashflow_ratio

				FROM financial_forecasting.financial_data AS FD
				group by   FD.`Company_ID`;
                

-- After some of the most important view
-- I Wanted to focus the main information for every year and every company indicidualy
-- so I conclude the best way to do this is a Structured_Procedure
-- you'll note that for year diferent
DELIMITER $$
CREATE PROCEDURE P_AND_L_BY_YEAR (
IN
    FOCUS_YEAR INT
    COMPANY TEXT
    )
    BEGIN

        SELECT  -- Se crea vista para el P&L 
            FD.`Company_ID`,
            FD.Year,
            SUM(FD.`Revenue`) AS TOTAL_REVENUE,
            SUM(FD.`Expenses`) AS TOTAL_EXPENSES,
            SUM(FD.`Operating_Income`) AS TOTAL_OP_INCOME,
            SUM(FD.`Net_Income`) AS TOTAL_NET_INCOME
            

        FROM financial_forecasting.financial_data AS FD
        WHERE FD.YEAR = FOCUS_YEAR
        group by   FD.`Company_ID`, FD.Year; 
    END$$
DELIMITER;



CREATE PROCEDURE BALANCE_SHEET_BY_YEAR (
IN
    FOCUS_YEAR INT
    )
    BEGIN

        SELECT  -- Se crea vista para el P&L 
            FD.`Company_ID`,
            FD.Year,
                SUM(FD.`Assets`) AS TOTAL_ASSESTS,
				SUM(FD.`Liabilities`) AS TOTAL_LIABILITY,
				SUM(FD.`Equity`) AS TOTAL_EQUITY
            

        FROM financial_forecasting.financial_data AS FD
        WHERE FD.YEAR = FOCUS_YEAR
        group by   FD.`Company_ID`, FD.Year; 
    END$$
DELIMITER;



DELIMITER $$
CREATE PROCEDURE P_AND_L_BY_COMPANY (
IN
    COMPANY TEXT
    )
    BEGIN

        SELECT  -- Se crea vista para el P&L 
            FD.`Company_ID`,
            FD.Year,
            SUM(FD.`Revenue`) AS TOTAL_REVENUE,
            SUM(FD.`Expenses`) AS TOTAL_EXPENSES,
            SUM(FD.`Operating_Income`) AS TOTAL_OP_INCOME,
            SUM(FD.`Net_Income`) AS TOTAL_NET_INCOME
            

        FROM financial_forecasting.financial_data AS FD
        WHERE FD.`Company_ID` = COMPANY 
        group by   FD.`Company_ID`; 
    END$$
DELIMITER;



CREATE PROCEDURE BALANCE_SHEET_BY_COMPANY (
IN
    COMPANY TEXT
    )
    BEGIN

        SELECT  -- Se crea vista para el P&L 
            FD.`Company_ID`,
            FD.Year,
                SUM(FD.`Assets`) AS TOTAL_ASSESTS,
				SUM(FD.`Liabilities`) AS TOTAL_LIABILITY,
				SUM(FD.`Equity`) AS TOTAL_EQUITY
            
       
        FROM financial_forecasting.financial_data AS FD
        WHERE FD.`Company_ID` = COMPANY 
        group by   FD.`Company_ID`;  
    END$$
DELIMITER;


-- After you can find a whole wait to analise the main data
-- I suggest we can find a way to provide a Investor view (With a very rude/raw criteria) for myself taht a long time ago I do not practice my Investment analysis


-- I created an Invest_Prop Stored_Procedures to test this...

DELIMITER $$

CREATE PROCEDURE INVEST_PROPUSE (IN SELECTED_YEAR INT)
BEGIN
    WITH current_period AS (
        SELECT 
            fd.Company_ID,
            fd.Year,
            AVG(fd.Revenue) AS CURRENT_revenue,
            AVG(fd.Expenses) AS CURRENT_expenses,
            AVG(fd.Net_Income) AS CURRENT_NET_INCOME,
            AVG(fd.STOCK_PRICE) AS CURRENT_STOCK_PRICE,
            AVG(fd.ROE) AS CURRENT_ROE,
            AVG(fd.EPS) AS CURRENT_EPS,
            AVG(fd.Volume_Traded) AS VOLUME
        FROM financial_data fd 
        GROUP BY fd.Company_ID, fd.Year
    ),
    previous_period AS (
        SELECT 
            cp.Company_ID,
            cp.Year,
            LAG(cp.CURRENT_revenue) OVER (PARTITION BY cp.Company_ID ORDER BY cp.Year) AS PREVIOUS_REVENUE,
            LAG(cp.CURRENT_expenses) OVER (PARTITION BY cp.Company_ID ORDER BY cp.Year) AS PREVIOUS_EXPENSES,
            LAG(cp.CURRENT_NET_INCOME) OVER (PARTITION BY cp.Company_ID ORDER BY cp.Year) AS PREVIOUS_NET_INCOME,
            LAG(cp.CURRENT_STOCK_PRICE) OVER (PARTITION BY cp.Company_ID ORDER BY cp.Year) AS PREVIOUS_STOCK_PRICE,
            LAG(cp.CURRENT_ROE) OVER (PARTITION BY cp.Company_ID ORDER BY cp.Year) AS PREVIOUS_ROE,
            LAG(cp.CURRENT_EPS) OVER (PARTITION BY cp.Company_ID ORDER BY cp.Year) AS PREVIOUS_EPS,
            cp.CURRENT_revenue,
            cp.CURRENT_expenses,
            cp.CURRENT_NET_INCOME,
            cp.CURRENT_STOCK_PRICE,
            cp.CURRENT_ROE,
            cp.CURRENT_EPS,
            ROUND(cp.VOLUME) AS VOLUME
        FROM current_period cp
    ),
    ranked AS (
        SELECT 
            Company_ID,
            Year,
            CURRENT_revenue,
            CURRENT_expenses,
            CURRENT_NET_INCOME,
            CURRENT_STOCK_PRICE,
            CURRENT_ROE,
            CURRENT_EPS,
            PREVIOUS_REVENUE,
            PREVIOUS_EXPENSES,
            PREVIOUS_NET_INCOME,
            PREVIOUS_STOCK_PRICE,
            PREVIOUS_ROE,
            PREVIOUS_EPS,
            VOLUME,
            DENSE_RANK() OVER (PARTITION BY Year ORDER BY LN(CURRENT_STOCK_PRICE/PREVIOUS_STOCK_PRICE)) AS MARKET_GROWTH_Rank,
            DENSE_RANK() OVER (PARTITION BY Year ORDER BY CURRENT_revenue/PREVIOUS_REVENUE) AS Revenue_Rank,
            DENSE_RANK() OVER (PARTITION BY Year ORDER BY CURRENT_EPS) AS EPS_Rank,
            DENSE_RANK() OVER (PARTITION BY Year ORDER BY CURRENT_ROE) AS ROE_Rank
        FROM previous_period
    )
    SELECT 
        Company_ID,
        Year,
        CONCAT(ROUND(IFNULL(((CURRENT_revenue / PREVIOUS_REVENUE) - 1),0),2),'%') AS revenue_GROWTH,
        CONCAT(ROUND(IFNULL(((CURRENT_expenses / PREVIOUS_EXPENSES) - 1),0),2),'%') AS expenses_GROWTH,
        CONCAT(ROUND(IFNULL(((CURRENT_NET_INCOME / PREVIOUS_NET_INCOME) - 1),0),2),'%') AS net_INCOME_GROWTH,
        CONCAT(ROUND(IFNULL(((CURRENT_STOCK_PRICE / PREVIOUS_STOCK_PRICE) - 1),0),2),'%') AS STOCK_PRICE_GROWTH,
        CONCAT(ROUND(IFNULL(((CURRENT_ROE / PREVIOUS_ROE) - 1),0),2),'%') AS ROE_GROWTH,
        CONCAT(ROUND(IFNULL(((CURRENT_EPS / PREVIOUS_EPS) - 1),0),2),'%') AS EPS_GROWTH,
        VOLUME,
        (MARKET_GROWTH_Rank + Revenue_Rank + EPS_Rank + ROE_Rank) AS Invest_Value,
        DENSE_RANK() OVER (PARTITION BY Year ORDER BY (MARKET_GROWTH_Rank + Revenue_Rank + EPS_Rank + ROE_Rank)) AS Invest_Rank
    FROM ranked
    WHERE Year > 2015 
      AND Year = LEAST(SELECTED_YEAR, 2024);
END$$

DELIMITER ;








