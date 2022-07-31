# Pavlov Docker Server

Pavlov servers that can be run in Docker, includes all branches used in the wiki (wiki.pavlov-vr.com/index.php?title=Dedicated_server)


## Usage/Examples

An example `docker-compose.yml` file with `Game.ini` and `RconSettings.txt` file mounted
```
version: '2.3'

services:
  pavlov:
    image: pavlov:shack
    volumes:
    - ./Game.ini:/home/steam/pavlovserver/Pavlov/Saved/Config/LinuxServer/Game.ini
    - ./RconSettings.txt:/home/steam/pavlovserver/Pavlov/Saved/Config/RconSettings.txt
    ports:
    - 7777:7777/udp
    - 8177:8177/udp
    - 7777:7777/tcp
    - 8177:8177/tcp
    - 9100:9100/tcp - (Assuming port in RconSettings.txt is 9100)
```


## FAQ

#### How do I use this?

You will have to build the images yourself from the dockerfile (change port in `ENV PORT=` to your own, 7777 by default as shown in the wiki)
The images and all other files are in their respective folders, you do not need to download the `sh` files as they are automatically pulled by the images

