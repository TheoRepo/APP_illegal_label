#!/bin/bash

baseDirForScriptSelf=$(cd "$(dirname "$0")"; pwd)

nohup bash ${baseDirForScriptSelf}/sh 7_rlt_statistic_ga.interface_app_individual_percent_20210930_1.sh 2021-11-06 > ${baseDirForScriptSelf}/runlog.log 2>&1 &
nohup bash ${baseDirForScriptSelf}/sh 7_rlt_statistic_ga.interface_app_individual_percent_20210930_2.sh 2021-11-07 > ${baseDirForScriptSelf}/runlog.log 2>&1 &