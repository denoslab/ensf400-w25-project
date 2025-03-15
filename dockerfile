FROM alpine
RUN
COPY . /App/desktop_app
WORKDIR /App
CMD