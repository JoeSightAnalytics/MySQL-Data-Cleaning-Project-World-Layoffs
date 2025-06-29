# Data cleaning

use `my_project_layoff2`;
select *
from my_project_layoff2.layoffs;

create table layoffs_clone1
select *
from my_project_layoff2.layoffs;

-- In cleaning this data we are doing it in four processes--
#1. Identifying and removing duplicates
#2. Standardizing the data
#3. Dealing with null and blank values
#4. Removing unwanted rows and columns


#1. Identifying and removing duplicates

select *
from my_project_layoff2.layoffs_clone1;

select *,
row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions) Duplicate_identifyer
from my_project_layoff2.layoffs_clone1;

with duplicate_cte as (
select *,
row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions) Duplicate_identifyer
from my_project_layoff2.layoffs_clone1
)
select *
from duplicate_cte
where duplicate_identifyer > 1;

select *
from my_project_layoff2.layoffs_clone1
where company = 'casper';

CREATE TABLE `layoffs_clone2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `Duplicate_identifyer` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


select *
from my_project_layoff2.layoffs_clone2;

insert into my_project_layoff2.layoffs_clone2
select *,
row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions) Duplicate_identifyer
from my_project_layoff2.layoffs_clone1;

select *
from my_project_layoff2.layoffs_clone2
where duplicate_identifyer > 1;

delete
from my_project_layoff2.layoffs_clone2
where duplicate_identifyer > 1;

select *
from my_project_layoff2.layoffs_clone2
where company = 'yahoo';

#2.Standardizing the data

select *
from my_project_layoff2.layoffs_clone2;


select company, trim(company)
from my_project_layoff2.layoffs_clone2;

update my_project_layoff2.layoffs_clone2
set company = trim(company);


select distinct industry
from 
my_project_layoff2.layoffs_clone2
order by 1;

select industry 
from my_project_layoff2.layoffs_clone2
where industry like 'crypto%';

update my_project_layoff2.layoffs_clone2
set industry = 'Crypto'
where industry like  'Crypto%';


select *
from my_project_layoff2.layoffs_clone2;

select distinct country
from my_project_layoff2.layoffs_clone2;


select total_laid_off, trim(total_laid_off)
from my_project_layoff2.layoffs_clone2;

update my_project_layoff2.layoffs_clone2
set total_laid_off= trim(total_laid_off);


select distinct country
from my_project_layoff2.layoffs_clone2
order by 1;

select distinct country, trim(trailing '.' from country) standard_country
from my_project_layoff2.layoffs_clone2
order by 1;

update my_project_layoff2.layoffs_clone2
set country = trim(trailing '.' from country);


select *
from my_project_layoff2.layoffs_clone2;

select date
from my_project_layoff2.layoffs_clone2;

select date,
str_to_date(date, '%m/%d/%Y') Standardized_date
from my_project_layoff2.layoffs_clone2;

update my_project_layoff2.layoffs_clone2
set date = str_to_date(date, '%m/%d/%Y');

alter table my_project_layoff2.layoffs_clone2
modify column date date;

select *
from my_project_layoff2.layoffs_clone2;

#3. Dealing with the null values and blank spaces

select *
from my_project_layoff2.layoffs_clone2;

select *
from my_project_layoff2.layoffs_clone2
order by 3;

select t1.company, t2.company, t1.industry, t2.industry
from my_project_layoff2.layoffs_clone2 t1
join my_project_layoff2.layoffs_clone2 t2
	on t1.company = t2.company
where t1.industry is null or t1.industry = ''
and t2.industry is not null;

update my_project_layoff2.layoffs_clone2
set industry = null
where industry = '';


update my_project_layoff2.layoffs_clone2 t1
join my_project_layoff2.layoffs_clone2 t2
	on t1.company = t2.company
set t1.industry = t2.industry
where t1.industry is null
and t2.industry is not null;

select *
from my_project_layoff2.layoffs_clone2
where company = 'airbnb';

select *
from my_project_layoff2.layoffs_clone2;

select *
from my_project_layoff2.layoffs_clone2
where total_laid_off = ''
and
percentage_laid_off = '';

delete
from my_project_layoff2.layoffs_clone2
where total_laid_off is null
and
percentage_laid_off is null;

select *
from my_project_layoff2.layoffs_clone2;

#4. Deleting unwanted rows and columns

alter table my_project_layoff2.layoffs_clone2
drop column duplicate_identifyer;



