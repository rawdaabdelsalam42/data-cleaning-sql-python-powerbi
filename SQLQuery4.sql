-- إجمالي المبيعات لكل فئة (Category)
SELECT Category, SUM(Total) AS TotalSales
FROM dbo.finaldata
GROUP BY Category
ORDER BY TotalSales DESC;


-- عدد العملاء حسب النوع (Gender)
SELECT Gender, COUNT(DISTINCT CustomerID) AS NumCustomers
FROM dbo.finaldata
GROUP BY Gender;


--  أعلى 5 عملاء صرفوا فلوس
SELECT TOP (5) CustomerID, SUM(Total) AS TotalSpent
FROM dbo.finaldata
GROUP BY CustomerID
ORDER BY TotalSpent DESC;


-- إجمالي المبيعات بالشهور (مع تحويل OrderDate لنوع DATE)
SELECT FORMAT(TRY_CAST(OrderDate AS DATE), 'yyyy-MM') AS [Month],
       SUM(Total) AS TotalSales
FROM dbo.finaldata
WHERE TRY_CAST(OrderDate AS DATE) IS NOT NULL
GROUP BY FORMAT(TRY_CAST(OrderDate AS DATE), 'yyyy-MM')
ORDER BY [Month];


--  أكثر 5 منتجات مبيعًا
SELECT TOP (5) ProductID, SUM(Quantity) AS TotalQuantity
FROM dbo.finaldata
GROUP BY ProductID
ORDER BY TotalQuantity DESC;

