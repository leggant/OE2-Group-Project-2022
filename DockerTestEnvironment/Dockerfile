FROM ubuntu:18.04
WORKDIR /home/
RUN mkdir team_b_scripts
RUN cd team_b_scripts
COPY /testscripts ./team_b_scripts
RUN chmod +x team_b_scripts/*
RUN apt-get update
VOLUME [ "/testscripts", "/home/team_b_scripts" ]
#RUN /bin/bash ./team_b_scripts/puppet-master-install.sh
CMD [ "bash" ]