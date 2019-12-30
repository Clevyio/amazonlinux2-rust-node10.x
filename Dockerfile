FROM amazonlinux:latest

# Install rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain stable && \
    PATH="/root/.cargo/bin:$PATH" rustup install stable
ENV PATH $PATH:/root/.cargo/bin

# Install node
RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash - && \
  yum install -y nodejs && yum clean all

# Install rust-related dependencies
RUN yum install -y make gcc gcc-c++ libgcc openssl-devel readline-devel sqlite-devel \
  && yum clean all

