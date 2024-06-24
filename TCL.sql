-- Begin a transaction
BEGIN TRANSACTION

-- Update product price
UPDATE products
SET price = price * 0.9
WHERE category = 'Electronics'

-- Commit the transaction
COMMIT

-- Rollback the transaction
ROLLBACK