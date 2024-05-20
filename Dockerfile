FROM node:18-alpine AS builder

ARG GOOGLE_ID=""
ARG GOOGLE_SECRET=""
ARG DATABASE_URL=""
ARG NEXTAUTH_SECRET=""
ARG NEXTAUTH_URL=""

WORKDIR /app
COPY ./prisma ./prisma
COPY package.json package.json
RUN yarn install
RUN npx prisma generate
COPY . .
RUN yarn build && yarn --production

FROM node:18-alpine
WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/public ./public
COPY --from=builder /app/prisma ./prisma
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/next.config.mjs ./next.config.mjs
COPY --from=builder /app/package.json ./package.json

ENV NODE_ENV production
EXPOSE 3000

CMD ["yarn", "run", "start"]