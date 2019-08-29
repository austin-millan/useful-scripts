FROM codercom/code-server
# docker build -t your-code-server .

# Setup python3 env
RUN sudo apt-get update
RUN sudo apt-get install python3.7-dev python3-pip nano -y
RUN python3.7 -m pip install pip
RUN python3.7 -m pip install wheel

# Setup Golang env
RUN wget https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz -O /tmp/go.tar.gz
RUN sudo tar -C /usr/local -xzf /tmp/go.tar.gz
ENV PATH="/usr/local/go/bin:${PATH}"
RUN rm -rf /tmp.go.tar.gz

# Install dependencies
RUN pip3 install \
    virtualenv \
    pipenv \
    PyYAML \
    netaddr \
    autopep8 \
    flake8 \
    mypy \
    mypy-protobuf \
    pylint \
    docker \
    setuptools
# Install user-scripts
RUN sudo apt-get install -y \
    iptables \
    psmisc

# Install extensions
#RUN code-server --install-extension ms-python.python # fails
#RUN code-server --install-extension eamodio.gitlens # incompatible
RUN code-server --install-extension batisteo.vscode-django
RUN code-server --install-extension magicstack.magicpython
RUN code-server --install-extension tushortz.python-extended-snippets
RUN code-server --install-extension wholroyd.jinja
RUN code-server --install-extension ms-vscode.go
RUN code-server --install-extension zxh404.vscode-proto3
RUN code-server --install-extension seedess.vscode-remote-editor
RUN code-server --install-extension ms-vscode.vscode-typescript-tslint-plugin
RUN code-server --install-extension peterjausovec.vscode-docker
RUN code-server --install-extension mermade.openapi-lint
RUN code-server --install-extension redhat.vscode-yaml
RUN code-server --install-extension arjun.swagger-viewer

COPY . .
ENTRYPOINT ["dumb-init", "code-server"]
