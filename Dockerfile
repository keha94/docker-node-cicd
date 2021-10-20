FROM amazonlinux
# Make able to install Node 10 from upstream
# Install Python3.7 and Python2.7 with pip and devel
# Install GCC, Make, NodeJS and findutils
# Clean-up after ourselves
RUN curl --silent --location https://rpm.nodesource.com/setup_10.x | bash - && \
  yum install -y gcc-c++ make nodejs findutils git tar unzip && \
  yum clean all && rm -rf /var/cache/yum

# Install/upgrade pip, pipenv for both Python 2.7 and Python 3.7

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  ./aws/install && \
  rm -rf ./aws