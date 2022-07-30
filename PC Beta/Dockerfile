FROM ubuntu:kinetic

CMD ["bash"]
ENV PORT=7777
RUN apt update -y && apt install -y gdb curl lib32gcc-s1 libc++-dev unzip cron nano

RUN useradd -m -N -s /bin/bash -u 1000 -p 'password' steam
USER steam

RUN mkdir /home/steam/Steam && cd /home/steam/Steam && curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
RUN /home/steam/Steam/steamcmd.sh +login anonymous +force_install_dir /home/steam/pavlovserver +app_update 622970 -beta beta_server +exit && chmod +x /home/steam/pavlovserver/PavlovServer.sh
RUN /home/steam/Steam/steamcmd.sh +login anonymous +app_update 1007 +quit
RUN mkdir -p /home/steam/.steam/sdk64
RUN cp /home/steam/Steam/steamapps/common/Steamworks\ SDK\ Redist/linux64/steamclient.so /home/steam/.steam/sdk64/steamclient.so
RUN cp /home/steam/Steam/steamapps/common/Steamworks\ SDK\ Redist/linux64/steamclient.so /home/steam/pavlovserver/Pavlov/Binaries/Linux/steamclient.so

RUN curl -o /home/steam/pavlov_update.sh https://raw.githubusercontent.com/breixopd/pavlov-server/main/PC%20Beta/pavlov_update.sh && chmod +x /home/steam/pavlov_update.sh
RUN mkdir /home/steam/pavlov_update_logs && touch /home/steam/pavlov_update_logs/pavlov_update.sh.log

RUN curl -o /home/steam/pavlov_start.sh https://raw.githubusercontent.com/breixopd/pavlov-server/main/PC%20Beta/pavlov_start.sh && chmod +x /home/steam/pavlov_start.sh

CMD ["/home/steam/pavlov_start.sh"]