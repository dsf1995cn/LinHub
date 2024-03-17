### 开发工具

[2017]: https://github.com/dsf1995cn/LinHub/blob/master/dev2017.md

### Docker-Run

#### Jellyfin

```shell
#安装Jellyfin
docker run -d \
    --restart=always \
    --name jellyfin \
    -p 8096:8096 \
    -p 8920:8920 \
    --volume jellyfin-config:/config \
    --volume jellyfin-cache:/cache \
    -v /mnt/share_nfs:/media \
    --device=/dev/dri:/dev/dri \
    nyanmisaka/jellyfin:latest
```



#### Navidrome

```shell
docker run -d \
	--name navidrome \
	--restart=unless-stopped \
	--user $(id -u):$(id -g) \
	-v /mnt/share_nfs/media/music:/music \
	-v navidrome-data:/data \
	-p 4533:4533 \
	-e ND_LOGLEVEL=info \
	deluan/navidrome:latest
```

#### Emby

```shell
docker run \
--network=bridge \
-p '28096:8096' \
-p '28920:8920' \
-p '21900:1900/udp' \
-p '27359:7359/udp' \
-v /mnt/disk1/appdata/emby/config:/config \
-v /mnt/disk1/appdata/emby/data:/data \
-v /mnt/share_media_music:/meida \
-e TZ="Asia/Shanghai" \
--device /dev/dri:/dev/dri \
-e UID=0 \
-e GID=0 \
-e GIDLIST=0 \
--restart always \
-e HTTP_PROXY="http://192.168.31.221:7890" \
-e HTTPS_PROXY="http://192.168.31.221:7890" \
--hostname emby-lxc \
--name emby \
-d lovechen/embyserver
```

