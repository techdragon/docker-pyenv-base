FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

# RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02docker-force-unsafe-io
# RUN echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/docker-no-httpcache
# RUN echo 'Acquire::Languages "none";' > /etc/apt/apt.conf.d/docker-no-languages
# RUN echo 'DPkg::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' > /etc/apt/apt.conf.d/docker-clean
# RUN echo 'APT::Update::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' >> /etc/apt/apt.conf.d/docker-clean
# RUN echo 'Dir::Cache::pkgcache ""; Dir::Cache::srcpkgcache "";' >> /etc/apt/apt.conf.d/docker-clean
# RUN echo 'Acquire::GzipIndexes "true"; Acquire::CompressionTypes::Order:: "gz";' > /etc/apt/apt.conf.d/docker-gzip-indexes

RUN apt-get update && \
apt-get install -y --no-install-recommends curl ca-certificates git mercurial && \
apt-get build-dep -y python2.7 python3.4

RUN curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

ENV PYTHONDONTWRITEBYTECODE true
ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN echo 'export PYENV_ROOT="/root/.pyenv"' >> /etc/profile
RUN echo 'export PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"' >> /etc/profile
RUN echo 'eval "$(pyenv init -)"' >> /etc/profile
RUN echo 'eval "$(pyenv virtualenv-init -)"' >> /etc/profile

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

# RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# RUN (echo 'export PYENV_ROOT="/root/.pyenv"'; echo 'export PATH="$PYENV_ROOT/bin:$PATH"'; echo 'eval "$(pyenv init -)"') >> /etc/profile

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get clean
RUN apt-get purge

