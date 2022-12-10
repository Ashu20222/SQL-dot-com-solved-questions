--- Medium_questions ---

/* question 1:
	Show unique birth years from patients and order them by ascending.
    
    ans: 
    SELECT
	  DISTINCT YEAR(birth_date) AS birth_year
	FROM patients
	ORDER BY birth_year;
*/


/* question 2:
	Show unique first names from the patients table which only occurs once in the list.

	For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is named 'Leo' then include them in the output.
	
    ans: 
    SELECT first_name
	FROM patients
	GROUP BY first_name
	HAVING COUNT(first_name) = 1;
*/


/* question 3:
	Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
    
    ans: 
    SELECT
	  patient_id,
	  first_name
	FROM patients
	WHERE
	  first_name LIKE 's%s'
	  AND len(first_name) >= 6;
*/


/* question 4:
	Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.

	Primary diagnosis is stored in the admissions table.
    
    ans: 
    SELECT
	  patients.patient_id,
	  first_name,
	  last_name
	FROM patients
	  JOIN admissions ON admissions.patient_id = patients.patient_id
	WHERE diagnosis = 'Dementia';
*/


/* question 5:
	Display every patient's first_name.
	Order the list by the length of each name and then by alphbetically   
    
    ans: 
    select first_name
	from patients
	order by 
		len(first_name),
		first_name;
*/


/* question 6:
	Show the total amount of male patients and the total amount of female patients in the patients table.
	Display the two results in the same row.
    
    ans: 
    SELECT 
	  SUM(Gender = 'M') as male_count, 
	  SUM(Gender = 'F') AS female_count
	FROM patients;
*/


/* question 7:
	Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.
    
    ans: 
    select first_name, last_name, allergies 
	from patients
	where allergies in ('Penicillin', 'Morphine')
	order by allergies,first_name, last_name;
*/


/* question 8:
	Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
    
    ans: 
    select patient_id, diagnosis 
	from admissions
	group by patient_id,diagnosis
	having count(*) > 1;
*/


/* question 9:
	Show the city and the total number of patients in the city.
	Order from most to least patients and then by city name ascending.

    ans: 
    select city, count(patient_id) as number_patients
	from patients
	group by city
	order by number_patients desc,city asc;
*/


/* question 10:
	Show first name, last name and role of every person that is either patient or doctor.
	The roles are either "Patient" or "Doctor"
    
    ans: 
    select first_name,last_name,'patient' as role  from patients
	union all 
	select first_name,last_name, 'doctor' from doctors;
*/


/* question 11:
	Show all allergies ordered by popularity. Remove NULL values from query.
    
    ans: 
    select allergies, count(allergies) as total_diagnosis
	from patients
	where allergies is not null
	group by allergies
	order by total_diagnosis desc;
*/


/* question 12:
	Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.
    
    ans: 
    select first_name,last_name,birth_date
	from patients
	where year(birth_date)between 1970 and 1979
	order by birth_date;
*/


/* question 13:
	We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order
	EX: SMITH,jane

    ans: 
    select 
	concat(upper(last_name), ',', lower(first_name)) as new_name_format
	from patients
	order by first_name desc;
*/


/* question 14:
	Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.
    
    ans: 
    select province_id, sum(height) as sum_height
	from patients
	group by province_id
	having sum_height >= 7000;
*/


/* question 15:
	Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
    
    ans: 
    SELECT (MAX(weight) - MIN(weight)) AS weight_delta
	FROM patients
	WHERE last_name = 'Maroni';
*/


/* question 16:
	Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.

    ans: 
    select 
		day(admission_date) as day_number,
		count(*) as number_of_admission
	from admissions
	group by day_number
	order by number_of_admission desc;
*/


/* question 17:
	Show all columns for patient_id 542's most recent admission_date.
    
    ans: 
    SELECT *
	FROM admissions
	WHERE patient_id = 542
	ORDER BY admission_date DESC
	LIMIT 1;
*/


/* question 18:
	Show patient_id, attending_doctor_id, and diagnosis for admissions that match one of the two criteria:
	1. patient_id is an odd number and attending_doctor_id is either 1, 5, or 19.
	2. attending_doctor_id contains a 2 and the length of patient_id is 3 characters.

    ans: 
    SELECT
	  patient_id,
	  attending_doctor_id,
	  diagnosis
	FROM admissions
	WHERE
	  (
		attending_doctor_id IN (1, 5, 19)
		AND patient_id % 2 != 0
	  )
	  OR 
	  (
		attending_doctor_id LIKE '%2%'
		AND len(patient_id) = 3);
*/


/* question 19:
	Show first_name, last_name, and the total number of admissions attended for each doctor.
	Every admission has been attended by a doctor.
    
    ans: 
    select 
		first_name,
		last_name,
		count(*) as admission_total
	from admissions as a
	join doctors as ph
	on ph.doctor_id = a.attending_doctor_id
	group by attending_doctor_id;
*/


/* question 20:
	For each physicain, display their id, full name, and the first and last admission date they attended.
    
    ans: 
    select
	  doctor_id,
	  first_name || ' ' || last_name as full_name,
	  min(admission_date) as first_admission_date,
	  max(admission_date) as last_admission_date
	from admissions a
	  join doctors ph on a.attending_doctor_id = ph.doctor_id
	group by doctor_id;

*/


/* question 21:
	Display the total amount of patients for each province. Order by descending.
    
    ans: 
    SELECT
	  province_name,
	  COUNT(*) as patient_count
	FROM patients pa
	  join province_names pr on pr.province_id = pa.province_id
	group by pr.province_id
	order by patient_count desc;
*/


/* question 22:
	For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.
    
    ans: 
    SELECT
	  CONCAT(patients.first_name, ' ', patients.last_name) as patient_name,
	  diagnosis,
	  CONCAT(doctors.first_name,' ',doctors.last_name) as doctor_name
	FROM patients
	  JOIN admissions ON admissions.patient_id = patients.patient_id
	  JOIN doctors ON doctors.doctor_id = admissions.attending_doctor_id;
*/


/* question 23:
	display the number of duplicate patients based on their first_name and last_name.
    
    ans: 
    select
	  first_name,
	  last_name,
	  count(*) as num_of_duplicates
	from patients
	group by
	  first_name,
	  last_name
	having count(*) > 1
*/
