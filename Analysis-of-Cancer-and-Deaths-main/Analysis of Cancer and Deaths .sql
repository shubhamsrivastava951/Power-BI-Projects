create database Canceranalysis;
select * from [dbo].[ total deaths by cause]
1./*top 5  number of death by cause  and counrty  year wise*/

select top 5 [Cause_by_death],sum([total deaths]) as total_death from [dbo].[ total deaths by cause]
group by [Cause_by_death]
order by total_death desc;

select top 5 [Counrty],[Cause_by_death],sum([total deaths]) as total_death from [dbo].[ total deaths by cause]
group by [Cause_by_death],[Counrty]
order by total_death desc;

select top 5 [Year],[Cause_by_death],sum([total deaths]) as total_death from [dbo].[ total deaths by cause]
group by [Cause_by_death],[Year]
order by total_death desc;
--------------------------------------------------------------------------------------------------------------------
2. /* which cancer types most deeaths and Top 5 countries with the highest deaths for each cancer type*/
 select * from [dbo].[total cancer deaths by type];

 select top 5 [Cancer type],sum([Total deaths value]) as total_deaths from [dbo].[total cancer deaths by type]
 group by [Cancer type]
 order by total_deaths desc;

select top 5 [Counrty],sum([Total deaths value]) as total_deaths from [dbo].[total cancer deaths by type]
group by [Cancer type],Counrty
order by total_deaths desc;

--------------------------------------------------------------------------------------------------------------------------
3./*which aged most death rates by cancer*/
select * from [dbo].[cancer death rates by age];

select [Death rate by age] ,sum([Death rate]) as most_deathrate  from [dbo].[cancer death rates by age]
group by [Death rate by age]
order by  most_deathrate desc;

/*top 5 countries most death rates by age*/

select top 5 [Counrty], [Death rate by age] ,sum([Death rate]) as most_deathrate  from [dbo].[cancer death rates by age]
group by [Death rate by age],[Counrty]
order by  most_deathrate desc;


---------------------------------------------------------------------------------------------------------------------
4./*top 10 which cancer type most prevalence by average age_stanrdzied %*/

select top 10 [Prevances_of_caner_types],avg([Age_percent]) as age_percent from [dbo].[share-of-population-with-cancer-types_]
group by [Prevances_of_caner_types]
order by age_percent desc;

-------------------------------------------------------------------------------------------------------------------------
5./*which counrty most prevlences cancer the age-standardized percentage and top 5 countries*/
select * from [dbo].[share-of-population-with-cancer];

select top 5 counrty,avg([Prevalence Age_standardized_Percent]) as age_stanrd_pernt from [dbo].[share-of-population-with-cancer]
group by counrty
order by age_stanrd_pernt desc;

---------------------------------------------------------------------------------------------------------------
6./*the most prevalenace cancer by age around the world 1990 to 2017*/
 select * from [dbo].[number-of-people-with-cancer-by-age]
  
  select [Prevances_of_cancer_by_age],sum([cancer percentage ]) as cancer_average
    from [dbo].[number-of-people-with-cancer-by-age]
	WHERE [Year] BETWEEN 1990 AND 2017
	GROUP BY [Prevances_of_cancer_by_age]
	order by cancer_average desc;

	------------------------------------------------------------------------------------------------------------------------
7./*Share of population with cancer by all ages, around World 2017*/

select * from [dbo].[share-of-population-with-cancer-by-age]


 select [Prevances_cancer_by_age] ,avg([total_percent]) as all_age_percent 
 from [dbo].[share-of-population-with-cancer-by-age]
 WHERE [Year] BETWEEN 1990 AND 2017
 group by [Prevances_cancer_by_age]
 order by all_age_percent desc;

---------------------------------------------------------------------------------------------------------------------------
8./*top 5 counrty & year wise Disease burden rates by cancers types*/

select * from [dbo].[disease-burden-rates-by-cancer-types];

select top 5 [Conrty],[Diease_burden_cancer_type],sum([Burden Rates]) as total_burnd_dieases
  from [dbo].[disease-burden-rates-by-cancer-types]
  where [Year] = 1991
  group by [Diease_burden_cancer_type],[Conrty]
  order by total_burnd_dieases desc;
  
-------------------------------------------------------------------------------------------------------------------------------------
9./* the death rate, and the age-standardized death rate by by 1990 to 2019*/
select * from [dbo].[Cancer death rate and age standzd rate]


  SELECT [Death_rates_by_age], [Total_inex_rate], [Year]
FROM [dbo].[Cancer death rate and age standzd rate]
WHERE [Year] >= 1990 AND [Year] <= 2019;


select [Death_rates_by_age],avg([Total_inex_rate]) as death_indx_rate 
  from [dbo].[Cancer death rate and age standzd rate]
  WHERE [Year] between 1990 and 2019
  group by [Death_rates_by_age]
  order by death_indx_rate desc;
