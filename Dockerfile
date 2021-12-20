FROM rust:1.52.1-buster as build-image

ARG OPENETHEREUM="openethereum-3.x"
ARG WORKDIR="/usr/src/dmdv4-testnet"

WORKDIR ${WORKDIR}
COPY . .
RUN apt-get update \
    && apt-get install -y cmake
RUN git clone https://github.com/DMDcoin/${OPENETHEREUM}.git
RUN cd ${OPENETHEREUM} \
    && cargo build --release --all

FROM debian:buster-slim as run-image
ARG OPENETHEREUM="openethereum-3.x"
ARG WORKDIR="/usr/src/dmdv4-testnet"
WORKDIR ${WORKDIR}
COPY . .
COPY --from=build-image \
    ${WORKDIR}/${OPENETHEREUM}/target/release/openethereum \
    ${WORKDIR}/${OPENETHEREUM}/target/release/dmd \
    /usr/local/bin/
RUN pwd \
    && ls -lar \
    && ls -lar /usr/local/bin/
# CMD ["openethereum", "--no-discovery -c=validator_node.toml"]
CMD ["openethereum", "-c=fullnode.toml"]
