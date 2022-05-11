FROM ubuntu:18.04
WORKDIR /home/
COPY /testscripts ./team_b_scripts
RUN chmod +x team_b_scripts/puppetmaster.sh
RUN chmod +x team_b_scripts/puppet.sh
RUN apt-get update
VOLUME [ "/team_b_scripts" ]
CMD [ "/bin/bash" ]