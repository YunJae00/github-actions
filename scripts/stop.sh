#!/usr/bin/env bash

# 애플리케이션 경로 설정
PROJECT_ROOT="/home/ubuntu/app"
JAR_FILE="$PROJECT_ROOT/build/libs/github-actions-0.0.1-SNAPSHOT.jar"
DEPLOY_LOG="$PROJECT_ROOT/deploy.log"

TIME_NOW=$(date +%c)

# 현재 구동 중인 애플리케이션 PID 확인
CURRENT_PID=$(pgrep -f $JAR_FILE)

# 프로세스가 실행 중이면 종료
if [ -z "$CURRENT_PID" ]; then
  echo "$TIME_NOW > 현재 실행 중인 애플리케이션이 없습니다." >> $DEPLOY_LOG
else
  echo "$TIME_NOW > 실행 중인 애플리케이션(PID: $CURRENT_PID)을 종료합니다." >> $DEPLOY_LOG
  kill -15 $CURRENT_PID
  sleep 5

  # 프로세스가 정상적으로 종료되었는지 확인
  CURRENT_PID=$(pgrep -f $JAR_FILE)
  if [ -z "$CURRENT_PID" ]; then
    echo "$TIME_NOW > 애플리케이션이 성공적으로 종료되었습니다." >> $DEPLOY_LOG
  else
    echo "$TIME_NOW > 애플리케이션 종료에 실패했습니다." >> $DEPLOY_LOG
    exit 1
  fi
fi
