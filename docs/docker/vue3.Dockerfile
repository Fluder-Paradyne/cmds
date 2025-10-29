FROM node:lts as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build:production

FROM nginx:stable-alpine as runner
COPY --from=build-stage /app/dist /app
RUN apk add --no-cache bash

# Creating symbolic links for js and css files.
# So even if the files have a hash in their name, the links will always point to the latest version
RUN cd /app/js && for file in *.js *.js.gz; do ln -s "$file" "$(echo $file | sed -r 's/(.*\/)?(.+)\..+\.(js|js\.gz)/\2.\3/')"; done

EXPOSE 80
COPY nginx.conf /etc/nginx/nginx.conf
CMD ["nginx","-g","daemon off;"]