FROM rust:1.63.0

RUN USER=root cargo new --bin app

WORKDIR /app

RUN apt update && apt install lld clang -y

COPY ./Cargo.toml ./Cargo.toml
RUN touch ./src/lib.rs
RUN cargo build --release
RUN rm src/*.rs

ENV SQLX_OFFLINE true
ENV APP_ENVIRONMENT production

ADD . ./
RUN rm ./target/release/deps/actix_demo*
RUN cargo build --release

ENTRYPOINT ["./target/release/actix_demo"]