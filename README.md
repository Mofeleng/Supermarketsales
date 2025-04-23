# Supermarket Sales Analysis Project

## Project Overview

This project aims to process, clean, and analyze supermarket sales data to generate insights into business performance. The data processing pipeline is broken down into distinct stages: **initial setup**, **raw data ingestion and cleaning (bronze layer)**, and **data transformation (silver layer)**. The project follows an ETL (Extract, Transform, Load) workflow that organizes data for subsequent analysis.

### Data Processing Stages

The project follows a layered approach for data processing, starting from raw data ingestion and quality checks, followed by transformation, and finally preparing the dataset for analysis.

### Step 1: **Initialization - Supermarket Sales Database Setup**

The first step of the project is to initialize a clean instance of the database, ensuring a fresh environment for all further processes. This step involves:
- Removing any existing versions of the `supermarketsales` database.
- Creating a new database with the necessary schemas (`bronze` for raw data and `sales` for cleaned, business-level data).
- Utilizing **`SINGLE_USER` mode** to avoid locking issues when removing the database.

This setup ensures that the ETL process runs smoothly, without any interference from existing data, and sets up a foundation for efficient data ingestion and transformation.

### Step 2: **Raw Data Ingestion - Bronze Layer**

Once the database setup is complete, the next step is to load the raw supermarket sales data into the `bronze` schema. This involves:
- **Creating the raw `bronze.supermarketsales` table** to store all the transactional data.
- Ensuring the table can accommodate flexible data types like `FLOAT` and `NVARCHAR`, which match the source data format.

After the table is set up, the data is **loaded into the table using the `BULK INSERT` command**. This process involves:
- Truncating any existing data to ensure the table is empty before importing new records.
- Skipping the header row in the CSV file (`FIRSTROW = 2`), and defining the correct delimiter and locking options for optimal performance.

This stage serves as the **staging area** for raw data and ensures that no legacy or duplicate data remains. The `bronze` schema holds all unprocessed or minimally transformed data, preserving the original structure for future validation.

### Step 3: **Data Cleaning - Bronze Layer**

With raw data loaded into the `bronze.supermarketsales` table, we perform basic **data quality checks and cleaning** to ensure integrity before further processing. The cleaning tasks include:
- Removing **leading/trailing white spaces** and **duplicates** from important fields like `invoice_id`.
- Verifying the **standardization** of categorical fields such as `city`, `customer_type`, `gender`, and `product_line`.
- **Date formatting**: Ensuring that all dates are properly formatted, stripping unwanted slashes and converting them into the correct date format.

After cleaning, the dataset is ready for the next phase of transformation.

### Step 4: **Data Transformation - Silver (Sales) Layer**

The cleaned data is then transformed into a structured, analysis-ready format in the **`sales` schema**. This step involves:
- **Creating the clean `sales.supermarketsales` table** where transformed data will be stored.
- Converting the `date` column from `NVARCHAR` to the `DATE` type to facilitate efficient time-based analysis.
- Renaming certain columns (e.g., renaming `tax` to `tax_5_percent`) for clarity and consistency in reporting.

Once the clean table is set up, the next task is to **move the cleaned data from the `bronze` layer to the `sales` layer**, which involves transforming the data:
- **Date conversion**: Ensuring the date format is consistent across all records.
- **Column renaming**: Simplifying column names for better clarity, such as renaming `tax` to `tax_5_percent` to indicate the specific tax rate.

The final step in this stage is to populate the `sales.supermarketsales` table, making the data ready for **business intelligence and analytical queries**.

---
