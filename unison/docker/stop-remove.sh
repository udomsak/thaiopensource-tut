#!/bin/bash 

fig stop central 
fig stop node2
fig stop node3

fig rm central
fig rm node2
fig rm node3


#docker stop $(docker ps -aq)
#docker rm $(docker ps -aq)

