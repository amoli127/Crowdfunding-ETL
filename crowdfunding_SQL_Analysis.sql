-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

select DISTINCT(cf_id), backers_count, outcome
from campaign
where outcome = 'live'
order by backers_count desc

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

select count(cf_id) as backer_counts
from backers
GROUP BY cf_id
ORDER BY backer_counts desc

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

select co.first_name, co.last_name, co.email, (cam.goal - cam.pledged) as remaining_goal_amount
INTO email_contacts_remaining_goal_amount
from contacts co
inner join campaign cam on co.contact_id = cam.contact_id
where cam.outcome = 'live'
order by remaining_goal_amount desc


-- Check the table

select * from email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

select b.email, b.Last_name, b.first_name, b.cf_id, cam.company_name, cam.description, cam.end_date, (cam.goal - cam.pledged) as left_of_goal
into table email_backers_remaining_goal_amount
from backers b
INNER JOIN campaign cam 
on b.cf_id = cam.cf_id
where cam.outcome = 'live'
order by b.last_name ASC

-- Check the table

select * from email_backers_remaining_goal_amount
