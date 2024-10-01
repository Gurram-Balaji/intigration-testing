#!/bin/bash
java -jar /server.jar &
java -javaagent:/agent.jar=address=localhost,port=6300,output=tcpclient -jar /app.jar
