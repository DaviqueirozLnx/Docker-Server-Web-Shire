FROM ubuntu:latest AS build

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
	binutils \
	libboost-all-dev \
	build-essential \
	clang \
	cmake \
	libfmt-dev \
	gcc \
	libgmp-dev \
	libluajit-5.1-dev \
	make \
	mariadb-client libmariadb-dev \
	libpugixml-dev \
	git \
	zip \
	ca-certificates \
	pkg-config \
	autoconf \
	libmariadb-dev-compat \
	libboost-date-time-dev \
	libboost-filesystem-dev \
	libboost-system-dev \
	libboost-iostreams-dev \
	libcrypto++-dev \
	ninja-build \
	&& apt-get clean

ENV CMAKE_PREFIX_PATH="/usr/include/cryptopp"

COPY cmake /usr/src/forgottenserver/cmake/
COPY src /usr/src/forgottenserver/src/
COPY CMakeLists.txt /usr/src/forgottenserver/

WORKDIR /usr/src/forgottenserver/build
RUN cmake -G Ninja .. && ninja

FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
	libboost-all-dev \
	libfmt-dev \
	libgmp-dev \
	libluajit-5.1-dev \
	mariadb-client libmariadb-dev \
	libpugixml-dev \
	libmariadb-dev-compat \
	libboost-date-time-dev \
	libboost-filesystem-dev \
	libboost-system-dev \
	libboost-iostreams-dev \
	libcrypto++-dev \
	&& apt-get clean

# Copiar o binário compilado do estágio anterior para o contêiner
COPY --from=build /usr/src/forgottenserver/build/tfs /bin/tfs

COPY Server/data /srv/data/
COPY Server/config.lua /srv/
COPY LICENSE README.md *.dist *.lua *.sql key.pem /srv/

# Expor as portas necessárias para o serviço
EXPOSE 7171 7172

# Definir o diretório de trabalho
WORKDIR /srv

# Montar /srv como um volume para persistência de dados
VOLUME /srv

# Definir o ponto de entrada para o contêiner
ENTRYPOINT ["/bin/tfs"]
