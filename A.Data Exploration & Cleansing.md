# 📚 Case Study - Udemy Course: A. Data Exploration and Cleansing

<p align="right"> Using Microsoft SQL Server </p>

#

## IMPORT FILE TO SQL
**1. Checking duplicates rows by using Group By & Having and delete duplicate rows**

```sql
SELECT course_title,course_id
FROM udemy_courses
GROUP BY course_title,course_id
HAVING count(course_title)>1 and count(course_id) >1;

```

Duplicate rows

![image](https://user-images.githubusercontent.com/101379141/201276610-6d286d82-522e-4f02-af28-ba55af6e56d6.png)


- Delete duplicate rows
```sql
WITH CTE AS
(
SELECT *,ROW_NUMBER() OVER (PARTITION BY course_id,course_title ORDER BY course_id,course_title) AS RN
FROM udemy_courses
)

DELETE FROM CTE WHERE RN<>1;
```


**2.Checking typing errors of category groups (level, subject)**

```sql
SELECT DISTINCT [level]
FROM udemy_courses

SELECT DISTINCT [subject]
FROM udemy_courses;
 ```

![image](https://user-images.githubusercontent.com/101379141/201277058-613022ad-e948-484d-ba80-32e5592e706a.png)

---> There are 3 categorys type having typing error as 'Business Ffinance', 'Graphic  Design', 'Musical Instrucmentss'

- Update typing errors 
```sql
UPDATE udemy_courses
SET    subject = REPLACE(subject,'Business Ffinance','Business Finance')

UPDATE udemy_courses
SET    subject = REPLACE(subject,'Graphic  Design','Graphic Design')

UPDATE udemy_courses
SET    subject = REPLACE(subject,'Musical Instrumentss','Musical Instruments')

```

**3. Replace Null Values**

```sql
UPDATE udemy_courses
SET is_paid = 'FALSE'
WHERE is_paid is NULL
```

**4. Add one more column as Date as save file csv as "Results_Final1.csv"**


 ```sql
SELECT *, CONVERT(VARCHAR(10), published_timestamp, 114) AS Date
FROM udemy_courses
```

- First 5 rows :

|course_id|course_title|url|is_paid|price|num_subscribers|num_reviews|num_lectures|level|content_duration|published_timestamp|subject|Date|
|:----|:-----|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|
1070968|Ultimate Investment Banking Course.|https://www.udemy.com/ultimate-investment-banking-course/|TRUE|200|2147|23|51|All Levels|1.5|1/19/2017 3:58|Business Finance|1/18/2017|
1113822|Complete GST Course & Certification - Grow Your CA Practice|https://www.udemy.com/goods-and-services-tax/|TRUE|75|2792|923|274|All Levels|39|3/9/2017 23:34|Business Finance|3/9/2017|
1006314|Financial Modeling for Business Analysts and Consultants|https://www.udemy.com/financial-modeling-for-business-analysts-and-consultants/|TRUE|45|2174|74|51|Intermediate Level|2.5|12/20/2016 2:26|Business Finance|12/20/2016|
1210588|Beginner to Pro - Financial Analysis in Excel 2017|https://www.udemy.com/complete-excel-finance-course-from-beginner-to-pro/|TRUE|95|2451|11|36|All Levels|3|5/31/2017 3:07|Business Finance|5/31/2017|
1011058|How To Maximize Your Profits Trading Options|https://www.udemy.com/how-to-maximize-your-profits-trading-options/|TRUE|200|1276|45|26|Intermediate Level|2|12/13/2016 21:57|Business Finance|12/13/2016|
192870|Trading Penny Stocks: A Guide for All Levels In 2017|https://www.udemy.com/trading-penny-stocks-a-guide-for-all-levels/|TRUE|150|9221|138|25|All Levels|3|5/2/2014 22:13|Business Finance|5/2/2014|

#

## IMPORT CLEAN FILE TO POWER BI

**1. Transform Data : Use First rows as Header, Change type of Is_paid to text data type, replace value "True" to "Paid" & "False" to "Free".**

- Source data :
![image](https://user-images.githubusercontent.com/101379141/201279990-9ab7a9e7-0778-4100-bf33-b6172a6e2469.png)
- Promoted header, Change type & Replace value :
![image](https://user-images.githubusercontent.com/101379141/201280411-0f628efc-9e26-4cf0-bb4c-9bb21189766a.png)

**2. Add one more column Total_Income = Price * num_subscribers**

![image](https://user-images.githubusercontent.com/101379141/201280736-17888348-4bca-4cfd-8438-0527b208ff9a.png)

**3.Add new measure dax - To calculate income different between quarter ?

![image](https://user-images.githubusercontent.com/101379141/201280844-907938f2-f60d-4056-90be-56bc141438c9.png)

