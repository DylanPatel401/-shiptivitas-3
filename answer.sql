-- SQL Queries for Feature Analysis

-- PART 1: Create a SQL query that maps out the daily average users before and after the feature change

-- Query to get daily average users before the feature release date
-- Feature released on 2018-06-02
-- Replace 'user_activity' with the actual table name and 'created_at' with the appropriate timestamp column
SELECT
    date(created_at) AS date,
    COUNT(DISTINCT user_id) AS daily_users
FROM
    user_activity
WHERE
    created_at < '2018-06-02'
GROUP BY
    date(created_at)
ORDER BY
    date;

-- Query to get daily average users after the feature release date
-- Feature released on 2018-06-02
-- Replace 'user_activity' with the actual table name and 'created_at' with the appropriate timestamp column
SELECT
    date(created_at) AS date,
    COUNT(DISTINCT user_id) AS daily_users
FROM
    user_activity
WHERE
    created_at >= '2018-06-02'
GROUP BY
    date(created_at)
ORDER BY
    date;

-- PART 2: Create a SQL query that indicates the number of status changes by card

-- Query to count the number of status changes by card
-- Replace 'card_status_changes' with the actual table name and 'card_id' with the appropriate column
SELECT
    card_id,
    COUNT(*) AS status_changes
FROM
    card_status_changes
GROUP BY
    card_id
ORDER BY
    status_changes DESC;

-- Actionable Ideas

-- 1. Hypothesis: Adding the Kanban Board feature will increase user engagement by making it easier to track and manage tasks.
--    Expected Impact: We expect to see a significant increase in daily active users post-release, as the feature improves task management and visibility.
--    What the Feature Is: The Kanban Board is a visual project management tool that helps users organize tasks into columns representing different stages of
--    progress (e.g., Backlog, In Progress, Complete).

-- 2. Hypothesis: Users who frequently change the status of their cards are more engaged with the app.
--    Expected Impact: By analyzing the number of status changes, we can identify highly engaged users and develop features to cater to their needs or offer incentives.
--    What the Feature Is: The card status change feature allows users to move tasks between different stages, providing a visual representation of progress 
--    and increasing user interaction with the app.

-- 3. Hypothesis: There is a correlation between the number of status changes and the overall number of tasks managed by users.
--    Expected Impact: Understanding this relationship will help us optimize the Kanban Board feature to better support users with varying levels of task 
--   management needs.
--    What the Feature Is: The feature tracks and records the number of status changes per card, helping us analyze user behavior and task management patterns.

