# Troubleshooting Internal Web Dashboard Connectivity

# Verify DNS Resolution

We performed DNS checks to verify whether `internal.example.com` is correctly resolvable both internally and externally.

## Query Internal DNS (`/etc/resolv.conf` server)

`dig internal.example.com`

## External DNS (Google Public DNS 8.8.8.8)
`dig internal.example.com @8.8.8.8`


![Verify DNS ](https://github.com/user-attachments/assets/c7d53ac5-1d94-4e5d-94d3-0aa2b43a47ac)

# Diagnose Service Reachability

To verify whether the internal service (`internal.example.com`) is reachable and properly running, the following steps were performed:

## 1. Test HTTP Response with `curl`

We use `curl` to check if the service is up and responding correctly:
`curl -I http://internal.example.com`

Check Listening Ports with netstat
`netstat -tuln | grep ':80'`

Confirm TCP Connection with telnet
`telnet internal.example.com 80`

![Diagnose Service Reachability](https://github.com/user-attachments/assets/21c8908b-e4de-488d-ba46-1ddd2198746d)

## Step 3 & Step 4
# Possible Causes & Fixes

1) DNS Issues

Misconfigured or unreachable internal DNS server.
Domain is not known by public DNS servers.

Fixing:

Restart DNS service:
`sudo systemctl restart systemd-resolved`


Or update `/etc/resolv.conf` with correct internal DNS.


2) Service Issues

The web service may not be running on the correct port.
Network configuration issues preventing access to the server.

Fixing:

Check if service is listening on ports:
`grep ':80|:443'`


If no service is listening, that’s the issue.


3) Network Configuration

Misconfigured firewall or security group rules on the internal server.

Fixing:

Check firewall rules:
`sudo ufw status`


If ports are closed, that's the issue. Allow traffic:
`sudo ufw allow 80/tcp`
`sudo ufw allow 443/tcp`
`sudo ufw reload`






