FROM node:19.9.0

WORKDIR /frontend

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3080

CMD ["npm", "run", "dev"]