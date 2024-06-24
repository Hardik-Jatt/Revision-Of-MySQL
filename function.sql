-- Function to calculate the total revenue for a given product category
CREATE FUNCTION CalculateTotalRevenue
    (@Category VARCHAR(50))
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @TotalRevenue DECIMAL(10, 2)
    
    SELECT @TotalRevenue = SUM(o.total_amount)
    FROM orders o
    INNER JOIN products p ON o.product_id = p.product_id
    WHERE p.category = @Category
    
    RETURN @TotalRevenue
END;