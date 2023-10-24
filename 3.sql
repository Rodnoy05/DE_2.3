select all_cust.CustomerID,
       all_cust.FirstName,
       all_cust.LastName,
       all_cust.Email
  from (select c.CustomerID,
               c.FirstName,
               c.LastName,
               c.Email,
               avg(sum(o.TotalAmaunt)) as Cust_avg_sum
          from Customers c
          join orders o
            on o.CustomerID = c.CustomerID
         group by c.CustomerID, c.FirstName, c.LastName, c.Email) all_cust
 where all_cust.Cust_avg_sum >
       (select avg(all_avg.all_cust_avg_sum)
          from (select o2.CustomerID,
                       avg(sum(o2.TotalAmaunt)) as all_cust_avg_sum
                  from Orders o2
                 group by o2.CustomerID) all_avg) 
