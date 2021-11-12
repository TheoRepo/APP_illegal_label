source /etc/profile
source  ~/.bash_profile

sql_part="



insert overwrite table ga.interface_app_no_life_20210930 partition(mobile_id_end_no)
select 
a.mobile_id,
case 
when a.mobile_id='0' then '00'
when a.mobile_id='1' then '01'
when a.mobile_id='2' then '02'
when a.mobile_id='3' then '03'
when a.mobile_id='4' then '04'
when a.mobile_id='5' then '05'
when a.mobile_id='6' then '06'
when a.mobile_id='7' then '07'
when a.mobile_id='8' then '08'
when a.mobile_id='9' then '09'
else substring(a.mobile_id,-2,2) 
end as mobile_id_end_no
from 
ga.interface_all_mobile_id_20210930 a
left join
ga.interface_app_life_20210930 b
on a.mobile_id = b.mobile_id where b.mobile_id is null;


"

cd /home/ga/ && bash spark_sql.sh "app" "$sql_part"



if [[ $? != 0 ]];then
    echo "sql 运行失败！！！！！！"
    exit 1
fi
echo 数据写入完成
