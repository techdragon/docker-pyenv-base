FROM ubuntu

RUN apt-get update && \
apt-get install -y --no-install-recommends curl && \
apt-get install -y --no-install-recommends git-core && \
apt-get install -y --no-install-recommends mercurial && \
apt-get install -y --no-install-recommends libssl-dev && \
apt-get install -y --no-install-recommends libreadline-dev && \
apt-get install -y --no-install-recommends libbz2-dev && \
apt-get install -y --no-install-recommends libsqlite3-dev && \
apt-get build-dep -y --no-install-recommends python
RUN ["/bin/bash", "-c", "curl -k -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash"]
RUN ["/bin/bash", "-c", "/root/.pyenv/bin/pyenv install --list"]
