# This file is generated by Nx.
#
# Build the docker image with `npx nx docker-build api-sv`.
# Tip: Modify "docker-build" options in project.json to change docker build args.
#
# Run the container with `docker run -p 3000:3000 -t api-sv`.
FROM docker.io/node:lts-alpine

ENV HOST=0.0.0.0
ENV PORT=3000

WORKDIR /app

RUN addgroup --system api-sv && \
          adduser --system -G api-sv api-sv

COPY dist/api-sv api-sv/
RUN chown -R api-sv:api-sv .

# You can remove this install step if you build with `--bundle` option.
# The bundled output will include external dependencies.
RUN npm --prefix api-sv --omit=dev -f install

CMD [ "node", "api-sv" ]
