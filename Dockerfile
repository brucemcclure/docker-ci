# Build phase
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html

# "--from=0" refers to the "0 phase"
# "/app/build" refers to the dir we want to copy
# "/usr/share/nginx/html" refers to the dir we want to copy to