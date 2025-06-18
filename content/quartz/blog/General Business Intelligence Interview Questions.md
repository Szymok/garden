---
title: General Business Intelligence Interview Questions
type: blog post
tags: 
aliases:
---
These BI interview questions tend to be broad-based in terms of the parts of the business the questions may touch upon and then dial in to ask you about specific concepts. They might take the form of “What is X concept?” or “What is the difference between X and Y?” Study up on the most common terms and be ready to answer these questions confidently with short, succinct answers.

1. What is OLAP?
OLAP, or online analytical processing, is a software tool that you can use to conduct multidimensional analysis on large amounts of data. Where in the past you might have had to pull one at a time, perform analysis, and then decide on the next dataset you wanted to pull and examine, OLAP allows you to quickly cycle through all the different combinations of datasets and inquiries that are of interest to you.

For example, a business’s data warehouse typically has data stored in tables (which only contain two dimensions at a time). OLAP allows you to extract data from multiple data sets and then reorganize it into multidimensional format for faster processing and analysis.

Hint: A question like this is designed to assess your knowledge of a subject. Provide a succinct answer and try to explain why it’s important as well.

2. What are Fact and Dimension tables?
In data warehousing, a fact table consists of the dimension keys and numerical values of a business process. A fact table contains quantitative data that is used for analysis. Dimension tables, on the other hand, are qualitative dictionary tables that provide information about how the data in the fact table can be analyzed.

3. Why is data normalization useful?
Data normalization is the process of organizing and formatting data to appear similar across all records and fields. There are many benefits to data normalization. For example, the process helps to remove duplicate data and helps to maintain referential integrity. It also allows analysts to navigate quickly through different datasets, as they are already familiar with how the organization structures their data.

Hint: With a question like this, you don’t have to give a dissertation. Highlighting a few key benefits will showcase your familiarity.

4. What are your favorite business intelligence tools?
Be sure you are comfortable talking about your favorite tools. Some of the most common include Tableau, IBM Cognos Analytics and Oracle Business Intelligence Enterprise Edition. This type of question isn’t just looking to establish what system you like, but also why you like that tool over others. Give some concrete examples.

One tip: Familiarize yourself with the tools cited in the job outreach. You can even refer back to the initial job posting: “I saw that you were looking for a candidate with experience in Tableau, which, after using several different systems over my career, is definitely one of my favorite tools to use.”

5. What makes a good data visualization?
Data visualization questions are asked frequently in business intelligence interviews. This question assesses your design philosophy and ability to distill business insights into actionable visualizations. A few keys to cover in your response include:

Color theory and aesthetics
Visualization use cases
Ease of deployment/development costs
With your answer, make sure you reiterate that a good visualization is one that makes the data accessible for the target audience. A good visualization tells a story, and that story must be understandable to those who you are presenting to.

6. How many kinds of JOIN functions are there in SQL?
Questions about SQL joins come up all the time. Be sure you can name the most important ones including INNER JOIN, RIGHT JOIN, LEFT JOIN, and OUTER JOIN.

7. What is a pivot table?
A pivot table is one of the most commonly used data processing tools. It’s a two-dimensional table that is used to summarize large volumes of data. A key benefit of pivot tables is that they allow users to quickly change how data is displayed, and can help business intelligence analysts more quickly uncover insights from large datasets.

8. What are some uses for a data warehouse?
Data warehouses are separate databases which are used to store data separate from an operational database (think long-term storage). Warehouses are typically used for analytics tasks like exploratory data analysis, validation or tactical reporting. Data warehouses are where all historical data analysis is consolidated.

9. What are some of the benefits of data denormalization?
At a minimum, touch on two to three benefits. Data denormalization, which combines normalized data in a more quickly accessible format, has numerous benefits, including:

Better read/write performance.
Very useful in data warehouses, because fact and dimension tables in warehouses are typically designed without regard to data normalization.
Precomputation and query performance improvements.
You will also want one to two drawbacks, as well. For example, “Data denormalization tends to speed retrieval, but can reduce update speed.”

10. What is the primary key in a database?
A primary key is a keyword in a relational database that is unique for each record. Therefore, a primary key is NOT NULL and is also UNIQUE. Examples include records like driver license number, customer ID number, telephone number or patient ID. Relational databases only have one primary key.

Scenario-Based BI Questions
image

For business intelligence roles, you should expect scenario-based questions that assess business intuition and problem-solving.

You might get a question like “What would you do if you noticed a decline in revenue?” These questions might also be more generic, like “Tell me about a time when you did X.” Here are sample business sense questions to practice:

