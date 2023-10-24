select c.CustomerID, c.FirstName, c.LastName, c.Email
  from Customers c
 where c.CustomerID in
       (select o.CustomerID
          from Orders o
         where o.TotalAmaunt = (select max(o2.TotalAmaunt) from Orders o2))
