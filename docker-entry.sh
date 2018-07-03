#!/bin/sh

cat > /etc/bind/named.conf.options <<EOF
options {
        directory "/var/cache/bind";
        auth-nxdomain no;
        listen-on-v6 { any; };
        allow-query { any; };
        dns64 ${DNS64_PREFIX} {
                clients { any; };
        };
};
EOF

if [ "$1" = 'named' ]; then
  echo "Starting named..."
  exec $(which named) -g
else
  exec "$@"
fi

