FROM node:carbon-alpine

VOLUME [ "/home/node", "/app" ]
WORKDIR /app

EXPOSE 8000
EXPOSE 8080

RUN yarn global add @vue/cli

ENTRYPOINT [ "vue" ]
CMD [ "ui", "--headless", "--host", "0.0.0.0", "--port", "8000" ]
