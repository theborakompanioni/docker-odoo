#!/bin/bash
sudo docker stop tbk-odoo-v9-1
sudo docker rm tbk-odoo-v9-1
sudo docker run -d \
    -p 8069:8069 \
    --restart=always \
    --link my-postgres:db \
    --volume=config:/etc/odoo \
    --volume=addons:/mnt/extra-addons \
    --name tbk-odoo-v9-1 \
    tbk-odoo-v9

