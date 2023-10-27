### 开发工具

[2017]: https://github.com/dsf1995cn/LinHub/blob/master/dev2017.md

### Docker-Run

#### Jellyfin

```
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

```
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
