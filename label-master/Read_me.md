# 黑框中代码的开发思路
1.首先画数据地图，梳理数据源，中间表，目标表

2.然后在sublime中写SQL，不确定的代码可以取beeline或者datawork中试错

3.然后组合任务拆解后的代码，在gitlab上编辑shell脚本，形成数据流

4.分区数据源中数据量上亿的大表，摘取样例数据，用于测试数据流的代码，查看结果表是否满足开发需求，以验证自己的代码的正确性

5.切换真实数据源，开始跑数



注意：建表语句单独一个shell脚本，使用beeline建ORC格式的表，包含SQL的shell中最多同时跑2行SQL，使用spark_sql跑批量任务



后台运行脚本

nohup bash start.sh > /home/qianyu/app_v2/temp/runlog.log 2>&1 & 

tail -10 runlog.log

