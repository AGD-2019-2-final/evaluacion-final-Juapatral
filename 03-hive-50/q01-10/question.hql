-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Compute la cantidad de registros por cada letra de la columna 1.
-- Escriba el resultado ordenado por letra. 
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

DROP TABLE IF EXISTS data;

CREATE TABLE data (key STRING,
                   fecha DATE,
                   valor INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE data;

DROP TABLE IF EXISTS resultado;

CREATE TABLE resultado
AS
    SELECT
        key,
        count(*) regs
    FROM
        data
    GROUP BY key;
    
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
SELECT * FROM resultado;
