### Docker DHCP and Network Modes

Docker runs in a **separate network by default called a docker bridge network, making DHCP serve addresses to that network instead of your LAN.** This guide explains why Docker Pi-hole DHCP differs from normal Pi-hole and how to address this issue.

- Technical Details

**Docker's bridge network mode is default and recommended as a more secure setting for containers because docker is all about isolation, they isolate processes by default and the bridge network isolates the networking by default too.** You gain access to the isolated container's service ports by using port forwards in your container's runtime config; for example -p 67:67 is DHCP. However, **DHCP protocol operates through a network 'broadcast' which cannot span multiple networks (docker's bridge, and your LAN network).** In order to get DHCP on to your network there are a few approaches:

- Working Network Modes
  
  - Host Networking Mode: Simple and fast setup. It makes the container be on your LAN network, allowing it to broadcast DHCP.
  - Macvlan Network: Advanced setup. This mode grabs a new IP address off your LAN network, solving the broadcast problem and avoiding port conflicts.
  - Bridge Networking: Requires a DHCP relay to spread the broadcast signal from an isolated docker bridge to your LAN network.
    
### Docker Pi-hole with host networking mode

- **Advantages**: Simple, easy, and fast setup
  - **Possibly the simplest way to get DHCP working with Docker Pi-hole is to use host networking which makes the container be on your LAN Network like a regular Raspberry Pi-hole would be, allowing it to broadcast DHCP.** It will have the same IP as your Docker host server in this mode so you may still have to deal with port conflicts.
  - **Inside your docker-compose.yml remove all ports and replace them with**:
    - `network_mode: host`
  - **If you don't use docker-compose**:
    - `docker run --net=host`

### Docker Pi-hole with a Macvlan network
- Advantages: Works well with NAS devices or hard port conflicts

  - **A Macvlan network is the most advanced option since it requires more network knowledge and setup. This mode is similar to host network mode but instead of borrowing the IP of your docker host computer it grabs a new IP address off your LAN network.**
Having the container get its own IP not only solves the broadcast problem but avoids port conflicts you might have on devices such as NAS devices with web interfaces. **Tony Lawrence detailed macvlan setup for Pi-hole first in the second part of his great blog series about Running Pi-hole on Synology Docker,** check it out here: Free your Synology ports with Macvlan

### Docker Pi-hole with a bridge networking
- Advantages: Works well with container web reverse proxies like Nginx or Traefik

  - If you want to use docker's bridged network mode then you need to run a DHCP relay. **A relay points to your containers forwarded port 67 and spreads the broadcast signal from an isolated docker bridge onto your LAN network.** Relays are very simple software, **you just have to configure it to point to your Docker host's IP port 67. Although uncommon, if your router is an advanced enough router it may support a DHCP relay. Try googling for your router manufacturer + DHCP relay or looking in your router's configuration around the DHCP settings or advanced areas.** If your router doesn't support it, you can run a software/container based DHCP relay on your LAN instead. The author of dnsmasq made a very tiny simple one called DHCP-helper. DerFetzer kindly shared his great setup of a DHCP-helper container on the Pi-hole Discourse forums.

>Warning about the Default Bridge Network
The default bridge network has limitations that user-created bridge networks do not have. It is advisable to use a docker-compose setup to create a custom network automatically.

