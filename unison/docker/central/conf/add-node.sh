#!/bin/bash 

serf join $(grep 172 /etc/hosts |awk '{print $2}')

$(exit 0)
