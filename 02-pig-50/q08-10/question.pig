-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
file = LOAD 'data.tsv' AS (f1: CHARARRAY, f2: BAG{t:(p:CHARARRAY)}, f3: MAP[]);
prueba8 = FOREACH file GENERATE FLATTEN(f2) as f4, FLATTEN(KEYSET(f3)) as f5;
grouped = GROUP prueba8 BY (f4, f5);
wordcount = FOREACH grouped GENERATE group, COUNT(prueba8);
STORE wordcount INTO 'output';