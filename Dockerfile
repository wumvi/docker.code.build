FROM wumvi/php.base:7.1
MAINTAINER Vitaliy Kozlenko <vk@wumvi.com>

LABEL version="2.3.4" php="7.1"

ADD /cmd/*.sh  /
ADD /ssh/config  /root/.ssh/config

RUN DEBIAN_FRONTEND=noninteractive && \
    # fix bug with java
    mkdir -p /usr/share/man/man1 && \
    apt-get update && \
    apt-get --no-install-recommends -qq -y install gnupg wget build-essential zip unzip vim ca-certificates openssl ssh git cmake lsb-release apt-transport-https -y && \
	apt-get --no-install-recommends -qq -y install default-jre && \
	curl -sL https://deb.nodesource.com/setup_9.x | bash - && \
    apt-get --no-install-recommends -qq -y install nodejs zopfli && \
    npm config set cache /tmp/cache/npm/ --global && \
	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
	mkdir -p /soft/ && \
	#
	cd /soft/ && \
	git clone https://github.com/google/brotli.git brotli --depth 1 && \
	cd brotli && \
	mkdir out && cd out && ../configure-cmake && make && \
	make test && \
	make install && \
	#
	cd /soft/ && \
	wget http://zlib.net/zlib-1.2.11.tar.gz && \
	tar -zxf zlib-1.2.11.tar.gz && \
	cd zlib-1.2.11 && \
	./configure && \
	make && \
	make install && \
	#
	cd / && \
	git clone https://github.com/wumvi/app.yandex-storage.git /yandex-storage/ --depth 1 && \
	cd /yandex-storage/ && \
	composer install --no-interaction --no-dev --no-progress --no-suggest --optimize-autoloader --prefer-dist --ignore-platform-reqs --no-plugins && \
	rm -rf .git && \
	#
	cd / && \
	git clone https://github.com/wumvi/app.gcc-webpack.git /gcc-webpack/ --depth 1 && \
	cd /gcc-webpack/ && \
	npm i && \
	composer install --no-interaction --no-dev --no-progress --no-suggest --optimize-autoloader --prefer-dist --ignore-platform-reqs --no-plugins && \
	rm -rf .git && \
	#
	cd / && \
	chmod u+x /*.sh && \
	#
	apt-get remove -y wget build-essential cmake  && \
	apt-get autoremove -y && \
	rm -rf /soft/ && \
	rm -rf /root/.composer/ && \
	rm -rf /root/.npm/ && \
	rm -rf /var/lib/apt/lists/* && \
	echo 'end'

WORKDIR /code/
