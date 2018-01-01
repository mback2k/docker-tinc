#!/bin/sh
set -e

# check environment variable TINC_USER
if [ -z "${TINC_USER}" ]; then
    echo "Environment variable TINC_USER is required"
    exit 1
fi

# check environment variable TINC_NETNAME
if [ -z "${TINC_NETNAME}" ]; then
    echo "Environment variable TINC_NETNAME is required"
    exit 2
fi

echo "#!/bin/sh" > /usr/local/sbin/tincd
echo "exec /usr/sbin/tincd -D -U ${TINC_USER} -n ${TINC_NETNAME}" >> /usr/local/sbin/tincd

chown --reference=/usr/sbin/tincd /usr/local/sbin/tincd
chmod --reference=/usr/sbin/tincd /usr/local/sbin/tincd
