#!/bin/bash
aws ecs register-task-definition  --region "us-east-1" --family "file360" --container-definitions "[{\"name\":\"sleep\",\"image\":\"busybox\",\"cpu\":10,\"command\":[\"sleep\",\"360\"],\"memory\":10,\"essential\":true}]" --network-mode "awsvpc"   --requires-compatibilities "FARGATE" --cpu "512" --memory "1024" 
