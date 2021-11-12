source /etc/profile
source  ~/.bash_profile

sql_part="

create table if not exists ga.interface_all_mobile_id_20210930
(
mobile_id string comment '手机号'
)
comment '手机号总量'
partitioned by (
mobile_id_end_no string comment '手机尾号'
)
row format delimited fields terminated by '\t' stored as orc;


create table if not exists ga.interface_app_life_20210930
(
mobile_id string comment '手机号'
)
comment '有生活类APP的手机号'
partitioned by (
mobile_id_end_no string comment '手机尾号'
)
row format delimited fields terminated by '\t' stored as orc;



create table if not exists ga.interface_app_no_life_20210930
(
mobile_id string comment '手机号'
)
comment '无生活类APP的手机号'
partitioned by (
mobile_id_end_no string comment '手机尾号'
)
row format delimited fields terminated by '\t' stored as orc;

"

cd /home/ga/ && bash beeline.sh -e "$sql_part"



if [[ $? != 0 ]];then
    echo "sql 运行失败！！！！！！"
    exit 1
fi
echo 数据写入完成
