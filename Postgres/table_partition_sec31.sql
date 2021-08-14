-- ==================================
-- TABALE PARTITIONING 
-- ==================================
/*

Types of partition 
*** Range : key column or a set of column with NO OVERLAPING between the ranges of values    
   Jan Dec 2000, Jan-Dec 2001
 - it is very useful working with date, partition by year and then subpartition by month then subpartition by day 
      year 
        month 
          day 


*** list : partitioned by explicitly listing which key values appear in each partition        
 -  LIST (field)
    countries: country code, sale 

    
*** Hash : 

=================================================================
In a large table some columns are frequently occuring in WHERE clause 
     SELECT * FROM large_table 
       WHERE 
        column <condition>

- Examine the WHERE clause of your querey workload and look for table columns that are consistently used to access data 
- partition based on ,ost frequent query condition 
    query looks by date         partition by dates, weekly, monthly 
    query looks by reagion      partition by each region type 


