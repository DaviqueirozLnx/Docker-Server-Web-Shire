# Usa a imagem oficial do Ubuntu como base
FROM ubuntu:20.04

# Definir variável de ambiente para evitar prompts interativos durante a instalação
ENV DEBIAN_FRONTEND=noninteractive

# Atualizar o apt e instalar dependências necessárias
RUN apt-get update && apt-get install -y \
	software-properties-common \
	curl \
	gnupg2 \
	ca-certificates \
	lsb-release \
	&& add-apt-repository ppa:ondrej/php \
	&& apt-get update \
	&& apt-get install -y \
	bash \
	nginx \
	php8.3 \
	php8.3-fpm \
	php8.3-bcmath \
	php8.3-curl \
	php8.3-dom \
	php8.3-gd \
	php8.3-mbstring \
	php8.3-mysql \
	php8.3-pdo \
	php8.3-xml \
	php8.3-cli \
	php8.3-opcache \
	mariadb-client \
	&& rm -rf /var/lib/apt/lists/*

# Configurar PHP-FPM
RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php/8.3/fpm/php.ini

# Copiar a configuração do Nginx
# COPY ./default /etc/nginx/sites-available/default

# Copiar os arquivos da pasta local 'files' para o diretório do Nginx
COPY ./ /var/www/html
RUN chmod 777 -R /var/www/html
RUN chmod -R 777 /var/www/html /var/www/html/engine /var/www/html/outfitAndItems

# Expor as portas 80 para o Nginx e 9000 para o PHP-FPM
EXPOSE 80 9000

# Iniciar o PHP-FPM e o Nginx em um único processo
CMD service php8.3-fpm start && nginx -g "daemon off;"
