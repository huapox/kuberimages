FROM golang:1.11 as builder

WORKDIR /go/src/github.com/nvwa-io/nvwa-io/nvwa-agent
COPY . .
#RUN make dep
RUN pwd && ls -l && export
RUN go version
#RUN godep get
RUN GOPATH="/gopath" && go mod download

# final image
#FROM registry.opensource.zalan.do/stups/alpine:latest
#COPY --from=builder /go/src/github.com/kubernetes-incubator/external-dns/build/external-dns /bin/external-dns
#USER nobody
#ENTRYPOINT ["/bin/external-dns"]
