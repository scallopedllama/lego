# Install lego to /usr/bin and its completion into /etc/bash_completion.d
install:
	install -m 755 lego /usr/bin
	install -m 755 lego_completion /etc/bash_completion.d/

