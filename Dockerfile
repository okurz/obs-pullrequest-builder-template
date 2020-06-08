FROM opensuse/tumbleweed

RUN zypper -n in osc ruby2.6 ruby2.6-devel git gcc make autoconf zlib-devel libxml2-devel libxslt-devel
RUN gem install bundler
RUN bundle.ruby2.6 config build.nokogiri --use-system-libraries
WORKDIR /home/puller/pull_request_package
COPY Gemfile /home/puller/pull_request_package/
RUN bundler.ruby2.6 install
RUN useradd -ms /bin/bash puller
