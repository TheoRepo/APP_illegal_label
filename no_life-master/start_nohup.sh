#!/bin/bash

baseDirForScriptSelf=$(cd "$(dirname "$0")"; pwd)

nohup bash ${baseDirForScriptSelf}/start.sh > ${baseDirForScriptSelf}/runlog.log 2>&1 &
