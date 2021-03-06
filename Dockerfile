FROM ruby:2.7.4

ENV RRDE_ROOT="/home/rrde"

## Configure time zone.
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
 && echo $TZ > /etc/timezone \
 && dpkg-reconfigure -f noninteractive tzdata

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
 && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends default-libmysqlclient-dev nodejs nodejs-dev yarn locales git libsecp256k1-dev zsh \
 && chsh -s /bin/zsh \
 && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

WORKDIR $RDDE_ROOT

# TODO:
# command shortcuts be etc
# git
