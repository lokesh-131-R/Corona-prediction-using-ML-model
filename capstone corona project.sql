select * from capstone_corona_csv;
-- Find the number of corona patients who faced shortness of breath.
select Ind_ID,Shortness_of_breath,Corona from capstone_corona_csv where Shortness_of_breath=1 and Corona=1;

-- Find the number of negative corona patients who have fever and sore_throat.
select Ind_ID,Fever,Sore_throat,Corona from capstone_corona_csv where corona=0 and Fever=1 and Sore_throat=1;

-- Find the female negative corona patients who faced cough and headache.
with female as (select * from capstone_corona_csv where (female=1 and Corona=1))
select Ind_ID,Cough_symptoms,Headache from female where Cough_symptoms=1 and Headache=1;

-- How many elderly corona patients have faced breathing problems?
select count(Age_60_above) from capstone_corona_csv where Shortness_of_breath=1 and Age_60_above=1;

-- Which three symptoms were more common among COVID positive patients?
select sum(Cough_symptoms),sum(Fever),sum(Sore_throat),sum(Shortness_of_breath),sum(Headache) from capstone_corona_csv;

-- Which symptom was less common among COVID negative people?
select sum(Cough_symptoms),sum(Fever),sum(Sore_throat),sum(Shortness_of_breath),sum(Headache) from capstone_corona_csv where Corona=0;

-- What are the most common symptoms among COVID positive males whose known contact was abroad? 
select Known_contact,sum(Cough_symptoms),sum(Fever),sum(Sore_throat),sum(Shortness_of_breath),sum(Headache) from capstone_corona_csv  where male=1 and Corona=1 group by Known_contact;