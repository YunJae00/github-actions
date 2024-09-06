#!/usr/bin/env bash

# 삭제할 파일 경로
TARGET_DIR="/home/ubuntu/app/scripts"

# 기존 파일 삭제
if [ -f "$TARGET_DIR/start.sh" ]; then
  rm "$TARGET_DIR/start.sh"
fi

if [ -f "$TARGET_DIR/stop.sh" ]; then
  rm "$TARGET_DIR/stop.sh"
fi
