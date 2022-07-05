# Container image that runs your code
FROM raviqqe/muffet 

RUN apk add bash

COPY entrypoint.sh /bin

ENTRYPOINT ["/bin/entrypoint.sh"]
