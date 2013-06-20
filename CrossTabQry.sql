/******************************
  Proc: CrossTabQry
  version: ENIQ2.5
  Date: 27/02/2013
  Modify By: Walter
*******************************/
/*
cd UnixPath
isql -Udc -Pdc -Sdwhdb -w2000 < CrossTabQry.sql
*/

IF EXISTS (SELECT * FROM sysobjects WHERE 
              TYPE LIKE "P" 
              AND
              NAME LIKE "CrossTabQry")
              DROP PROC CrossTabQry
GO

CREATE PROC CrossTabQry
    @dayago INT
AS

    DECLARE
            @s_date VARCHAR(20)
            ,@col_len INT


    SELECT @s_date=CONVERT(CHAR(8), dateadd(day, -@dayago, getdate()), 1)
    SELECT @col_len = 15

    SELECT "DATE" = CONVERT(CHAR(8), DATE_ID, 1)
            ,"RECORD_ID" = SUBSTRING(RECORD_ID,1,10)
            
            ,"DataVector_0" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 0 THEN DataVector ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVector_1" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 1 THEN DataVector ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVector_2" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 2 THEN DataVector ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVector_3" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 3 THEN DataVector ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVector_4" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 4 THEN DataVector ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVector_5" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 5 THEN DataVector ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVector_6" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 6 THEN DataVector ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVector_7" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 7 THEN DataVector ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVector_8" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 8 THEN DataVector ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVector_9" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 9 THEN DataVector ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVector_10" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 10 THEN DataVector ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVector_11" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 11 THEN DataVector ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVector_12" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 12 THEN DataVector ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVector_13" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 13 THEN DataVector ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVector_14" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 14 THEN DataVector ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVector_15" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 15 THEN DataVector ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            
            ,"DataVectorPucch_0" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 0 THEN DataVectorPucch ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVectorPucch_1" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 1 THEN DataVectorPucch ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVectorPucch_2" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 2 THEN DataVectorPucch ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVectorPucch_3" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 3 THEN DataVectorPucch ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVectorPucch_4" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 4 THEN DataVectorPucch ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVectorPucch_5" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 5 THEN DataVectorPucch ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVectorPucch_6" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 6 THEN DataVectorPucch ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVectorPucch_7" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 7 THEN DataVectorPucch ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVectorPucch_8" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 8 THEN DataVectorPucch ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVectorPucch_9" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 9 THEN DataVectorPucch ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVectorPucch_10" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 10 THEN DataVectorPucch ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVectorPucch_11" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 11 THEN DataVectorPucch ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVectorPucch_12" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 12 THEN DataVectorPucch ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVectorPucch_13" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 13 THEN DataVectorPucch ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVectorPucch_14" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 14 THEN DataVectorPucch ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")
            ,"DataVectorPucch_15" = REPLACE(STR(SUM(ISNULL(CASE WHEN DCVECTOR_INDEX = 15 THEN DataVectorPucch ELSE 0 END, 0)), @col_len), "0" + REPLICATE(" ", @col_len - 1), REPLICATE(" ", @col_len - 1) + "0")

            
    FROM Table
    WHERE [DATE] = @s_date
    GROUP BY [DATE], [RECORD_ID]
    ORDER BY [RECORD_ID], [DATE]

GO
