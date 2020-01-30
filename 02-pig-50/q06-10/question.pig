-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

file = LOAD 'data.tsv' 
AS (f1: CHARARRAY, f2: CHARARRAY, f3: MAP[]);
letras = FOREACH file GENERATE f1, FLATTEN(KEYSET(f3)) AS f4;
letras2 = FOREACH letras GENERATE f4;
grouped = GROUP letras2 BY f4;
wordcount = FOREACH grouped GENERATE group, COUNT(letras2);
STORE wordcount INTO 'output' USING PigStorage(',');
