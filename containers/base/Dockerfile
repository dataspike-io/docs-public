FROM sbtscala/scala-sbt:17.0.2_1.7.1_3.1.3

COPY . tmp_app

RUN cd tmp_app && \
    sbt "themis/update" && cd .. && rm -rf tmp_app

COPY project/* /project/

