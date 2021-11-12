#!/bin/bash

baseDirForScriptSelf=$(cd "$(dirname "$0")"; pwd)

bash ${baseDirForScriptSelf}/0_create_table.sh
bash ${baseDirForScriptSelf}/1_count_by_mobile_id.sh
bash ${baseDirForScriptSelf}/2_count_strategy.sh
bash ${baseDirForScriptSelf}/3_count_life.sh
bash ${baseDirForScriptSelf}/4_percent.sh
bash ${baseDirForScriptSelf}/5_one_month.sh
bash ${baseDirForScriptSelf}/6_three_month.sh
