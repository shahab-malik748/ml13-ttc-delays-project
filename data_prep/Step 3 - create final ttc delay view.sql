
DROP TABLE IF EXISTS ttc_delays_final_df;

create table ttc_delays_final_df as
select
a.Date as date
,cast(strftime('%Y', a.Date) as integer) as year
,cast(strftime('%m', a.Date) as integer) as month
,cast(strftime('%d', a.Date) as integer) as day_of_month
,cast(strftime('%w', a.Date) as integer) as weekday_num
,a.Time as time
,cast(strftime('%H', a.Time) as integer) as hour
,cast(strftime('%M', a.Time) as integer) as minute
,a.Day as day
,cast(strftime('%w', a.Date) as INTEGER) as day_of_week
,a.Station as station
,a.Code as delay_code
,b."CODE DESCRIPTION" as delay_code_desc
,b."Code classification by cause" as delay_category
,a."Min Delay" as min_delay
,a.Bound as location_bound
,case
    when a.Line in ('YUS', 'YU/BD', 'YU') then 'YU'
    when a.Line in ('BD', 'BD Line 2') then 'BD'
    else a.Line
  end as line
,case
	when a."Min Delay" >= 10 then 1
	else 0
	end as major_delay_flag
,case
    when a.Day in ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday') and
         (strftime('%H:%M', a.Time) between '06:30' and '09:30' or
         strftime('%H:%M', a.Time) between '16:00' and '19:00') then 1
    else 0
	end as rush_hour_flag
,b."Controllable Flag" as controllable_delay_flag
,case
	when strftime('%m-%d', a.Date) between '03-20' and '06-20' then 'Spring'
	when strftime('%m-%d', a.Date) between'06-21' and '09-21' then 'Summer'
	when strftime('%m-%d', a.Date) between '09-22' and '12-20' then 'Fall'
	else 'Winter'
    end as season
,case
	when c.Date is not null then 1
	else 0
	end as major_event_flag
,c."Event Description" as major_event_desc
from allyears_ttc_delays a
inner join ttc_delay_codes_classified_with_cnc_flag b on b."SUB RMENU CODE" = a.Code -- with this join we are removing scarborough line rows
left join major_events c on c."Date" = a."Date"
where a."Min Delay" > 0 -- remove rows with no delay
and a.Line not in ('20 CLIFFSIDE', '109 RANEE', '77 SWANSEA', '25 DON MILLS'); -- remove bus stop rows


*/

-- Checks 
SELECT name FROM sqlite_master WHERE type='table' AND name='ttc_delays_final_df';

select count (*) from allyears_ttc_delays where "Min Delay" > 0;
-- 79796
select count (*) from ttc_delays_final_df where min_delay > 0;
-- 75504


select count (*) from ttc_delays_final_df where rush_hour_flag = 1 
-- 21,590 rush hour delays (6:30-9:30 and 16:00 to 19:00 on weekdays)

select count (*) from ttc_delays_final_df where major_delay_flag = 1
-- 11,645 major delays (>=10 mins delay)

select count (*) from ttc_delays_final_df where rush_hour_flag = 1 and major_delay_flag = 1
-- 2,588 major delays during rush hour


select * from ttc_delays_final_df where hour is null;



*/