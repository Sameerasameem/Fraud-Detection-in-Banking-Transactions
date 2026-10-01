create database Project
use Project
select * from accounts
select * from beneficiaries
select * from branches 
select * from cards
select * from customers
select * from devices
select * from employees
select * from loans 
select * from merchants
select * from fraud_alerts
select * from transaction_flags
select * from transactions

-- 1. Find the top 5 customers based on total fraudulent transaction amount
select a.customer_id, sum(a.amount) as Total_Fraudulent from transactions as a
join transaction_flags AS f  ON a.transaction_id = f.transaction_id WHERE f.flag_type IS NOT NULL group by a.customer_id order by Total_Fraudulent desc limit 5

-- 2. Find all transaction made through ATM betwEen 12 am and 5 am
select * from transactions where transaction_time between '00:00:00' AND '05:00:00' and  transaction_type = "ATM withdrawal"

-- 3. Find the beneficiaries who received money from more than 5 different accounts
select a.beneficiary_account,a.beneficiary_id,count(distinct a.account_id )as  different_accounts from beneficiaries as a
left join transactions as b on a.beneficiary_id = b.beneficiary_id group by a.beneficiary_account,beneficiary_id having count(distinct b.account_id ) > 5  

-- 4. Find the top 3 highest risk transactions for each month using row_number()
select * from (select t.*,row_number() over(partition by month(transaction_date) order by risk_Score desc)as  rno from transactions as t) as x WHERE rno <= 3;

-- 5. Find all accounts that have transactions from more than 3 different devices
select a.account_id,count( distinct a.device_id) as Total from transactions as a
left join devices as b on a.device_id = b.device_id group by a.account_id having Total > 3

-- 6. Count how many transactions were made through UPI
select count(*) as UPI from transactions where transaction_type = 'UPI'

-- 7. Find the number of transactions handled by each branch
select count(b.transaction_id),a.branch_name from branches as a
left join transactions as b on a.city = b.location group by a.branch_name

-- 8. Find customers who have transaction through more than 2 different channel
select concat(a.first_name,' ',a.last_name) as Name, count(distinct b.channel) as Channel from customers as a
left join transactions as b on a.customer_id = b.customer_id group by Name having Channel > 2

-- 9. find each customer's total transaction amount, fraudulent amount, fraud count and fraud percentage
select a.customer_id, concat(a.first_name, ' ', a.last_name) as name, coalesce(sum(b.amount), 0) as total_transaction_amount, coalesce(sum(case
        when b.fraud_status = 'fraud' then b.amount else 0 end), 0) as fraudulent_amount,
    coalesce(sum(case when b.fraud_status = 'fraud' then 1 else 0 end), 0) as fraud_count, coalesce(round(
        100.0 * sum(case when b.fraud_status = 'fraud' then 1 else 0 end) / nullif(count(b.transaction_id), 0),2), 0) as fraud_percentage
from customers as a left join transactions as b on a.customer_id = b.customer_id group by a.customer_id, a.first_name, a.last_name order by fraudulent_amount desc;

-- 10.Find the branch with highest fraud rate
select c.branch_name, count(DISTINCT a.transaction_id) AS fraud_count, count(DISTINCT b.transaction_id) AS total_transactions,(count(DISTINCT a.transaction_id) * 100.0 / count(DISTINCT b.transaction_id)) AS fraud_rate from branches as c
left join transactions as b on c.city = b.location
left join transaction_flags as a on a.transaction_id = b.transaction_id group by c.branch_name order by fraud_rate desc limit 1

-- 11. Find location having more than 20 transaction
select count(transaction_type) as total_transactions,location from transactions group by location having total_transactions > 20

-- 12. Find customers whose total transaction amount is greater than 9,00,000
select concat(a.first_name,' ',a.last_name) as Name,b.balance_after from customers as a
left join transactions as b on a.customer_id = b.customer_id where b.balance_after > 900000

-- 13. Find merchants whose fraud rate is greater than the overall fraud rate.

select c.merchant_name,count(DISTINCT a.transaction_id) AS fraud_count, count(DISTINCT b.transaction_id) AS total_transactions,(count(DISTINCT a.transaction_id) * 100.0 / count(DISTINCT b.transaction_id)) AS fraud_rate from merchants as c
left join transactions as b on c.city = b.location
left join  transaction_flags as a on a.transaction_id = b.transaction_id group by c.merchant_name HAVING COUNT(DISTINCT a.transaction_id) * 100.0 /
       count(DISTINCT b.transaction_id) >
       ( select count(DISTINCT f.transaction_id) * 100.0 / count(DISTINCT t.transaction_id) from transactions AS t
           left join transaction_flags as f on f.transaction_id = t.transaction_id)
           
           
-- 14. Find the top 3 customers with the highest number of fraud alerts in each branch.
select count( DISTINCT 	a.branch_name),concat(b.first_name,' ',b.last_name)  as Name,count( C.customer_id) AS Alert_count from branches as a
left join customers as b on b.city = a.city 
left join fraud_alerts as c on c.customer_id = b.customer_id group by Name,b.customer_id order by Alert_count  DESC limit 3


-- 15. Find devices that are linked to multiple accounts belonging to different customers.

select a.device_type,a.device_id,count(DISTINCT a.customer_id) as customer_count, count(DISTINCT c.account_id) as account_count   from devices as a
left join accounts as c on a.customer_id = c.customer_id group by a.device_type,a.device_id 
having count(DISTINCT c.account_id)  > 1 and count(DISTINCT c.account_id) > 1 order by customer_count desc


