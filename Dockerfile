FROM socrata/base

WORKDIR /srv/cubism-intro

# dependencies
RUN apt-get install -y --force-yes -qq python python-setuptools python-distribute python-pip python-dev git
RUN pip install flask

# Some paths/locations we care about
ENV APP_ROOT /srv/cubism-intro

# get code
RUN cd /srv && \
    git clone https://github.com/ravaa/cubism-intro.git

# prep data
RUN python3 fetcher.py

ADD ship.d /etc/ship.d

EXPOSE 5000
