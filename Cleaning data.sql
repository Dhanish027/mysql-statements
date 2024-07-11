select * 
from layoffs;

-- create new table for cleaning, shouldn't use raw dataset

create table layoffs_staging
like layoffs;

insert into layoffs_staging
select * 
from layoffs;

select *
from layoffs_staging;

-- 1. Remove Duplicates

with duplicate_cte as
(
select *, 
row_number() 
over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_staging
)
delete
from duplicate_cte
where row_num>1;

select * 
from layoffs_staging
where company='casper';

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into layoffs_staging2
select *, 
row_number() 
over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_staging;

select * 
from layoffs_staging2
where row_num>1;

DELETE
from layoffs_staging2
where row_num = 2;

-- 2. standardize the data

update layoffs_staging2
set company=trim(company);

select * 
from layoffs_staging2
where industry like 'crypto%';

select DISTINCT country
from layoffs_staging2
ORDER BY 1;

UPDATE layoffs_staging2
set country='United States'
where country like 'united states%';

update layoffs_staging2
set industry = 'Crypto'
where industry like 'crypto%';

select * from
layoffs_staging2 where country like 'united states%';

select `date` as date_str,
str_to_date(`date`,'%m/%d/%Y') as `date`
from layoffs_staging2;

update layoffs_staging2
set `date` = str_to_date(`date`,'%m/%d/%Y');

alter table layoffs_staging2
modify column `date` date;

-- 3. Null values or blank values

select t1.industry,t2.industry
from layoffs_staging2 t1
join  layoffs_staging2 t2
on t1.company=t2.company
where (t1.industry is null or t1.industry='')
and t2.industry is not null;

UPDATE layoffs_staging2
set industry = NULL
where industry='';

UPDATE layoffs_staging2 t1
join  layoffs_staging2 t2
on t1.company=t2.company
set t1.industry=t2.industry
where t1.industry is null 
and t2.industry is not null;

select * 
from layoffs_staging2
where company='Airbnb';

SELECT *
from layoffs_staging2
where total_laid_off is null and
percentage_laid_off is null ;

delete
from layoffs_staging2
where total_laid_off is null and
percentage_laid_off is null ;

alter table layoffs_staging2
drop COLUMN row_num;


select * 
from layoffs_staging2; 