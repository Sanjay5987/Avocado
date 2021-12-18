--View of Dataset

select * 
from portfolioproject..avocado

--Adding Required Columns

Alter table portfolioproject..avocado
add Total_price numeric(38)

Alter table portfolioproject..avocado
add smallbagspercent float(18)

Alter table portfolioproject..avocado
add largebagspercent float(18)

Alter table portfolioproject..avocado
add Xlargebagspercent float(18)

--Manually renamed Total_price to Total_price(rs.)
--Loading values in new tables

Update portfolioproject..avocado
set [Total_price(rs.)] = AveragePrice*[Total Volume]

Update portfolioproject..avocado
set smallbagspercent = ([Small Bags]/[Total Bags])*100
where [Small Bags]<>0

Update portfolioproject..avocado
set smallbagspercent = 0
where [Small Bags]=0


Update portfolioproject..avocado
set largebagspercent = ([Large Bags]/[Total Bags])*100
where [Large Bags]<>0

Update portfolioproject..avocado
set largebagspercent = 0
where [Large Bags]=0

Update portfolioproject..avocado
set Xlargebagspercent = ([XLarge Bags]/[Total Bags])*100
where [XLarge Bags]<>0

Update portfolioproject..avocado
set Xlargebagspercent = 0
where [XLarge Bags]=0

Update portfolioproject..avocado
Set region = 'US'
where region = 'TotalUS'

--Removed(F1, 4046, 4225, 4770) unwanted columns manually

---------------ANALYTICS-------------

--Year-wise Max sales

Select year, sum(Totalprice_inrupees) as Totalsales
from portfolioproject..avocado
group by year
order by year 


--total and average sales in regions in years

select region, sum(Totalprice_inrupees) as totalsalesamt, avg(Totalprice_inrupees) as averagesalesamt
from portfolioproject..avocado
where year = 2015
group by region
order by totalsalesamt

select region, sum(Totalprice_inrupees) as totalsalesamt, avg(Totalprice_inrupees) as averagesalesamt
from portfolioproject..avocado
where year = 2016
group by region
order by totalsalesamt

select region, sum(Totalprice_inrupees) as totalsalesamt, avg(Totalprice_inrupees) as averagesalesamt
from portfolioproject..avocado
where year = 2017
group by region
order by totalsalesamt

select region, sum(Totalprice_inrupees) as totalsalesamt, avg(Totalprice_inrupees) as averagesalesamt
from portfolioproject..avocado
where year = 2018
group by region
order by totalsalesamt



--avocado type-wise sales
select type,year, sum(Totalprice_inrupees) as totalsalesamt, avg(Totalprice_inrupees) as averagesalesamt
from portfolioproject..avocado
group by type, Year
order by year

--Average price of types
select type, avg(Averageprice) as avgprice
from portfolioproject..avocado
group by type
order by avgprice desc
