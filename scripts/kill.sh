#!/bin/bash

SERVICE1_PORT="${SERVICE1_PORT:-8081}"
SERVICE2_PORT="${SERVICE2_PORT:-8082}"
SERVICE3_PORT="${SERVICE3_PORT:-8083}"
SERVICE4_PORT="${SERVICE4_PORT:-8084}"

function kill_app_at_port() {
  kill -9 $(lsof -t -i:$1) && echo "Killed an app running on port [$1]" || echo "No app running on port [$1]"
}

kill `jps | grep "1.0.0.SLEUTH_DOCS.jar" | cut -d " " -f 1` || echo "No apps running"
kill `jps | grep "zipkin.jar" | cut -d " " -f 1` || echo "No zipkin running"
kill_app_at_port ${SERVICE1_PORT} || echo "Failed to kill service"
kill_app_at_port ${SERVICE2_PORT} || echo "Failed to kill service"
kill_app_at_port ${SERVICE3_PORT} || echo "Failed to kill service"
kill_app_at_port ${SERVICE4_PORT} || echo "Failed to kill service"
