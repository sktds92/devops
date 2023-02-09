#!/bin/bash
RUNNING_APPLICATION=$(docker ps | grep express1)
DEFAULT_CONF="nginx_volume/default.conf"

if [ -n "$RUNNING_APPLICATION"  ];then
	echo "express2 Deploy..."
	docker-compose pull express2
	docker-compose up -d --build express2
	
	while [ 1 == 1 ]; do
		echo "express2 health check...."
		REQUEST=$(docker exec proxy curl http://express2:8080)
		echo $REQUEST
		if [ -n "$REQUEST" ]; then
			break ;
		fi
		sleep 3
	done;
	
	sed -i 's/express1/express2/g' $DEFAULT_CONF
	docker exec proxy service nginx reload
	docker-compose stop express1
else
	echo "express1 Deploy..."
	docker-compose pull express1
    docker-compose up -d --build express1
	
	while [ 1 == 1 ]; do
		echo "express1 health check...."
                REQUEST=$(docker exec proxy curl http://express1:8080)
                echo $REQUEST
		if [ -n "$REQUEST" ]; then
            break ;
        fi
		sleep 3
    done;
	
	sed -i 's/express2/express1/g' $DEFAULT_CONF
    docker exec proxy service nginx reload
	docker-compose stop express2
fi

