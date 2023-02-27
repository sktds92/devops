useradd -s /bin/bash -m ${USER_NAME}
export HOME=/home/${USER_NAME}
usermod -u ${USER_ID} ${USER_NAME}
groupadd -g ${GROUP_ID} ${GROUP_NAME} 
usermod -g ${GROUP_NAME} ${USER_NAME}
usermod -G grafana ${USER_NAME}

echo whoami

chown -R root:root /etc/grafana && \
chmod -R a+r /etc/grafana && \
chown -R grafana:grafana /var/lib/grafana && \
chown -R grafana:grafana /usr/share/grafana

/bin/bash grafana/grafana-enterprise:8.2.0