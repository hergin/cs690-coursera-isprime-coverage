FROM ubuntu:24.10

RUN \
    apt-get update && \
    apt-get install -y dotnet-sdk-8.0 && \
    apt-get install -y git

WORKDIR /home/ubuntu

RUN \
    git clone https://github.com/hergin/dotnet-test-with-coverage

CMD ["bash"]