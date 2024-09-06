#!/usr/bin/env bash

# Java 환경 변수 설정 (필요에 따라 수정)
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

# 애플리케이션 경로 및 로그 경로 설정
PROJECT_ROOT="/home/ubuntu/app"
JAR_FILE="$PROJECT_ROOT/build/libs/github-actions-0.0.1-SNAPSHOT.jar"

APP_LOG="$PROJECT_ROOT/application.log"
ERROR_LOG="$PROJECT_ROOT/error.log"
DEPLOY_LOG="$PROJECT_ROOT/deploy.log"

TIME_NOW=$(date +%c)

# JAR 파일이 있는지 확인
if [ ! -f "$JAR_FILE" ]; then
  echo "$TIME_NOW > $JAR_FILE 파일이 존재하지 않습니다." >> $DEPLOY_LOG
  exit 1
fi

echo "$TIME_NOW > $JAR_FILE 파일 실행 시작" >> $DEPLOY_LOG

# JAR 파일 실행
nohup java -jar $JAR_FILE > $APP_LOG 2> $ERROR_LOG &

# 실행된 프로세스 ID 확인
CURRENT_PID=$(pgrep -f $JAR_FILE)

if [ -z "$CURRENT_PID" ]; then
  echo "$TIME_NOW > 애플리케이션이 시작되지 않았습니다." >> $DEPLOY_LOG
  exit 1
else
  echo "$TIME_NOW > 애플리케이션이 성공적으로 시작되었습니다. PID: $CURRENT_PID" >> $DEPLOY_LOG
fi
