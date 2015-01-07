from ubuntu:14.04

RUN apt-get update 
RUN apt-get install -y wget dnsutils dnsmasq dnsmasq-base dns-browse ocaml-core build-essential python unzip python-setuptools incron supervisor && wget -c "http://www.seas.upenn.edu/~bcpierce/unison/download/releases/stable/unison-2.48.3.tar.gz"  
RUN easy_install pip  && pip install pyinotify 
RUN tar xvfz unison-2.48.3.tar.gz && cd unison-2.48.3 && make && find . -maxdepth 1 -executable -type f -exec mv -v {} /usr/bin/ \;  
RUN rm -Rvf /unison-2.48.3.tar.gz && rm -f unison-2.48.3.tar.gz
RUN wget -c "https://dl.bintray.com/mitchellh/serf/0.6.3_linux_amd64.zip" && \
    unzip 0.6.3_linux_amd64.zip && \
    mv serf /usr/bin/
RUN mkdir -p /srv/server /srv/data /etc/serf/handlers

#Add configuration file folder on docker container 
ADD conf /conf 
#Copy supervisor services config file 
RUN cp /conf/*.conf /etc/supervisor/conf.d/

#Copy dnsmasq configuration and Serf configuration to correct folder
RUN rm /etc/dnsmasq.conf 
RUN cp -v /conf/serf/dnsmasq.conf  /etc/dnsmasq.conf
RUN cp -v /conf/serf/dnsmasq.json /etc/serf/
RUN cp -v /conf/serf/dnsmasq-member-join  /etc/serf/handlers 
RUN chmod +x /etc/serf/handlers/dnsmasq-member-join
RUN apt-get clean 

#EXPOSE 8000 for tiny webserver use for testing file upload.
#EXPOSE 8080 for dummy port that up to you want to usage. 
#EXPOSE 9999 for dummy port that up to you want to usage.
#EXPORT 7654 for unison default port.


EXPOSE 8000 8080 9999 7654 
CMD [ "supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
