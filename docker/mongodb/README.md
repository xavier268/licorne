# MongoDb container
## Configuration

Mongo version is 3.2.10
Configured to run as a root
Default command will launch the database.

## Volumes

Defines  /data/db

## Port

Internal port, 27017

## How to use & useful reminders ...

Pull the image :

**docker pull xavier268/mongodb**

Launch a container - the volume is created locally in the host at /var/lib/docker/volumes/[...]
Use docker inspect on the running container to get detailled location.

**docker run -d -p 27000:27017 xavier268/mongodb**

Same, but specifying an external volume location for the /data/db volume

**docker run -d -p 27000:27017 --volume /absolute/path/in/the/host:/data/db  xavier268/mongodb**

... or reusing a previously lauched container

**docker run -d -p 27000:27017 --volumes-from anotherStoppedContainer xavier268/mongodb**

Identify dangling volumes :

**docker volume ls**

Remove all volumes (**DANGER!**)

**docker volume rm $(docker volume ls -q)**

Create a named volume

**docker volume create --name volume1**

... and use this newly created volume to host the database content, or share it with multiple containers

**docker run -d -p 27000:27017 -v volume1:/data/db xavier268/mongodb**


Attach to the running container (it has no tty, so use exec ) to poke around :

**docker exec -it nameofcontainer bash**

(Remember, you can exit with Ctrl-P Ctrl-Q to let the container run)

Chek logs with :

**docker logs nameofcontainer**

Check connection from the host :

**mongo --port 27000** etc, ... then **quit()**

Make a backup gziped archive file, from outside the container ...

**mongodump --port 27000 --gzip --archive=archiveFileOnHost**

... and restoring :

**mongorestore --port 27000 --gzip --archive=archiveFileOnHost**

You can backup while the db is running. You can specify specific db or collections to backup.
Restore normally inserts, does not update xeisting documents. See help for drop options.







