FROM socrata/base

WORKDIR /srv/cubism-intro-master

# dependencies
RUN apt-get install -y --force-yes -qq python python-setuptools python-distribute python-pip python-dev git wget unzip
RUN pip install flask

# Some paths/locations we care about
ENV APP_ROOT /srv/cubism-intro-master

# get code
RUN cd /tmp && \
    wget https://github.com/ravaa/cubism-intro/archive/master.zip && \
    unzip /tmp/master.zip -d /srv


# prep data
RUN echo "Fetching data.." && python3 fetcher.py

ADD ship.d /etc/ship.d

EXPOSE 5000
