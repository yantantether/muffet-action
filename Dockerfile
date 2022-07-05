# Container image that runs your code
FROM raviqqe/muffet 

RUN apk add bash

ENTRYPOINT ["entrypoint.sh"]