-- 16. Find channels having more than 500 transactions
select channel,count(*) as transaction_count from transactions group by channel having count(*) > 500 order by  transaction_count desc

-- 17. Find the total  transaction amount for each customers using transactions
select sum(a.amount) as total_transaction_amount,a.customer_id,concat(b.first_name,'',b.last_name) as Name from transactions as a
left join customers as b on a.customer_id = b.customer_id group by a.customer_id,Name ORDER BY total_transaction_amount DESC

-- 18. Find the number of unique accounts used for each merchant.
select  m.merchant_id,m.merchant_name,count(distinct b.account_id) from merchants  as m
join transactions as b on m.merchant_id = b.merchant_id group by m.merchant_id,m.merchant_name

-- 19. Find transaction where the same customers device and location combination occurred multiple times.
select a.customer_id,b.device_id,concat(a.first_name,' ',a.last_name) as Name,b.device_type,c.location, count(*) AS occurrence_count
 from customers as a
left join devices as b on b.customer_id = a.customer_id
left join transactions as c on b.device_id = c.device_id group by a.customer_id,b.device_id, Name,b.device_type,c.location having count(*) >1

-- 20. Find customers who performed transactions using the same device from different location.
select a.customer_id,b.device_id,concat(a.first_name,' ',a.last_name) as Name,b.device_type,count( distinct c.location )AS occurrence_count from customers as a
left join devices as b on b.customer_id = a.customer_id
left join transactions as c on b.device_id = c.device_id group by  a.customer_id, b.device_id, Name,b.device_type having COUNT(DISTINCT c.location) > 1

-- 21. Find the average transaction fee for each channel.
select avg(a.amount) as AVERAGE_TRANSACTION,a.channel from transactions as a group by channel

-- 22. Find customers who have used more than one transaction type.
select a.customer_id, concat(a.first_name,' ',a.last_name) as Name,  count(distinct b.transaction_type) from customers as a
left join transactions as b on a.customer_id = b.customer_id group by Name,a.customer_id having  count(distinct b.transaction_type) > 1

-- 23. Find accounts that have transaction on both domestic and intenational location.
select b.account_id, b.is_international, count(*) as transaction_count from transactions as b
where b.account_id in ( select a.account_id from accounts as a inner join transactions as t on a.account_id = t.account_id
group by a.account_id having sum(case when t.is_international = 'true' then 1 else 0 end) > 0 and
sum(case when t.is_international = 'false' then 1 else 0 end) > 0)
group by b.account_id, b.is_international
order by b.account_id;

-- 24. Find the most recent transaction made by each account.
select max(transaction_time) as MOST_RECENT_TRANSACTION,account_id from transactions group by account_id

-- 25. Find the customer_id and loan_amount of customers whose loan amount is greater than 500000.
select customer_id,account_id from loans where outstanding_amount > 50000

-- 26. Find the accounts whose latest transaction amount is greater than their previous transaction amount.

with transaction_rank as (
    select account_id,transaction_id,transaction_date,transaction_time,amount,
        lag(amount) over (
            partition by account_id
            order by transaction_date, transaction_time
        ) as previous_amount,
        row_number() over (
            partition by account_id
            order by transaction_date desc, transaction_time desc
        ) as rn from transactions)
select account_id, amount as latest_amount, previous_amount from transaction_rank where rn = 1 and amount > previous_amount

-- 27. Find customers who have transactions in three or more different cities.
select b.account_id,concat(a.first_name,' ',a.last_name) as Name,count( b.location) from customers as a
left join transactions as b on a.customer_id = b.customer_id group by Name,b.account_id having count(b.location) >= 3 

-- 28. Find customers whose total transaction fees are greater than the average customer transaction fee.
select a.customer_id,concat(a.first_name,' ',a.last_name) as Name, sum(b.amount) as total_fee from customers as a
left join transactions as b on a.customer_id = b.customer_id group by a.customer_id, Name having sum(b.amount) > (select avg(total_fee) from ( select sum(amount) as total_fee from transactions group by customer_id) as customer_fees )	 	

-- 29. Find accounts that have multiple failed transaction followed by a successful.
with transaction_check as ( select account_id,transaction_status,transaction_date,transaction_time,
        sum(case when transaction_status = 'Failed' then 1 else 0 end)
            over ( partition by account_id order by transaction_date, transaction_time rows between unbounded preceding and 1 preceding) as failed_count from transactions
)
select account_id,failed_count,transaction_status from transaction_check where transaction_status = 'Success' and failed_count > 1;


-- 30. Find the highest transaction amount made through each channel.
select max(a.amount) as Highest_transaction ,a.channel from transactions as a group by channel

-- 31. Find the total number of transaction for each transaction status.
select count(transaction_id),transaction_status from transactions group by transaction_status

-- 32.Find the account_id of customers whose loan_type is Auto.
select account_id, loan_type from loans where loan_type = 'AUTO'

-- 33. Find the customers whose first transaction was fraudulent.
select a.customer_id,concat(a.first_name,'',a.last_name) as Name,b.transaction_id,   b.transaction_time from customers as a
left join transactions as b on b.customer_id = a.customer_id where b.transaction_time =
(select min(t.transaction_time) from transactions as t where t.customer_id = a.customer_id)and b.fraud_status  <> 'Normal';