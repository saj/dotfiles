TARGETS=config known_hosts

all: $(TARGETS)

config.d/default:
	if [ ! -e "$@" ]; then \
	  mkdir -p "$$(dirname $@)" && \
	  touch "$@" && \
	  chmod 600 "$@" ; \
	fi

config: $(filter-out config.d/default, $(wildcard config.d/*)) \
	config.d/default
	-chmod 600 "$@" 2>/dev/null
	cat $^ > "$@"
	chmod 400 "$@"

known_hosts: $(wildcard known_hosts.d/*)
	-chmod 600 "$@" 2>/dev/null
	if [ -n "$^" ]; then \
	  cat $^ > $@ ; \
	fi
	touch "$@"
	chmod 400 "$@"

clean:
	rm -f $(TARGETS)

.PHONY: all
.PHONY: clean
