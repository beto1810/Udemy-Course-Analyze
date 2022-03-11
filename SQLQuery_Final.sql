--Check Duplicate rows in course_id vs Course_title
select course_title,course_id
from udemy_courses
group by course_title,course_id
having count(course_title)>1 and count(course_id) >1;

--Check values in other rows.

SELECT DISTINCT [level]
FROM udemy_courses

SELECT DISTINCT [subject]
FROM udemy_courses

-- Delete duplicates rows
WITH CTE AS
(
SELECT *,ROW_NUMBER() OVER (PARTITION BY course_id,course_title ORDER BY course_id,course_title) AS RN
FROM udemy_courses
)

DELETE FROM CTE WHERE RN<>1;


-- REPLACE VALUE OF COURSE_ID (Một số các Course_id có chứa cả số và chữ nên sửa) - P/s: có thể bỏ qua bước này nếu muốn giữ nguyên course_id
-- UPDATE udemy_courses
-- SET    course_id = REPLACE(course_id,'1271182A','1271182')

-- UPDATE udemy_courses
-- SET course_id = REPLACE(course_id,'1157298B','1157298')

-- UPDATE udemy_courses
-- SET course_id = REPLACE(course_id,'715476C','715476')

--REPLACE VALUE OF SUBJECT
UPDATE udemy_courses
SET    subject = REPLACE(subject,'Business Ffinance','Business Finance')

UPDATE udemy_courses
SET    subject = REPLACE(subject,'Graphic  Design','Graphic Design')

UPDATE udemy_courses
SET    subject = REPLACE(subject,'Musical Instrumentss','Musical Instruments')

--Replace NULL Value in is_paid column
UPDATE udemy_courses
SET is_paid = 'FALSE'
WHERE is_paid is NULL

--Create a table with new column (DATE) with Date Value from published_timestamp 
SELECT *, CONVERT(VARCHAR(10), published_timestamp, 114) AS Date
FROM udemy_courses



