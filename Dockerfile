FROM debian:10-slim
RUN apt-get update -y && apt-get install -y g++
COPY main.cpp /
RUN g++ main.cpp
