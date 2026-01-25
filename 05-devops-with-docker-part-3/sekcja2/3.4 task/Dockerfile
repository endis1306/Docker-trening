FROM docker:27-cli

RUN apk add --no-cache git bash

WORKDIR /builder

COPY builder.sh /builder/builder.sh
RUN chmod +x /builder/builder.sh

ENTRYPOINT ["/builder/builder.sh"]