11. Tell me a time when…
You will likely be asked open-ended questions like this, these questions are an opportunity for you to tell the story of your career and how you approach your work. Essentially, the interviewer is trying to get a sense of your experience level and the types of problems you have encountered.

To answer, first lay out the specifics of the problem you faced and your initial assumptions. Then, help the interviewer understand the steps you took to reach the final solution, including how you may have had to overcome setbacks or failures. This isn’t a question designed with a right or wrong answer; rather, it will show how you deal with complex situations.

12. What would you do if you noticed a decline in revenue?
Business intelligence analyst interview questions assess your ability to perform analysis. For a question like this, you might be provided with a dataset that includes sales dates, average percentage and the frequency of any discounts, the profit margin per item sold, the total order value, etc. Then you would walk the interviewer through your approach to discovering a root-cause of the sales declines, or patterns you notice in your quantitative analysis that may point to areas of further investigation.

With those data points, you could determine fairly quickly if the revenue decline is due to declining sales, rising costs, or a mix of both. Suggest some month-over-month metrics you would be interested in following up on such as:

Revenue per marketing source.
Discount models internally authorized.
Profit margin per item sold.
Revenue by category.
13. You have to develop a new solution for a stakeholder. How do you go about elicitation and designing for their needs?
Elicitation is a technical term for gathering information from stakeholders and end-users. The process changes based on the needs of the project. However, there are some key elicitation tactics you can use, including:

Interviews
Prototyping
Brainstorming
Workshops and observations
Surveys/questionnaires
Sentiment analysis
Document analysis
Go deep into how you approach gathering stakeholder input. You might walk the interviewer through a recent example in which you led a brainstorming session and conducted stakeholder interviews to gain input.

Business Case Study Questions
Business case study questions are in-depth analyses of sample business problems. These questions assess your ability to set metrics, gather information and ultimately develop a problem-solving strategy based on the information you gather.

Here are some sample business case study questions for business intelligence roles:

14. How would you calculate the average lifetime value for a subscription-based product?
To answer this question you will likely be provided metrics to use. For example, how would you calculate the lifetime value if provided the following supplemental information:

The product costs $100 / month.
There is a 10% monthly churn.
The average customer stays subscribed for 3.5 months.
Otherwise known as LTV, average lifetime value is understood as the prediction of the net revenue attributed to the entire future relationship with all customers, averaged. In other words, what is the expected lifetime revenue for each new customer we onboard. Think about how you would use the supplemental information to estimate things like revenue earned before the customer churns, or the expected churn over time of each month’s customer cohort.

15. How would you handle duplicate product listings in a database for a large-scale e-commerce business?
The goal: You want to eliminate duplicate product listings business case that may be the same product, just found under different sellers, names, etc. An example would be “iPhone X vs. Apple iPhone 10”, splitting customers between two different listings and complicating revenue tracking or review aggregation. See a step-by-step video solution for this question:

16. Netflix wants to test how a 30-day free trial influences customer acquisition costs. How would you approach measuring this?
Some more context: After 30 days, customers would automatically be charged based on the package they selected in the trial. Since you want to measure the success of customer acquisition, what metrics would you use?

Hint: One way we can specifically frame the concept to this problem is to think about controllable inputs, external drivers and then the final observable output. Start by thinking about the major goals of Netflix that drive this inquiry.

17. How would you determine if the price of a Netflix subscription is truly the deciding factor for a consumer?
See a step-by-step solution for this question, and how you would think through determining and testing what the deciding factors on final purchase are for customers:

18. What is the difference between DELETE TABLE and TRUNCATE TABLE in SQL?
Although they are both used to delete data, a key difference is that DELETE is a Database Manipulation Language (DML) command, while TRUNCATE is a Data Definition Language (DDL) command.

Therefore, DELETE is used to remove specific data from a table, while TRUNCATE removes all the rows of a table without maintaining the tables structure. Another difference: DELETE can be used with the WHERE clause, but TRUNCATE cannot. In this case, DELETE TABLE would remove all the data from within the table, while maintaining the structure. TRUNCATE TABLE would delete the table in its entirety.

19. Write a SQL query to select all records of employees with last names between “Bailey” and “Frederick”.
For this question, assume the table is called Employees and the last name column is LastName.

SELECT * FROM Employees WHERE LastName BETWEEN 'Bailey' AND 'Frederick'  
20. Write a SQL query to find the year from a YYYY-MM-DD date.
EXTRACT allows us to pull temporal data types like date, time, timestamp and interval from date and time values. If you wanted to find the year from 2022-03-22, you would write EXTRACT( FROM ).

