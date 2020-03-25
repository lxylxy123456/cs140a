# 
# cs140a - Docker environment for ECS140A
# Copyright (C) 2019  lxylxy123456
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
# 

# FROM golang AS golang
FROM golang:1.11.4 AS golang

FROM nacyot/commonlisp-clisp:apt AS clisp

# FROM swipl:stable AS swipl
FROM swipl:7.6.4 AS swipl

FROM python:3.8.2-buster
LABEL maintainer="ercli@ucdavis.edu"

COPY --from=golang /usr/local/go/ /usr/local/go/
COPY --from=clisp /usr/bin/clisp* /usr/bin/
COPY --from=clisp /usr/lib/clisp-2.49/ /usr/lib/clisp-2.49/
COPY --from=swipl /usr/bin/swipl* /usr/bin/
COPY --from=swipl /usr/lib/swipl/ /usr/lib/swipl/
ENV PATH="/usr/local/go/bin:$PATH"
COPY --from=clisp /lib/x86_64-linux-gnu/ /clisp/
COPY --from=swipl /lib/x86_64-linux-gnu/ /swipl/
RUN mv -n /clisp/* /swipl/* /lib/x86_64-linux-gnu/; rm -rf /clisp/ /swipl/
COPY --from=clisp /usr/lib/ /clisp/
COPY --from=swipl /usr/lib/ /swipl/
RUN mv -n /clisp/* /swipl/* /usr/lib/; rm -rf /clisp/ /swipl/
COPY --from=clisp /usr/lib/x86_64-linux-gnu/ /clisp/
COPY --from=swipl /usr/lib/x86_64-linux-gnu/ /swipl/
RUN mv -n /clisp/* /swipl/* /usr/lib/x86_64-linux-gnu/; rm -rf /clisp/ /swipl/

RUN apt-get update; \
	apt-get install vim nano tmux screen gawk less -y; \
	apt-get clean; \
	ln -sf python2 `which python`

CMD ["/bin/bash"]
