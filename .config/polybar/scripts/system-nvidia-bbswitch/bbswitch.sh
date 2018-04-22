#!/bin/sh

if grep -q ON /proc/acpi/bbswitch; then
      echo "  ON"
else
    echo " OFF"
fi
