/* PROJECT: Revenue Leakage Detection
GOAL: Identify orders that were successfully placed but have no record of payment.
This is a core task in Revenue Assurance.
*/

SELECT 
    o.order_id, 
    o.order_date, 
    o.amount
FROM orders AS o
LEFT JOIN payments AS p 
    ON o.order_id = p.order_id
WHERE p.payment_status IS NULL;

-- This query flags transactions where money might be "leaking" out of the system.
