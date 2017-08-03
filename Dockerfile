FROM alpine:3.6 AS git_clone 

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh
RUN git clone https://github.com/atilika/kuromoji-server.git /usr/src/app && \
    cd /usr/src/app && \
    rm -Rf .git

FROM alpine:3.6
COPY --from=git_clone /usr/src/app /usr/src/app
