-- Cursor to update payment method names for each order
DECLARE @PaymentMethodID INT
DECLARE @PaymentMethod VARCHAR(50)

DECLARE order_cursor CURSOR FOR
SELECT payment_method_id, payment_method
FROM payment_methods

OPEN order_cursor
FETCH NEXT FROM order_cursor INTO @PaymentMethodID, @PaymentMethod

WHILE @@FETCH_STATUS = 0
BEGIN
    UPDATE orders
    SET payment_method = @PaymentMethod
    WHERE payment_method_id = @PaymentMethodID
    
    FETCH NEXT FROM order_cursor INTO @PaymentMethodID, @PaymentMethod
END

CLOSE order_cursor
DEALLOCATE order_cursor