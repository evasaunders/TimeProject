SHOW VARIABLES LIKE "secure_file_priv";

#in order to work around the "-secure-file-priv-" problem: store the datasets in the specified folder 
#and use the forward rather than the backwards slash for the address
#CLASSES TABLE
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Time_Data_Sheet_2.csv' 
INTO TABLE classes_table 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM classes_table;


#GRADES TABLE
SET foreign_key_checks = 0; #necessary as otherwise error code 1452 occured

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Time_Data_Sheet_3.csv' 
INTO TABLE grades_table 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SET foreign_key_checks = 1;

SELECT * FROM grades_table;


#RECORDS TABLE
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Time_Data_Sheet_1.csv' 
INTO TABLE records_table 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM records_table;
