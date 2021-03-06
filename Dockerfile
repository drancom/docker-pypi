FROM codekoala/saltyarch
MAINTAINER Josh VanderLinden <codekoala@gmail.com>

RUN pacman -Sy --noconfirm --needed python-pip python-passlib && pip install -U pypiserver && mkdir -p /srv/pypi && rm -rf /var/cache/pacman/*

EXPOSE 80
VOLUME ["/srv/pypi"]

CMD ["pypi-server", "--port", "80", "--passwords", "/srv/pypi/.htpasswd", "/srv/pypi"]
