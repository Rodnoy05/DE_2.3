select o3.OrderID, o3.TotalAmount
  from Orders o3
 where o3.CustomerID in
       (select c.CustomerID
          from Customers c
         where c.CustomerID in
               (select o.CustomerID
                  from Orders o
                 where o.TotalAmaunt =
                       (select max(o2.TotalAmaunt) from Orders o2)))
 order by o3.TotalAmaunt desc