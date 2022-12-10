--- easy questions ---
/* question 1:
	Show first name, last name, and gender of patients who's gender is 'M' 
    
    ans: 
    SELECT first_name,last_name,gender 
	FROM patients
	where gender='M';
*/


/* question 2:
	Show first name and last name of patients who does not have allergies. (null)
    
    ans:
    select first_name, last_name
	from patients
	where allergies is null;
*/


/*question 3:
	Show first name of patients that start with the letter 'C'
    
    ans:
    select first_name
	from patients
	where first_name
	like 'C%' ;
*/


/*question 4:
	Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)
    
    ans:
    select first_name, last_name
	from patients
	where weight between 100 and 120;
*/


/*question 5:
	Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
    
    ans:
    update patients
	set allergies='NKA'
	where allergies is null;
*/


/*question 6:
	Show first name and last name concatinated into one column to show their full name.
    
    ans:
    select concat (first_name,' ', last_name) as full_name
	from patients;
*/


/*question 7:
	Show first name, last name, and the full province name of each patient.
	Example: 'Ontario' instead of 'ON'
    
    ans:
    select patients.first_name, patients.last_name, province_names.province_name
	from patients
	join province_names on province_names.province_id = patients.province_id;
*/


/*question 8:
	Show how many patients have a birth_date with 2010 as the birth year.
    
    ans:
    select count(birth_date) from patients where year(birth_date) = 2010;
*/


/*question 9:
	Show the first_name, last_name, and height of the patient with the greatest height.
    
    ans:
    select first_name, last_name, max(height)
	from patients;
*/


/*question 10:
	Show all columns for patients who have one of the following patient_ids:
	1,45,534,879,1000
    
    ans:
    select *
	from patients
	where patient_id 
	in (1,45,534,879,1000);
*/


/*question 11:
	Show the total number of admissions
    
    ans:
    select count(*)
	from admissions;
*/


/*question 12:
	Show all the columns from admissions where the patient was admitted and discharged on the same day.
    
    ans:
    select *
	from admissions
	where admission_date = discharge_date;
*/


/*question 13:
	Show the total number of admissions for patient_id 579.
    
    ans:
    SELECT
	  patient_id,
	  COUNT(*) AS total_admissions
	FROM admissions
	WHERE patient_id = 579;
*/

/*question 14:
	Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?
    
    ans:
    select distinct(city)
	from patients
	where province_id = 'NS';
*/


/*question 15:
	Write a query to find the first_name, last name and birth date of patients who have height more than 160 and weight more than 70
    
    ans:
    select first_name,last_name,birth_date
	from patients 
	where height>160 and weight>70;
*/


/*question 16:
	Write a query to find list of patients first_name, last_name, and allergies from Hamilton where allergies are not null
    
    ans:
    SELECT
	  first_name,
	  last_name,
	  allergies
	FROM patients
	WHERE
	  city = 'Hamilton'
	  and allergies is not null
*/


/*question 17:
	Based on cities where our patient lives in, write a query to display the list of unique city starting with a vowel (a, e, i, o, u). Show the result order in ascending by city.
    
    ans:
    SELECT DISTINCT(CITY) 
	FROM patients 
	WHERE 
		CITY LIKE 'A%' 
        OR CITY LIKE 'E%' 
        OR CITY LIKE 'I%' 
        OR CITY LIKE 'O%' 
        OR CITY LIKE 'U%' 
	ORDER BY CITY ASC;
*/