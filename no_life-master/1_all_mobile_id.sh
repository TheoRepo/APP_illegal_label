source /etc/profile
source  ~/.bash_profile

sql_part="

insert overwrite table ga.interface_all_mobile_id_20210930 partition(mobile_id_end_no)
select 
mobile_id, 
case 
when mobile_id='0' then '00'
when mobile_id='1' then '01'
when mobile_id='2' then '02'
when mobile_id='3' then '03'
when mobile_id='4' then '04'
when mobile_id='5' then '05'
when mobile_id='6' then '06'
when mobile_id='7' then '07'
when mobile_id='8' then '08'
when mobile_id='9' then '09'
else substring(a.mobile_id,-2,2) 
end as mobile_id_end_no
from (select mobile_id from profile.dws_app_all_20210530 group by mobile_id) a;


"

cd /home/ga/ && bash spark_sql.sh "app" "$sql_part"



if [[ $? != 0 ]];then
    echo "sql 运行失败！！！！！！"
    exit 1
fi
echo 数据写入完成
