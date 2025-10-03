-- 1) إجمالي المبيعات لكل فئة (Category)
SELECT Category, SUM(Total) AS TotalSales
FROM dbo.finaldata
GROUP BY Category
ORDER BY TotalSales DESC;


-- 2) عدد العملاء حسب النوع (Gender)
SELECT Gender, COUNT(DISTINCT CustomerID) AS NumCustomers
FROM dbo.finaldata
GROUP BY Gender;


-- 3) أعلى 5 عملاء صرفوا فلوس
SELECT TOP (5) CustomerID, SUM(Total) AS TotalSpent
FROM dbo.finaldata
GROUP BY CustomerID
ORDER BY TotalSpent DESC;


-- 4) إجمالي المبيعات بالشهور (مع تحويل OrderDate لنوع DATE)
SELECT FORMAT(TRY_CAST(OrderDate AS DATE), 'yyyy-MM') AS [Month],
       SUM(Total) AS TotalSales
FROM dbo.finaldata
WHERE TRY_CAST(OrderDate AS DATE) IS NOT NULL
GROUP BY FORMAT(TRY_CAST(OrderDate AS DATE), 'yyyy-MM')
ORDER BY [Month];


-- 5) أكثر 5 منتجات مبيعًا
SELECT TOP (5) ProductID, SUM(Quantity) AS TotalQuantity
FROM dbo.finaldata
GROUP BY ProductID
ORDER BY TotalQuantity DESC;

