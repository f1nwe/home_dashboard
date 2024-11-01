FROM ruby:3.3.5

LABEL maintainer="Volodymyr Kaban"

ENV BUNDLE_PATH=/home/appuser/home_dashboard/.docker/.bundle

ARG APP_PATH=/home/appuser/home_dashboard

ARG APP_USER=appuser
ARG APP_UID=1002

ARG APP_GROUP=appgroup
ARG APP_GID=1002

RUN addgroup $APP_GROUP -gid $APP_GID -system
RUN adduser --home /home/appuser -system --shell /sbin/nologin --uid $APP_UID --ingroup $APP_GROUP $APP_USER

RUN mkdir -p $APP_PATH
RUN mkdir -p "$APP_PATH/.docker/.bundle"

RUN chown -R $APP_USER:$APP_GROUP $APP_PATH

WORKDIR $APP_PATH

USER $APP_USER

COPY --chown=$APP_USER:$APP_GROUP ./Gemfile* $APP_PATH/

COPY --chown=$APP_USER:$APP_GROUP . $APP_PATH

RUN bundle install --verbose

EXPOSE 3000
