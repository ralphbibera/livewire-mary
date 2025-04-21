FROM php:8.3.10

RUN echo "Acquire::http::Pipeline-Depth 0;" > /etc/apt/apt.conf.d/99custom && \
    echo "Acquire::http::No-Cache true;" >> /etc/apt/apt.conf.d/99custom && \
    echo "Acquire::BrokenProxy    true;" >> /etc/apt/apt.conf.d/99custom

# Initialization
RUN --mount=type=cache,target=/var/cache/apt \
    --mount=type=cache,target=/var/lib/apt/lists \
    # Update apt package list
    apt-get update && apt-get upgrade -y && \
    apt-get install -y --fix-missing \
    git \
    libpq-dev \
    openssl \
    unzip \
    zip \
    libzip-dev \
    p7zip-full \
    nodejs \
    npm \
    # Install Composer
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    # Install PHP extensions
    && docker-php-ext-install pdo pdo_pgsql zip \
    && docker-php-ext-enable zip \
    # Clean up to reduce image size
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

WORKDIR /app
COPY ./src /app

