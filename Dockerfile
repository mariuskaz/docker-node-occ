FROM ubuntu

RUN sudo apt-get update -y
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
RUN sudo apt-get install nodejs
RUN sudo apt-get install cmake cmake-curses-gui g++ build-essential libtbb2
RUN sudo apt-get install cmake cmake-curses-gui g++ build-essential libtbb2
RUN sudo npm install node-gyp -g;sudo npm install node-pre-gyp -g
RUN sudo npm install mocha -g;sudo npm install graceful-fs -g
RUN sudo apt-get install cmake cmake-curses-gui g++ build-essential libtbb2
RUN git clone --recursive https://github.com/erossignon/node-occ.git; cd node-occ
RUN sudo ./prepare_node.sh
RUN node-gyp configure
RUN node-gyp build
RUN sudo npm install --build-from-source

WORKDIR .
