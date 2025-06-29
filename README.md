# MySQL-Data-Cleaning-Project-World-Layoffs
SQL scripts and step-by-step queries for cleaning and transforming layoff datasets using MySQL, including removing duplicates, standardizing data, handling null values, and more.
# MySQL Layoffs Data Cleaning

This repository contains SQL scripts and step-by-step queries for cleaning and transforming layoff datasets using MySQL. The project demonstrates essential data cleaning processes, including identifying and removing duplicates, standardizing data, handling null and blank values, and removing unwanted rows and columns.

## Overview

The main script walks through a logical workflow for preparing raw layoff data for analysis or reporting. The cleaning process includes:

1. **Identifying and Removing Duplicates**  
   Uses window functions to detect duplicates and deletes them from the dataset.

2. **Standardizing the Data**  
   Trims whitespace, standardizes industry and country names, and reformats date fields.

3. **Dealing with Null and Blank Values**  
   Fills or removes missing fields based on data relationships and context.

4. **Removing Unwanted Rows and Columns**  
   Cleans up the final dataset by dropping unnecessary columns.

## Usage

1. **Prepare your MySQL database:**  
   - Import your layoffs data into a schema (e.g., `my_project_layoff2`).
   - Make sure the table structure matches the queries in the script.

2. **Run the script:**  
   - Execute the SQL commands in [`Data cleaning 102.sql`](./Data%20cleaning%20102.sql) step by step, or as a batch if your environment allows.

3. **Review the changes:**  
   - Each section of the script contains comments describing its purpose and the results you should expect.

## File

- [`Data cleaning 102.sql`](./Data%20cleaning%20102.sql):  
  Contains all queries and transformations for cleaning the layoffs dataset.

## License

This project is licensed under the MIT License.

## Author

- [JoeSightAnalytics](https://github.com/JoeSightAnalytics)

---
Feel free to open an issue or submit a pull request if you have suggestions or improvements!
