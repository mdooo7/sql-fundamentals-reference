# SQL Fundamentals — Practice Reference

A clean, organized reference of core SQL concepts — joins, set operators, and table design/constraints — practiced on small sample datasets. This is **practice material**, not a business analysis project (see [Myntra](https://github.com/mdooo7/myntra-excel-sql-analysis) and [Swiggy](https://github.com/mdooo7/swiggy-sql-analysis) for those).

## 🛠️ Techniques Demonstrated
`LEFT JOIN` · `RIGHT JOIN` · `INNER JOIN` · `CROSS JOIN` · `UNION` / `UNION ALL` · `EXCEPT` · `INTERSECT` · `AUTO_INCREMENT` · `NOT NULL` / `DEFAULT` · `CHECK` constraints · `ALTER TABLE`

## 🗂️ What's in [`sql_fundamentals_reference.sql`](./sql_fundamentals_reference.sql)

1. **Joins** — all 4 join types on an employees/department/salaries schema, including 3-table joins
2. **Set operators** — a small case study tracking a user base across 3 annual snapshots: new users, churned users, and retained users, using `UNION`, `EXCEPT`, and `INTERSECT`
3. **Table design & constraints** — a Bookstore schema demonstrating `AUTO_INCREMENT`, `NOT NULL`, `DEFAULT`, `DATETIME`, and a `CHECK` constraint that rejects invalid data
4. **ALTER TABLE** — modifying an existing schema: adding/dropping columns, renaming a column, changing a default value, and adding a `UNIQUE` constraint

## 🚀 How to Use This Repo
Run `sql_fundamentals_reference.sql` against any MySQL instance — each section creates its own
database and sample data, so no external dataset is needed.
