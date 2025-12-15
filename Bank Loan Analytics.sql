# Bank Analytics

Create Database Project;
Use Project;

select * from ba;
select count(*) from ba;

-- --------------------------------------------------------------------------------------------------------------

#  ( KPI 01> ) Year wise loan amount Status
select year(issue_d)as "Issue year", sum(loan_amnt) as "Loan amount ($)"
from ba
group by year(issue_d)
order by year(issue_d);  

-- -----------------------------------------------------------------------------------------------------------------

# (KPI 02> ) Grade and sub grade wise revol_bal
select grade, sub_grade, sum(revol_bal) as "Total Revolving Balance ($)" from ba
group by grade, sub_grade
order by sum(revol_bal) desc;

-- ----------------------------------------------------------------------------------------------------------------

# ( KPI 03> ) Total Payment for Verified Status Vs Total Payment for Non Verified Status
select verification_status, sum(Total_pymnt) as 'Total Payments ($)'
from ba
group by verification_status;

-- ----------------------------------------------------------------------------------------------------------------

# ( KPI 04> )State wise and month wise loan status
select addr_state as "State", monthname(issue_d) as "Issue month", loan_status as "Loan Status", count(loan_status) as "count"
from ba
group by monthname(issue_d), addr_state, loan_status
order by count(loan_status) desc;

-- ------------------------------------------------------------------------------------------------------------------

# ( KPI 05> ) Home ownership Vs last payment date stats
select year(last_pymnt_d) as "Last Payment Year", monthname(last_pymnt_d) as "Month", home_ownership, count(home_ownership) as "Count"
from ba
group by home_ownership, year(last_pymnt_d), monthname(last_pymnt_d)
order by year(last_pymnt_d), monthname(last_pymnt_d), count(home_ownership) desc;

# THANKYOU  