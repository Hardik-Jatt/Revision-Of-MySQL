-- Trigger to log order updates
CREATE TRIGGER LogOrderUpdate
ON orders
AFTER UPDATE
AS
BEGIN
    INSERT INTO OrderUpdateLog (
        order_id,
        customer_id,
        product_id,
        quantity,
        total_amount,
        update_date
    )
    SELECT 
        i.order_id,
        i.customer_id,
        i.product_id,
        i.quantity,
        i.total_amount,
        GETDATE()
    FROM inserted i
END