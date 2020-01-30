-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Cuente la cantidad de personas nacidas por año.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

v = FOREACH u GENERATE $3,ToDate($3,'yyyy-MM-dd');
w = FOREACH v GENERATE $0, GetYear($1);
y = GROUP w BY $1;
z = FOREACH y GENERATE $0, COUNT(w);

STORE z INTO 'output' USING PigStorage(',');