FROM postgres as build

COPY words.sql /docker-entrypoint-initdb.d/
ENV POSTGRES_HOST_AUTH_METHOD=trust

FROM postgres

COPY --from=build /docker-entrypoint-initdb.d/words.sql /docker-entrypoint-initdb.d/
ENV POSTGRES_HOST_AUTH_METHOD=trust