-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

file = LOAD 'data.tsv' AS (f1: CHARARRAY, f2: BAG{t:(p:CHARARRAY)});
letras = FOREACH file GENERATE f1, FLATTEN(f2);
letras2 = FOREACH letras GENERATE p;
grouped = GROUP letras2 BY p;
wordcount = FOREACH grouped GENERATE group, COUNT(letras2);
STORE wordcount INTO 'output';
