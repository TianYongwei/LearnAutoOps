#!/bin/bash

ps -ef|grep xhwDataCenter.jar | grep -v "grep" | awk '{print $2}' | xargs kill -9