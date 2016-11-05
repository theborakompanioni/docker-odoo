odoo-dev
=====

A local development environment for running odoo.

A list of included containers:
- [cadvisor](https://github.com/google/cadvisor)
- [odoo](https://github.com/odoo/odoo)
- [pgadmin](https://www.pgadmin.org/)
- [postgres](https://www.postgresql.org/)


# getting started

start all containers (v8 and v9):
```
> git clone https://github.com/theborakompanioni/docker-odoo.git
> cd docker-odoo
> docker-compose up --build
```

start only odoo v9
```
> docker-compose up odoov9 pgadmin
```

# environment

## odoo
- v8: [http://localhost:8070/](http://localhost:8070/)
- v9: [http://localhost:8069/](http://localhost:8069/)

## monitoring
- cadvisor: [http://localhost:8082/](http://localhost:8082/)
- pgadmin: [http://localhost:9080/](http://localhost:9080/)



# troubleshooting
## "Connection refused"/"Name or service not known."
Use DOCKER_OPTS to modify the daemon startup options.

add following to entry to `/etc/defaut/docker`
- `DOCKER_OPTS="--dns 8.8.8.8"` (or a nameserver of your choice)

## Bind for 0.0.0.0:xxxx failed: port is already allocated
Sometimes docker-proxy binds to the ports although no container is running.
Described in [docker-compose/#3277](https://github.com/docker/compose/issues/3277)
```
sudo netstat -vtulpen # see docker-proxy binding to the specific port
sudo service docker stop
sudo rm -f /var/lib/docker/network/files/local-kv.db
```

# known issues
- none known yet. please report odd behaviour.


# links
- [docker-compose reference](https://docs.docker.com/compose/compose-file/)
