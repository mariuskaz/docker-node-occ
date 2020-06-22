FROM node:12
RUN apt-get update -y
RUN apt-get install cmake cmake-curses-gui g++ build-essential libtbb2 -y
RUN git clone --recursive https://github.com/erossignon/node-occ.git
WORKDIR /node-occ
RUN npm install node-pre-gyp -g
RUN npm install mocha -g
RUN ./prepare_node.sh
RUN npm install --build-from-source
RUN node-pre-gyp configure
RUN node-pre-gyp -v rebuild
RUN node ./index.js
