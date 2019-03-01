FROM node:8.15

COPY . /app

WORKDIR /app

RUN npm install

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
