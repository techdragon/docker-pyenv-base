FROM ubuntu

RUN apt-get update && \
apt-get install -y curl git-core && \
apt-get install -y libssl-dev libreadline-dev libbz2-dev libsqlite3-dev && \
apt-get build-dep -y python
RUN ["/bin/bash", "-c", "curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash"]
RUN ["/bin/bash", "-c", "/root/.pyenv/bin/pyenv install --list"]
