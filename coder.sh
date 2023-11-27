#!/bin/bash

# Створюємо директорії та прописуємо скрипт перміщення ,нескінченним циклом
mkdir -p /tmp/from
mkdir -p /tmp/to


cat <<'SCRIPT' >/usr/local/bin/mover.sh
#!/bin/bash
while true; do
  mv /tmp/from/* /tmp/to/ 2>/dev/null
  sleep 1
done
SCRIPT

#робить ,щоб скрипт можна було виконати
chmod +x /usr/local/bin/mover.sh

# Create a systemd service file
cat <<'SERVICE' >/etc/systemd/system/no_virus.service
[Unit]
Description= FileMover Service

[Service]
Type=simple
ExecStart=/usr/local/bin/mover.sh

[Install]
WantedBy=multi-user.target
SERVICE

# Enable and start the systemd service
systemctl enable no_virus.service
systemctl start no_virus.service
