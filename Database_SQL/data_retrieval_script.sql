#RETRIEVAL QUERIES

#retrieve one table with:  main information and record statistics per class
SELECT classes_table.Name, Grade "Final Grade", ROUND(AVG(Duration),2) "Mean Session Length (min)", ROUND(SUM(Duration)/60,2) "Length of all Sessions (hrs)", 
COUNT(Duration) "Number of Sessions" FROM classes_table JOIN grades_table JOIN records_table 
ON classes_table.Class_Code = grades_table.Class_Code_Grades AND classes_table.Class_Code = records_table.Class_Code 
WHERE Grade_Type = 1 GROUP BY classes_table.Name ORDER BY classes_table.Name;

#retrieve one table with:  main information and record statistics per year & period
SELECT Uni_Year, Period, ROUND(AVG(Grade),2) "Average Final Grade", ROUND(AVG(Duration),2) "Mean Session Length (min)", 
ROUND(SUM(Duration)/60,2) "Length of all Sessions (hrs)", COUNT(Duration) "Number of Sessions" FROM classes_table 
JOIN grades_table JOIN records_table ON classes_table.Class_Code = grades_table.Class_Code_Grades AND classes_table.Class_Code = records_table.Class_Code 
WHERE Grade_Type = 1 AND Uni_Year = 1 GROUP BY Period 
UNION
SELECT Uni_Year, Period, ROUND(AVG(Grade),2) "Average Final Grade", ROUND(AVG(Duration),2) "Mean Session Length (min)", 
ROUND(SUM(Duration)/60,2) "Length of all Sessions (hrs)", COUNT(Duration) "Number of Sessions" FROM classes_table 
JOIN grades_table JOIN records_table ON classes_table.Class_Code = grades_table.Class_Code_Grades AND classes_table.Class_Code = records_table.Class_Code 
WHERE Grade_Type = 1 AND Uni_Year = 2 GROUP BY Period 
UNION
SELECT Uni_Year, Period, ROUND(AVG(Grade),2) "Average Final Grade", ROUND(AVG(Duration),2) "Mean Session Length (min)", 
ROUND(SUM(Duration)/60,2) "Length of all Sessions (hrs)", COUNT(Duration) "Number of Sessions" FROM classes_table 
JOIN grades_table JOIN records_table ON classes_table.Class_Code = grades_table.Class_Code_Grades AND classes_table.Class_Code = records_table.Class_Code 
WHERE Grade_Type = 1 AND Uni_Year = 3 GROUP BY Period 
ORDER BY Uni_Year, Period;

#retrieve one table with:  main information and record statistics period
SELECT Period, ROUND(AVG(Grade),2) "Average Final Grade", ROUND(AVG(Duration),2) "Mean Session Length (min)", 
ROUND(SUM(Duration)/60,2) "Length of all Sessions (hrs)", COUNT(Duration) "Number of Sessions" FROM classes_table 
JOIN grades_table JOIN records_table ON classes_table.Class_Code = grades_table.Class_Code_Grades AND classes_table.Class_Code = records_table.Class_Code 
WHERE Grade_Type = 1 GROUP BY Period ORDER BY Period;

#retrieve one table with:  main information and record statistics per year 
SELECT Uni_Year, ROUND(AVG(Grade),2) "Average Final Grade", ROUND(AVG(Duration),2) "Mean Session Length (min)", 
ROUND(SUM(Duration)/60,2) "Length of all Sessions (hrs)", COUNT(Duration) "Number of Sessions" FROM classes_table 
JOIN grades_table JOIN records_table ON classes_table.Class_Code = grades_table.Class_Code_Grades AND classes_table.Class_Code = records_table.Class_Code 
WHERE Grade_Type = 1 GROUP BY Uni_Year ORDER BY Uni_Year;


#retrieve one table with:  main information and record statistics per class type
SELECT classes_table.Type, ROUND(AVG(Grade),2) "Final Grade", ROUND(AVG(Duration),2) "Mean Session Length (min)", 
ROUND(SUM(Duration)/60,2) "Length of all Sessions (hrs)", COUNT(Duration) "Number of Sessions" FROM classes_table 
JOIN grades_table JOIN records_table ON classes_table.Class_Code = grades_table.Class_Code_Grades AND classes_table.Class_Code = records_table.Class_Code 
WHERE Grade_Type = 1 GROUP BY classes_table.Type ORDER BY classes_table.Type;