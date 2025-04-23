# Supermarket Sales Analysis Project

## Project Overview
This project implements a complete ETL (Extract, Transform, Load) pipeline for supermarket sales data, followed by comprehensive analysis to generate business insights. The multi-layered data architecture ensures clean, reliable data for analysis.

## Data Processing Pipeline

### 1. Database Initialization
- Created a fresh database environment with dedicated schemas
- Set up bronze schema (raw data) and sales schema (transformed data)

### 2. Data Ingestion (Bronze Layer)
- Imported raw sales data using BULK INSERT
- Preserved original data structure for validation

### 3. Data Cleaning
- Removed whitespace and duplicates
- Standardized categorical fields (city, customer type, gender, product line)
- Fixed date formatting issues

### 4. Data Transformation (Silver Layer)
- Converted data types for analysis (text to proper dates)
- Renamed columns for clarity
- Created analysis-ready dataset in sales schema

## Key Analyses & Findings

### Exploratory Data Analysis
- **Data Scope**: 3 branches (A, B, C) across different cities from Jan-Mar 2019
- **Dimensions**: Customer demographics, product categories, payment methods
- **Key Metrics**: Unit price, quantity sold, VAT, revenue, COGS, gross income, customer ratings

### Advanced Analysis
- **Monthly Performance**: Sales volume directly correlates with profit
- **Customer Sentiment**: Ratings don't reliably predict financial performance in short term
- **Segmentation Analysis**: Broke down profit by branch, customer type, and payment method
- **Trend Analysis**: Applied cumulative calculations and moving averages

### Performance Classification
Created monthly performance classification system:
- Above Average
- Below Average
- Break-even

## Technical Implementation
- SQL database with multi-schema architecture
- Window functions for time-series analysis
- Custom views for simplified branch comparisons
- Conditional logic for performance classification

## Key Insight
Profitability appears primarily volume-driven, with customer satisfaction metrics showing no strong correlation to financial performance over the analyzed period.
