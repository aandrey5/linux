# open bash for container

sudo docker exec -it 4acda249d78a  bash

# copy files from host into contaiter

sudo docker cp postgres.py  airflow:/usr/local/airflow/dags

# work with postgres

sudo docker exec -it my_postgres_2 psql -U root -c "create database my_database"

sudo docker cp ./dss.ddl my_postgres_2:/


sudo  docker exec -it my_postgres_2 psql my_database -f dss.ddl
