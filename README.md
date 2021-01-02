# SQL tools

Install version 12 of `postgresql` along with `pgAdmin4` 

```bash 
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql
sudo apt-get install postgresql-12 pgadmin4 postgresql-server-dev-12 libpq-dev postgresql-12 postgresql-client-12
```


![CNN-image](https://github.com/Foroozani/databaseSQL/blob/main/syntax.png)
