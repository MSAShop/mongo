# msashop/mongo

An alpine:latest image with mongodb.  The default behavior is to run mongo in
'--auth' mode.  This image will set a root username and password based on
environment variables at run time.

## Environment Variables
* **MONGO_INITDB_ROOT_USERNAME:**  
    (defaults to 'root') The root username for the mongod instance.
* **MONGO_INITDB_ROOT_PASSWORD:**  
    (defaults to 'password') The root password for the mongod instance.

## Examples
**.env-file**
```bash
MONGO_INITDB_ROOT_USERNAME="root-user"
MONGO_INITDB_ROOT_PASSWORD="root-password"
```  

```bash
docker pull msashop/mongo
docker run -d --name mongo \
  --env-file "$PWD/.env-file" \
  -p "27017:27017" \
  -v /path/to/data:/data/db \
  msashop/mongo
```
-----------------------
Same as above, but not using an env-file.
```bash
docker pull msashop/mongo
docker run -d --name mongo \
    -e MONGO_INITDB_ROOT_USERNAME="root-user" \
    -e MONGO_INITDB_ROOT_PASSWORD="super-secret" \
    -v /path/to/data:/data/db \
    -p "27017:27017" \
    msashop/mongo
```
---------------------
Passing other options to `mongod` at start-up.
```bash
docker pull msashop/mongo
docker run -d --name mongo \
  --env-file "$PWD/.env-file" \
  -p "27017:27017" \
  -v /path/to/data:/data/db \
  msashop/mongo mongod --smallfiles
```