--import departments.csv
--Had to specify complete path and add "Everyone" to folder sercurity to overcome Permissions error.
COPY departments FROM 
'C:\Users\Christopher Jung\Documents\UT_Class\UTAMCB201904DATA3\09_SQLHomework\Homework\Instructions\data\departments.csv' 
CSV HEADER;

--import employees.csv
COPY employees FROM 
'C:\Users\Christopher Jung\Documents\UT_Class\UTAMCB201904DATA3\09_SQLHomework\Homework\Instructions\data\employees.csv' 
CSV HEADER;

--import dept_emp
COPY dept_emp FROM 
'C:\Users\Christopher Jung\Documents\UT_Class\UTAMCB201904DATA3\09_SQLHomework\Homework\Instructions\data\dept_emp.csv' 
CSV HEADER;

--import dept_manager
COPY dept_manager FROM 
'C:\Users\Christopher Jung\Documents\UT_Class\UTAMCB201904DATA3\09_SQLHomework\Homework\Instructions\data\dept_manager.csv' 
CSV HEADER;


--import salaries
COPY salaries FROM 
'C:\Users\Christopher Jung\Documents\UT_Class\UTAMCB201904DATA3\09_SQLHomework\Homework\Instructions\data\salaries.csv' 
CSV HEADER;

--import titles
COPY titles FROM 
'C:\Users\Christopher Jung\Documents\UT_Class\UTAMCB201904DATA3\09_SQLHomework\Homework\Instructions\data\titles.csv' 
CSV HEADER;


