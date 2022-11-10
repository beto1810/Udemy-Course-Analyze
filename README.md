# Udemy-Course-Analyze

![image](https://user-images.githubusercontent.com/101379141/201034913-14b91204-a5d5-4888-beb9-97ee644ce43c.png)            <img src="https://user-images.githubusercontent.com/101379141/201035143-6f1af4fe-4169-4074-8287-6790d88803db.png" alt="Image" width="400" height="180">




# :books: Table of Contents <!-- omit in toc -->

- [:briefcase: Business Case](#briefcase-business-case)
- [:bookmark_tabs:Example Datasets](#bookmark_tabsexample-datasets)
- [:triangular_flag_on_post: Questions and Solution](#triangular_flag_on_post-questions-and-solution)
  - [A. Data Exploration and Cleansing](#a-data-exploration-and-cleansing)
  - [B. Interest Analysis](#b-interest-analysis)
  - [C. Segment Analysis](#c-segment-analysis)
  - [D. Index Analysis](#d-index-analysis)
- [📃 What can you practice with this case study?](#what-can-you-practice-with-this-case-study)

---

# :briefcase: Business Case

- This is the Final Test Exam of 'Data for Everyone' course of MINDX TECHNOLOGY SCHOOL.

- The requirement of Text is cleaning, analyzing, doing visualization with the raw file data (udemy.csv).
  - I would use the SQL to clear and filter the clean data for analyzing test.
  - Power BI would be the visualization tool for me to visualize and analyze the clean data.
  - Finally, I would give the comments about these data through graphs of Power BI.

---

# :bookmark_tabs:Example Datasets

<div align="center">

**Table : udemy_course**

|course_id|course_title|is_paid|price|num_subscribers|num_reviews|num_lectures|level|content_duration|published_timestamp|subject|
|:----|:-----|:----|:----|:----|:----|:----|:----|:----|:----|:----|
1070968|Ultimate Investment Banking Course.|https://www.udemy.com/ultimate-investment-banking-course/|TRUE|200|2147|23|51|All Levels|1.5|1/19/2017 3:58|Business Finance|
1113822|Complete GST Course & Certification - Grow Your CA Practice|https://www.udemy.com/goods-and-services-tax/|TRUE|75|2792|923|274|All Levels|39|3/9/2017 23:34|Business Finance|
1006314|Financial Modeling for Business Analysts and Consultants|https://www.udemy.com/financial-modeling-for-business-analysts-and-consultants/|TRUE|45|2174|74|51|Intermediate Level|2.5|12/20/2016 2:26|Business Finance|
1210588|Beginner to Pro - Financial Analysis in Excel 2017|https://www.udemy.com/complete-excel-finance-course-from-beginner-to-pro/|TRUE|95|2451|11|36|All Levels|3|5/31/2017 3:07|Business Finance|
1011058|How To Maximize Your Profits Trading Options|https://www.udemy.com/how-to-maximize-your-profits-trading-options/|TRUE|200|1276|45|26|Intermediate Level|2|12/13/2016 21:57|Business Finance|
192870|Trading Penny Stocks: A Guide for All Levels In 2017|https://www.udemy.com/trading-penny-stocks-a-guide-for-all-levels/|TRUE|150|9221|138|25|All Levels|3|5/2/2014 22:13|Business Finance|



</div>

---

# :triangular_flag_on_post: Questions and Solution

## A. Data Exploration and Cleansing

View my solution [here](https://github.com/beto1810/8_Week_SQL_Challenge/blob/main/Case%20Study%20%238%20-%20Fresh%20Segments/A.Data%20Exploration%20%26%20Cleansing.md).


1. Update the `fresh_segments.interest_metrics` table by modifying the `month_year` column to be a date data type with the start of the month
2. What is count of records in the `fresh_segments.interest_metrics` for each month_year value sorted in chronological order (earliest to latest) with the null values appearing first?
3. What do you think we should do with these null values in the `fresh_segments.interest_metrics`
4. How many interest_id values exist in the `fresh_segments.interest_metrics` table but not in the `fresh_segments.interest_map` table? What about the other way around?
5. Summarise the id values in the `fresh_segments.interest_map` by its total record count in this table
6. What sort of table join should we perform for our analysis and why? Check your logic by checking the rows where interest_id = 21246 in your joined output and include all columns from `fresh_segments.interest_metrics` and all columns from `fresh_segments.interest_map` except from the id column.
7. Are there any records in your joined table where the month_year value is before the created_at value from the `fresh_segments.interest_map` table? Do you think these values are valid and why?


## B. Interest Analysis

View my solution [here](https://github.com/beto1810/8_Week_SQL_Challenge/blob/main/Case%20Study%20%238%20-%20Fresh%20Segments/B.Interest%20Analysis.md).


1. Which interests have been present in all `month_year` dates in our dataset?
2. . Using this same `total_months` measure - calculate the cumulative percentage of all records starting at 14 months - which `total_months` value passes the 90% cumulative percentage value?
3. If we were to remove all interest_id values which are lower than the `total_months` value we found in the previous question - how many total data points would we be removing?
4. Does this decision make sense to remove these data points from a business perspective? Use an example where there are all 14 months present to a removed interest example for your arguments - think about what it means to have less months present from a segment perspective.
5. After removing these interests - how many unique interests are there for each month?


## C. Segment Analysis

View my solution [here](https://github.com/beto1810/8_Week_SQL_Challenge/blob/main/Case%20Study%20%238%20-%20Fresh%20Segments/C.Segment%20Analysis.md).


1. Using our filtered dataset by removing the interests with less than 6 months worth of data, which are the top 10 and bottom 10 interests which have the largest composition values in any `month_year`? Only use the maximum composition value for each interest but you must keep the corresponding `month_year`
2. Which 5 interests had the lowest average `ranking` value?
3. Which 5 interests had the largest standard deviation in their `percentile_ranking` value?
4. For the 5 interests found in the previous question - what was minimum and maximum `percentile_ranking` values for each interest and its corresponding `year_month` value? Can you describe what is happening for these 5 interests?
5. How would you describe our customers in this segment based off their composition and ranking values? What sort of products or services should we show to these customers and what should we avoid?



## D. Index Analysis

View my solution [here](https://github.com/beto1810/8_Week_SQL_Challenge/blob/main/Case%20Study%20%238%20-%20Fresh%20Segments/D.Index%20Analysis.md).

The `index_value` is a measure which can be used to reverse calculate the average composition for Fresh Segments’ clients.

Average composition can be calculated by dividing the `composition` column by the `index_value` column rounded to 2 decimal places.

1. What is the top 10 interests by the average composition for each month?
2. For all of these top 10 interests - which interest appears the most often?
3. What is the average of the average composition for the top 10 interests for each month?
4. What is the 3 month rolling average of the max average composition value from September 2018 to August 2019 and include the previous top ranking interests in the same output shown below.
5. Provide a possible reason why the max average composition might change from month to month? Could it signal something is not quite right with the overall business model for Fresh Segments?

***
#
## What can you practice with this case study?
- Creating Tables
- JOINS
- CTE's
- Window Functions RANK, LAG, Sliding Windows (Preceding)
- CASE Statements
- As well as other functions, operators and clauses


