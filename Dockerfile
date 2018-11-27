FROM node:carbon-alpine

WORKDIR /app

RUN yarn global add @vue/cli

EXPOSE 8000
EXPOSE 8080

CMD ["vue", "ui", "--headless", "--host", "0.0.0.0", "--port", "8000"]
