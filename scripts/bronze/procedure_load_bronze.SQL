/*
==============================================================
PROCEDURE TO LOAD BRONZE (SOURCE: BRONZE)
==============================================================

PURPOSE OF THE SCRIPT:
It is a precedure which load data into the bronze layer from external files like CSV, Excel etc
- It truncate the table before loading the data.
- It uses the "BULK INSERT" command to insert data into the table

PARAMETERS:
 - NONE
 - This stored procedure does not accept any parameter or return any value.

 INSERTCOMMAND:
 - EXEC bronze.load_bronze
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME,
@batch_end_time DATETIME ;

BEGIN TRY
	SET @batch_start_time = GETDATE();
	PRINT '=============================================================';
	PRINT '...Loading The Bronze Layer';
	PRINT '=============================================================';
	
	PRINT'..............................................................';
	PRINT'...Loading CRM Tables';
	PRINT'..............................................................';
	
	SET @start_time = GETDATE();
	PRINT'>>> Truncating Table: bronze.crm_cust_info';
	TRUNCATE TABLE bronze.crm_cust_info;
	PRINT'>>> Inserting Data Into Table: bronze.crm_cust_info';
	BULK INSERT bronze.crm_cust_info 
	FROM 'C:\Users\User\Desktop\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time =GETDATE();
	PRINT'>>> Loading Time' + CAST(DATEDIFF(Second, @Start_time,@Endtime) AS NVARCHAR) + ' Seconds';
	PRINT'......................';


	SET @start_time = GETDATE();
	PRINT'>>> Truncating Table: bronze.crm_cust_info';
	TRUNCATE TABLE bronze.crm_prd_info;
	PRINT'>>> Inserting Data Into Table: bronze.crm_prd_info';
	BULK INSERT bronze.crm_prd_info
	FROM 'C:\Users\User\Desktop\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	WITH(
		FIRSTROW =2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time =GETDATE();
	PRINT'>>> Loading Time' + CAST(DATEDIFF(Second, @Start_time,@Endtime) AS NVARCHAR) + ' Seconds';
	PRINT'......................';


	SET @start_time = GETDATE();
	PRINT'>>> Truncating Table: bronze.crm_cust_info';
	TRUNCATE TABLE bronze.crm_sales_details;
	PRINT'>>> Inserting Data Into Table: bronze.crm_sales_details';
	BULK INSERT bronze.crm_sales_details
	FROM 'C:\Users\User\Desktop\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	WITH(
		FIRSTROW =2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time =GETDATE();
	PRINT'>>> Loading Time' + CAST(DATEDIFF(Second, @Start_time,@Endtime) AS NVARCHAR) + ' Seconds';
	PRINT'......................';


	PRINT'..............................................................';
	PRINT'...Loading ERP Tables';
	PRINT'..............................................................';


	SET @start_time = GETDATE();
	PRINT'>>> Truncating Table: bronze.erp_CUST_AZ12';
	TRUNCATE TABLE bronze.erp_CUST_AZ12;
	PRINT'>>> Inserting Data Into Table: bronze.erp_CUST_AZ12';
	BULK INSERT bronze.erp_CUST_AZ12
	FROM 'C:\Users\User\Desktop\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time =GETDATE();
	PRINT'>>> Loading Time' + CAST(DATEDIFF(Second, @Start_time,@Endtime) AS NVARCHAR) + ' Seconds';
	PRINT'......................';


	SET @Start_time = GETDATE();
	PRINT'>>> Truncating Table: bronze.erp_LOC_A101';
	TRUNCATE TABLE bronze.erp_LOC_A101;
	PRINT'>>> Inserting Data Into Table: bronze.erp_LOC_A101';
	BULK INSERT bronze.erp_LOC_A101
	FROM 'C:\Users\User\Desktop\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time =GETDATE();
	PRINT'>>> Loading Time' + CAST(DATEDIFF(Second, @Start_time,@Endtime) AS NVARCHAR) + ' Seconds';
	PRINT'......................';


	SET @start_time = GETDATE();
	PRINT'>>> Truncating Table: bronze.erp_PX_CAT_G1V2';
	TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;
	PRINT'>>> Inserting Data Into Table: bronze.erp_PX_CAT_G1V2';
	BULK INSERT bronze.erp_PX_CAT_G1V2
	FROM 'C:\Users\User\Desktop\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time =GETDATE();
	PRINT'>>> Loading Time' + CAST(DATEDIFF(Second, @Start_time,@Endtime) AS NVARCHAR) + ' Seconds';
	PRINT'......................';

	SET @batch_end_time = GETDATE();
	PRINT'=======================================================';
	PRINT'Completed Loadin Bronze Layer:';
	PRINT'Total Loading Time:' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time)
	AS NVARCHAR) + ' Seconds';
	PRINT'=======================================================';
END TRY
BEGIN CATCH
	PRINT'================================================================';
	PRINT'OOPS! SOMETHING HAPPEN DURING LOADING BRONZE LAYER';
	PRINT'Error Messge' + ERROR_MESSAGE();
	PRINT'Error Message' + ERROR_NUMBER();
	PRINT'Error Message' + ERROR_STATE();
	PRINT'================================================================';

END CATCH
END
