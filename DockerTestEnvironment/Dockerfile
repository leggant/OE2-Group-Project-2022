FROM ubuntu:18.04
WORKDIR /home/
RUN rm -r team_b_scripts
RUN mkdir team_b_scripts
RUN cd team_b_scripts
COPY /testscripts ./team_b_scripts
RUN chmod +x team_b_scripts/*
VOLUME [ "/team_b_scripts" ]
RUN apt-get update
CMD [ "bash" ]