# Databases II - Midterm

## Exercise 1
Suppose the following sql statement
```
SELECT JOB_ID, MAX(SALARY)
FROM EMPLOYEE
GROUP BY JOB_ID
```
### Question 1 
By using what you study in class, type a plsql program that displays the result of the previous sql query like: 
```
=====================
 Job id   max salary
=====================
  ...        ...
=====================
```

### Question 2 
Make a change to the code in Question 1 in order to display job id, job title, max and min salary
and at the end of the minimum and maximum of all :
```
============================================
Job id   job title   max salary   min salary
============================================
  ...      ...         ...            ...
============================================
Minimum of all min above: ……………
Maximum of all max above: ……………
============================================
```
## Exercise 2
By using the table customer, the attribute %type and case statement, type a PL/SQL program that
asks to enter
- Customer id
And display the following
- Customer id
- Name
- Address
- City
- Credit limit
- New credit limit
- Percentage of increase or decrease of credit limit
The new credit limit is calculated according to the following table:

```
+----------------------------------+------------------------------------+
+          Area Code               +         New Credit Limit           +
+----------------------------------+------------------------------------+
+            <=400                 +                +4%                 +
+----------------------------------+------------------------------------+
+        >400 and <=600            +                -3%                 +
+----------------------------------+------------------------------------+
+             >400                 +                +2%                 +
+----------------------------------+------------------------------------+
```
When the customer is not in the table, display the message : "the customer you entered : …. doesn’t
exist"
