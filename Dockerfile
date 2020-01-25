FROM node:lts-alpine

VOLUME [ "/home/node", "/app" ]
WORKDIR /app

EXPOSE 8000
EXPOSE 8080

RUN yarn global add @vue/cli
RUN yarn global add @vue/cli-service-global
RUN yarn global add @vue/cli-plugin-babel
RUN yarn global add @vue/cli-plugin-eslint
RUN yarn global add @vue/cli-service
RUN yarn global add babel-eslint
RUN yarn global add eslint
RUN yarn global add eslint-plugin-vue
RUN yarn global add vue-template-compiler
RUN yarn global add vuex
RUN yarn global add vue-router

LABEL maintainer=jeudiprando@gmail.com
LABEL vue_cli_version=4.1.2
LABEL node_version=12.14.1
LABEL yarn_version=1.21.1

ENV VUE_CLI_VERSION=4.1.2

ENTRYPOINT [ "vue" ]
CMD [ "ui", "--headless", "--host", "0.0.0.0", "--port", "8000" ]
