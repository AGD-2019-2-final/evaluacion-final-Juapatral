-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que retorne los valores únicos de la columna `t0.c5` 
-- (ordenados). 
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
DROP TABLE IF EXISTS tbl0;
CREATE TABLE tbl0 (
    c1 INT,
    c2 STRING,
    c3 INT,
    c4 DATE,
    c5 ARRAY<CHAR(1)>, 
    c6 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'tbl0.csv' INTO TABLE tbl0;
--
DROP TABLE IF EXISTS tbl1;
CREATE TABLE tbl1 (
    c1 INT,
    c2 INT,
    c3 STRING,
    c4 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'tbl1.csv' INTO TABLE tbl1;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

SELECT c1,c5
FROM tbl0 LATERAL VIEW explode(c5) adTable AS c5
GROUP BY c5;

SELECT Letras
FROM tbl0 LATERAL VIEW explode(c5) adTable AS Letras
GROUP BY Letras;

CREATE TABLE resultado
AS
    SELECT DISTINCT letras 
    FROM (
        SELECT
            letras
        FROM
            tbl0
        LATERAL VIEW
            explode(c5) tbl0 AS letras
        ) t0
    ORDER BY letras
;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
SELECT * FROM resultado;