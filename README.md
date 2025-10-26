# SQL Practice: UNION and Views

This project contains SQL exercises focused on:
- Combining data using `UNION`
- Creating and querying `VIEW`s

All tasks are based on the **MySQL Employees** sample database.

---

## 📘 Files

### 🔹 `union_tasks.sql`
Contains UNION-based queries:
1. Union of male employees and managers  
2. Unique list of job titles and departments  
3. Employees with salaries > 60,000 or < 40,000  
4. Current and former employees (with status)  
5. Average salary comparison: managers vs employees  

### 🔹 `views_tasks.sql`
Contains view creation tasks:
1. Simple view with employee names  
2. View joining employees with their current salaries  
3. View showing average salary by department  
4. View showing employees working in the 'Sales' department  

---

## ⚙️ Database
These scripts use the [MySQL Employees Database](https://github.com/datacharmer/test_db).

To load the database:
```bash
mysql -u root -p < employees.sql
# sql_problems_join_union
