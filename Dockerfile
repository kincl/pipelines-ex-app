FROM docker.io/library/golang:1.19.2 as build

COPY . /pipelines-ex-app
WORKDIR /pipelines-ex-app

RUN go build -o pipelines-ex-app main.go

FROM docker.io/redhat/ubi8-minimal:latest

COPY --from=build /pipelines-ex-app/pipelines-ex-app /bin/pipelines-ex-app

CMD ["pipelines-ex-app"]
