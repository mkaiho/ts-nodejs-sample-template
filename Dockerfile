FROM node:13.13.0-buster as builder
WORKDIR /home/work/ts-nodejs-sample-template
COPY ./package.json /home/work/ts-nodejs-sample-template
COPY ./yarn.lock /home/work/ts-nodejs-sample-template
COPY ./.eslintrc.json /home/work/ts-nodejs-sample-template
COPY ./.eslintignore /home/work/ts-nodejs-sample-template
COPY ./.prettierrc /home/work/ts-nodejs-sample-template
COPY ./tsconfig.json /home/work/ts-nodejs-sample-template
COPY ./scripts /home/work/ts-nodejs-sample-template/scripts
COPY ./src /home/work/ts-nodejs-sample-template/src
RUN yarn
RUN yarn build

FROM node:13.13.0-buster
WORKDIR /home/ts-nodejs-sample-template
COPY --from=builder \
/home/work/ts-nodejs-sample-template/package.json \
/home/ts-nodejs-sample-template
COPY --from=builder \
/home/work/ts-nodejs-sample-template/node_modules \
/home/ts-nodejs-sample-template/node_modules
COPY --from=builder \
/home/work/ts-nodejs-sample-template/dist \
/home/ts-nodejs-sample-template/dist
CMD ["yarn", "start"]