# open bash for container

sudo docker exec -it 4acda249d78a  bash

# copy files from host into contaiter

sudo docker cp postgres.py  airflow:/usr/local/airflow/dags
