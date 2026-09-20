# 📚 SQL Fundamentals — Practice Reference

![SQL](https://img.shields.io/badge/SQL-MySQL-4479A1?logo=mysql&logoColor=white)
![Joins](https://img.shields.io/badge/SQL-Joins-2C5F7C)
![DDL](https://img.shields.io/badge/SQL-Constraints%20%26%20DDL-2C5F7C)

A clean, organized reference of core SQL concepts — joins, set operators, and table design/constraints — practiced on small sample datasets.

> ℹ️ This is **practice material**, not a business analysis project — see [Myntra](https://github.com/mdooo7/myntra-excel-sql-analysis) and [Swiggy](https://github.com/mdooo7/swiggy-sql-analysis) for those.

## 📑 Table of Contents
- [Techniques Demonstrated](#️-techniques-demonstrated)
- [What's Inside](#️-whats-in-sql_fundamentals_referencesql)
- [Repository Structure](#-repository-structure)
- [How to Use](#-how-to-use-this-repo)

## 🛠️ Techniques Demonstrated
`LEFT JOIN` · `RIGHT JOIN` · `INNER JOIN` · `CROSS JOIN` · `UNION` / `UNION ALL` · `EXCEPT` · `INTERSECT` · `AUTO_INCREMENT` · `NOT NULL` / `DEFAULT` · `CHECK` constraints · `ALTER TABLE`

## 🗂️ What's in [`sql_fundamentals_reference.sql`](./sql_fundamentals_reference.sql)

<details open>
<summary><strong>1. Joins</strong></summary>
<br>

All 4 join types on an employees/department/salaries schema, including 3-table joins.
</details>

<details>
<summary><strong>2. Set Operators</strong> — a mini case study</summary>
<br>

Tracking a user base across 3 annual snapshots: new users, churned users, and retained users,
using `UNION`, `EXCEPT`, and `INTERSECT`.
</details>

<details>
<summary><strong>3. Table Design & Constraints</strong></summary>
<br>

A Bookstore schema demonstrating `AUTO_INCREMENT`, `NOT NULL`, `DEFAULT`, `DATETIME`, and a
`CHECK` constraint that rejects invalid data.
</details>

<details>
<summary><strong>4. ALTER TABLE</strong></summary>
<br>

Modifying an existing schema: adding/dropping columns, renaming a column, changing a default
value, and adding a `UNIQUE` constraint.
</details>

## 📁 Repository Structure

```text
sql-fundamentals-reference/
├── README.md
└── sql_fundamentals_reference.sql
```

## 🚀 How to Use This Repo
Run `sql_fundamentals_reference.sql` against any MySQL instance — each section creates its own
database and sample data, so no external dataset is needed.
