inputFile = LOAD 'hdfs:///user/sumandagar/inputs' USING PigStorage('\t') AS (name:chararray,dial:chararray);
ranked=RANK inputFile;
ranked_lines=FILTER ranked BY (rank_inputFile >2);
groupByName = group inputFile BY name;
names = FOREACH groupByName GENERATE $0 as name, COUNT($1) as no_of_lines;
result = ORDER names BY no_of_lines DESC;
STORE result INTO 'hdfs:///user/sumandagar/PigProjectOutput';