SELECT EXTRACT(YEAR FROM DATE '2022-03-22') AS year; 
21. Write a SQL query to get the current salary for each employee.
Some more context: You have a table with payroll schema (blueprint). Due to an ETL (Extract, Transform, Load) error, the employees table performed an insert instead of an update to the salaries each year when doing compensation adjustments. Let’s assume there are no duplicate first-last name combinations.

Hint: The first step we need to do would be to remove duplicates and retain the current (most recent) salary for each user. Because there aren’t any duplicate first and last name combinations, we can remove duplicates from the employees table by running a GROUP BY on two fields, the first and last name. This allows us to then get a unique combinational value between the two fields.

22. Write a query to get the top five most expensive projects by the following criteria: budget to employee count ratio.
More Context: We are given two tables. One is named projects and the other maps employees to the projects they are working on. Exclude projects with zero employees. Assume each employee works on only one project.

To start, think about how to calculate the combined budget for each project, and then determine what the budget per employee attached to the project equals.Then you can think of how to rank these project values from most to least to determine which are the most expensive.

23. Write a query to return all the duplicate users from the users table.
INSERT TABLE


SELECT
	id,
	name,
	created_at
FROM (
	SELECT
		*,
		row_number() OVER 
			(PARTITION BY id ORDER BY created_at ASC) 
			AS ranking
	FROM
		users) AS u
WHERE
	ranking > 1
Database Design Business Intelligence Questions
In the simplest terms, database design is the process of creating a normalized database from scratch to hold data. Database design questions might be simple definitions, scenario-based, e.g. “what would you do if”, and database design case studies. These types of questions are more common in business intelligence engineer interviews.

Here are some sample database design questions:

24. What are the primary steps in database design?
Database design typically includes:

conceptual database design
logical database design
physical database design
In the conceptual stage, you would identify entities in the data ecosystem and their relationships and attributes. The conceptual design is transformed into a logical framework during the logical database design second stage. In the final stage, a physical database model is created. This stage includes making decisions about physically implementing the model including security, choosing a database management system, storage and file organization.

25. How would you create a schema to represent client click data on the web?
These types of questions are more architecture based, and are generally given to test experience in developing databases, setting up architectures and in this case representing client side tracking in the form of clicks.

What exactly does click data on the web mean? Any form of button clicks, scrolls or action at all is an interaction with the client interface (in this case desktop). Each of these actions would be somehow represented into a schema form for the end user to query. This would not include client views however.

A simple but effective design schema would be to first represent each action with a specific label. In this case assigning each click event a name or label describing its specific action. From here you can think of how you would structure your data to be query-able in a way that is approved by the client.

26. How would you design a data warehouse for a new online retailer?
To solve, you would sketch a star schema to explain your design. You might choose something like:

orders - orderid, itemid, customerid, price, date, paymentid, promotionid
customer - customer_id, cname, address, city, country, phone
items - itemid, subcategory, category, brand, mrp
payment - paymentid, mode, amount
promotions - promotionid, category, discount, start_date, end_date
date - datesk, date, month, year, day
Python Business Intelligence Interview Questions
Python questions are common in business intelligence engineer interviews, although scripting questions may be asked in analyst interviews. These questions test your knowledge of Python code writing, and include basic questions through coding exercises.

27. Write a Python function to determine if a number is prime or not.
```python

a=int(input("enter number"))
if a=1:
   for x in range(2,a):
         if(a%x)==0:
          print("not prime")
   break
   else:
      print("Prime")
else:
   print("not prime")
```
28. Write a function find_change to find the minimum number of coins that make up the given amount of change (in cents). Assume we only have coins of value 1, 5, 10, and 25 cents.
Example: Input:

cents = 73
Output:

def find_change(cents) -> 7
#(25 + 25 + 10 + 10 + 1 + 1 + 1)
29. Given a list of timestamps in sequential order, return a list of lists grouped by week (seven days) using the first timestamp as the starting point.
ts = [
    '2019-01-01', 
    '2019-01-02',
    '2019-01-08', 
    '2019-02-01', 
    '2019-02-02',
    '2019-02-05',
]

def weekly_aggregation(ts) -> [
    ['2019-01-01', '2019-01-02'], 
    ['2019-01-08'], 
    ['2019-02-01', '2019-02-02'],
    ['2019-02-05'],
]
Hint: This question sounds like it should be a SQL question doesn’t it? Weekly aggregation implies a form of GROUP BY in a regular SQL or pandas question. In either case, aggregation on a dataset of this form by week would be pretty trivial. But since it is a scripting question, it’s trying to pry out if the candidate deals with unstructured data on any regular basis.

