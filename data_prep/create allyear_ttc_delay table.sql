-- merge all of the delay datatables together
/*
CREATE TABLE allyears_ttc_delays AS
SELECT * FROM ttc_subway_delay_jan_2014_april_2017
UNION ALL SELECT * FROM ttc_subway_delay_may_december_2017
UNION ALL SELECT * FROM March_2018
UNION ALL SELECT * FROM April_2018
UNION ALL SELECT * FROM May_2018
UNION ALL SELECT * FROM June_2018
UNION ALL SELECT * FROM July_18
UNION ALL SELECT * FROM August_18
UNION ALL SELECT * FROM Sept_18
UNION ALL SELECT * FROM Oct_18
UNION ALL SELECT * FROM Nov_2018
UNION ALL SELECT * FROM Dec_2018
UNION ALL SELECT * FROM Jan_18
UNION ALL SELECT * FROM Feb_18
UNION ALL SELECT * FROM Mar_19
UNION ALL SELECT * FROM Apr_19
UNION ALL SELECT * FROM May_19
UNION ALL SELECT * FROM June_19
UNION ALL SELECT * FROM July_19
UNION ALL SELECT * FROM August_19
UNION ALL SELECT * FROM Sept_20
UNION ALL SELECT * FROM Oct_19
UNION ALL SELECT * FROM Nov_19
UNION ALL SELECT * FROM December_19
UNION ALL SELECT * FROM Jan_19
UNION ALL SELECT * FROM Feb_19
UNION ALL SELECT * FROM Jan_2020
UNION ALL SELECT * FROM Feb_20
UNION ALL SELECT * FROM March_20
UNION ALL SELECT * FROM May_20
UNION ALL SELECT * FROM June_20
UNION ALL SELECT * FROM July_20
UNION ALL SELECT * FROM August_20
UNION ALL SELECT * FROM Sept_20
UNION ALL SELECT * FROM Oct_20
UNION ALL SELECT * FROM Nov_20
UNION ALL SELECT * FROM Dec_2020
UNION ALL SELECT * FROM January_21
UNION ALL SELECT * FROM Feb_21
UNION ALL SELECT * FROM March_21
UNION ALL SELECT * FROM April_21
UNION ALL SELECT * FROM May_21
UNION ALL SELECT * FROM June_21
UNION ALL SELECT * FROM July_21
UNION ALL SELECT * FROM August_21
UNION ALL SELECT * FROM Sept_21
UNION ALL SELECT * FROM Oct_21
UNION ALL SELECT * FROM Nov_21
UNION ALL SELECT * FROM December_21
UNION ALL SELECT * FROM ttc_subway_delay_data_2022
UNION ALL SELECT * FROM ttc_subway_delay_data_2023
UNION ALL SELECT * FROM ttc_subway_delay_data_2024
UNION ALL SELECT * FROM TTC_Subway_Delay_Data_since_2025;


-- run some checks on the newly created allyears_ttc_delays
select count (*) from allyears_ttc_delays
-- 228,389
select count (*) from allyears_ttc_delays where "Min Delay" = 0;
-- 148,654
select count (*) from allyears_ttc_delays where "Min Delay" > 0;
-- 79,735
select count (*) from allyears_ttc_delays where "Min Delay" > 10;
-- 10,318
select * from allyears_ttc_delays where "Min Delay" = 0; 

select * from allyears_ttc_delays where "Min Delay" > 10 limit 100;

select * from major_events limit 20;

*/