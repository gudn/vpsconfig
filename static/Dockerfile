FROM gudn/lux:1.0.0 as builder

RUN rm -rf /projects/*
COPY ./projects /projects
COPY ./nginx.conf /templates/nginx.conf

RUN /bin/lux -o /config

FROM nginx:1.21-alpine

COPY --from=builder /config /config
COPY --from=builder /projects /projects

CMD ["nginx", "-c", "/config/nginx.conf", "-g", "daemon off;"]
