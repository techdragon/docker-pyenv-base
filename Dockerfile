FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
apt-get install -y --no-install-recommends curl git mercurial && \
apt-get build-dep -y python2.7 python3.4

RUN curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

ENV PYTHONDONTWRITEBYTECODE true
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN echo 'eval "$(pyenv init -)"' >  /$(whoami)/.bash_profile
RUN echo 'eval "$(pyenv virtualenv-init -)"' > /$(whoami)/.bash_profile

RUN pyenv update

RUN pyenv install --list

# RUN ["/bin/bash", "-c", "curl -k -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash"]
# RUN ["/bin/bash", "-c", "echo \"export PATH=\"$HOME/.pyenv/bin:$PATH\"\" >> /root/.bash_profile"]
# RUN ["/bin/bash", "-c", "echo \"eval \"$(pyenv init -)\"\" >> /root/.bash_profile"]
# RUN ["/bin/bash", "-c", "echo \"eval \"$(pyenv virtualenv-init -)\"\" >> /root/.bash_profile"]
# RUN ["/bin/bash", "-c", "/root/.pyenv/bin/pyenv install --list"]

# ENV PYTHONDONTWRITEBYTECODE true
# ENV PYENV_ROOT $HOME/.pyenv
# ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
