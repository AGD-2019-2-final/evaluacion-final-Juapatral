-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

file = LOAD 'data.tsv' AS (f1: CHARARRAY, f2: BAG{t:(p:CHARARRAY)}, f3: MAP[]);
prueba2 = FOREACH file GENERATE f1, SIZE(f2) as f4, SIZE(f3) as f5;
prueba3 = ORDER prueba2 BY f1, f4, f5;
STORE prueba3 INTO 'output' USING PigStorage(',');