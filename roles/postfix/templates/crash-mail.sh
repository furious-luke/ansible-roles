#!/bin/bash
MAILTO={{ admin_email }}
MAILFROM="crash-mailer"
UNIT=$1

EXTRA=""
for e in "${@:2}"; do
  EXTRA+="$e"$'\n'
done

UNITSTATUS=$(systemctl status $UNIT)

mail -v -s "Crash mail for unit: $UNIT" $MAILTO <<EOF
Status report for unit: $UNIT
$EXTRA

$UNITSTATUS
EOF

echo -e "Crash mail sent to: $MAILTO for unit: $UNIT"
