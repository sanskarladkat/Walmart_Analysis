Walmart Sales Analysis: A Comprehensive Business Intelligence Project
Project Overview
This project presents a comprehensive analysis of the Walmart sales dataset, leveraging a powerful combination of Python, SQL, and Power BI to extract actionable insights. The primary goal is to understand sales trends, identify top-performing branches and product categories, and uncover customer behavior patterns to inform strategic business decisions.

The workflow begins with data cleaning and exploratory data analysis (EDA) in a Python environment, followed by in-depth querying in a SQL database to answer specific business questions. Finally, the findings are presented through interactive and intuitive dashboards created in Power BI.

Project Demo:

(Screenshot of your final Power BI dashboard)

Technologies Used
Data Cleaning & EDA:

Python: The core programming language for data manipulation.

Pandas: For efficient data loading, cleaning, and transformation.

Matplotlib & Seaborn: For creating static, insightful visualizations during the exploratory phase.

Jupyter Notebook: As the interactive development environment.

Database & Querying:

SQL (PostgreSQL): For storing the cleaned data and performing complex queries to answer business problems.

Business Intelligence & Visualization:

Microsoft Power BI: To create dynamic, interactive dashboards for a comprehensive visual analysis and business performance tracking.

Project Workflow
The project followed a structured, multi-stage process:

Data Cleaning and Preprocessing (Python):

The raw CSV data was loaded into a Pandas DataFrame.

Missing values were identified and handled appropriately.

Data types were checked and corrected (e.g., converting 'date' and 'time' columns to datetime objects).

New features were engineered, such as Day of Week and Hour, to facilitate deeper analysis.

Exploratory Data Analysis (EDA) (Python):

Using Matplotlib and Seaborn, initial visualizations were created to understand the data's distribution, identify correlations, and uncover preliminary trends in sales, ratings, and product categories.

SQL Database Integration and Analysis:

The cleaned dataset was exported and loaded into a SQL database.

A series of 10 targeted business questions were formulated and answered using complex SQL queries. This allowed for robust and scalable data analysis.

Dashboard Creation (Power BI):

The cleaned data was connected to Power BI.

Key Performance Indicators (KPIs) such as Total Sales, Total Profit, and Average Customer Rating were calculated.

Two interactive dashboards were built:

Sales Overview: A high-level view of overall performance, including sales over time, by category, and by location.

Profitability & Customer Insights: A deeper dive into the most profitable product categories, customer satisfaction ratings, and sales performance by payment method.

Key Business Questions Addressed in SQL
The SQL analysis focused on answering critical business questions, including:

What are the different payment methods, and how many transactions and

items were sold with each method?

Which category received the highest average rating in each branch?

What is the busiest day of the week for each branch based on transaction

volume?

How many items were sold through each payment method?

What are the average, minimum, and maximum ratings for each category in

each city?

 What is the total profit for each category, ranked from highest to lowest?

What is the most frequently used payment method in each branch?

How many transactions occur in each shift (Morning, Afternoon, Evening)

across branches?

Which branches experienced the largest decrease in revenue compared to

the previous year?

How to Reproduce the Project
To run this project on your local machine, please follow these steps:

Clone the Repository:

git clone [https://github.com/your-username/walmart-sales-analysis.git](https://github.com/your-username/walmart-sales-analysis.git)
cd walmart-sales-analysis

Python Environment Setup:

It is recommended to create a virtual environment.

Install the required libraries:

pip install pandas matplotlib seaborn jupyter

Run the Analysis:

Open the Jupyter Notebook (walmart_analysis.ipynb) to view the data cleaning and EDA process.

SQL Database:

Set up a SQL server of your choice (e.g., PostgreSQL, MySQL).

Use the provided SQL script (schema.sql - if you create one) or the cleaned CSV to create and populate the Walmart sales table.

Run the queries in the business_queries.sql file to answer the business questions.

Power BI Dashboard:

Open the Power BI file (Walmart_Dashboard.pbix).

Connect it to the cleaned CSV file or your SQL database as the data source to interact with the dashboards.

Conclusion
This project successfully demonstrates a full-cycle data analysis workflow, from raw data to actionable business intelligence. The insights derived from this analysis can help Walmart make data-driven decisions regarding inventory management, marketing strategies, and operational staffing to improve profitability and customer satisfaction.
