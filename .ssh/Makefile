.PHONY: all
all: config known_hosts


config: $(sort $(wildcard config.d/*))
	-chmod 600 "$@" 2>/dev/null
	if [[ -n "$^" ]]; then \
		cat $^ > "$@" ; \
	fi
	touch "$@"
	chmod 400 "$@"


known_hosts: $(filter-out known_hosts.d/Makefile, $(sort $(wildcard known_hosts.d/*)))
	-chmod 600 "$@" 2>/dev/null
	if [[ -n "$^" ]]; then \
	  cat $^ >"$@" ; \
	fi
	touch "$@"
	chmod 400 "$@"
