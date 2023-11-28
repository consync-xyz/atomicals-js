#!/bin/bash

# 检查是否提供了会话数量作为参数
if [ $# -eq 0 ]; then
    echo "Usage: $0 <number-of-screens>"
    exit 1
fi

# 获取要创建的screen会话数量
num_screens=$1

# 创建指定数量的screen会话并发送命令
for i in $(seq 1 $num_screens); do
    session_name="atom$i"
    screen -dmS $session_name
    screen -S $session_name -X stuff "yarn cli mint-dft electron --satsbyte 35^M"
done

echo "启动了 $num_screens 个screen会话。"
