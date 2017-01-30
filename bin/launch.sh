#!/bin/bash

# Launch DBus if not running.
if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
	eval `dbus-launch --exit-with-session --sh-syntax`
fi

# Start Sway.
sway
