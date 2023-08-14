FROM node:15
WORKDIR /app
COPY package.json .

ARG NODE_ENV
RUN if [ "NODE_ENV" = "production" ]; \
        then npm install; \
        else npm install --only-production; \
        fi

COPY . ./
ENV PORT 3000
EXPOSE $PORT
CMD ["node", "index.js"]