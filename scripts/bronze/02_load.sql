/*===================================
Load Raw Data into Supermarket Sales Table
===================================
Purpose:
Truncate existing data and load fresh records into the `bronze.supermarketsales` table from a CSV file using `BULK INSERT`.

Reason:
To efficiently populate the raw sales table with data for processing and analysis, ensuring no duplication or legacy data remains.

Any other useful info:
- `TRUNCATE TABLE` ensures a clean slate before importing new records.
- `FIRSTROW = 2` skips the CSV header.
- `FIELDTERMINATOR = ','` defines the comma delimiter.
- `TABLOCK` improves performance by locking the table during the bulk insert.
- File path must be accessible to the SQL Server instance and configured with appropriate permissions.
--------------------------------------------------------------*/

TRUNCATE TABLE bronze.supermarketsales;

BULK INSERT bronze.supermarketsales
FROM 'C:\Users\Iocodesalot\OneDrive\Documents\Data analyst\SQL\Supermarket sales\supermarketsales.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
