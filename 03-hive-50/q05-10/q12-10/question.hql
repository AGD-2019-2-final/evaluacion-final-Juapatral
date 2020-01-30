-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que compute la cantidad de registros por letra de la 
-- columna 2 y clave de la columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `a` en la columna 2 y la clave `aaa` en la 
-- columna 3 es:
--
--     a    aaa    5
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
DROP TABLE IF EXISTS t0;
CREATE TABLE t0 (
    c1 STRING,
    c2 ARRAY<CHAR(1)>, 
    c3 MAP<STRING, INT>
    )
    ROW FORMAT DELIMITED 
        FIELDS TERMINATED BY '\t'
        COLLECTION ITEMS TERMINATED BY ','
        MAP KEYS TERMINATED BY '#'
        LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'data.tsv' INTO TABLE t0;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

DROP TABLE IF EXISTS detail;
CREATE TABLE detail
AS
    SELECT
        key AS letters,
        letter
    FROM (
        SELECT
            letter,
            c3
        FROM
            t0
        LATERAL VIEW
            explode(c2) t0 AS letter
    ) t0
    LATERAL VIEW
        explode(c3) t0
;


DROP TABLE IF EXISTS answer;
CREATE TABLE answer
AS
    SELECT letter, letters, COUNT(*) FROM detail 
    GROUP BY letter, letters
    ORDER BY letter, letters
; 

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
SELECT * FROM answer;

