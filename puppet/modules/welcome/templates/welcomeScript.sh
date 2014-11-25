#!/bin/bash
# Welcome script for web developers

firefox http://$(sudo docker inspect -f "{{.NetworkSettings.IPAddress}}" webServer)
