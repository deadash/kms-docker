FROM alpine
LABEL maintainer="edsky <dead.ash@hotmail.com>"

ENV PORT 1688
RUN set -ex \
    && mkdir kms \
    && wget https://github.com/Wind4/vlmcsd/releases/download/svn1111/binaries.tar.gz \
    && tar -xzvf binaries.tar.gz \
    && cd binaries/Linux/intel/static/ \
    && cp -rf vlmcsd-x64-musl-static /kms/ \
    && rm -rf /binaries*

WORKDIR /kms
CMD ./vlmcsd-x64-musl-static -Dev
EXPOSE $PORT
