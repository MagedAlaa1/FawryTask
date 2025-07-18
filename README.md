# 📄 MyGrep Script

MyGrep is a small Bash script that works like the basic grep command.
It can search for words inside a text file and supports options to show line numbers and invert matches.

## 🛠️ Features

Case-insensitive search (default).

Options supported:

`-n` → Show line numbers.

`-v` → Invert match (show lines that do not match).

Combined options like `-vn` or `-nv` are supported.

Error handling for missing arguments.

## 🚀 How to Use
Make sure the script is executable
`chmod +x mygrep.sh`

## Examples
`./mygrep.sh hello testfile.txt`

![WhatsApp Image 2025-04-28 at 12 41 43 AM](https://github.com/user-attachments/assets/88983bfc-6d32-47de-ae26-e481dde642a0)

`./mygrep.sh -n hello testfile.txt`

![WhatsApp Image 2025-04-28 at 12 42 01 AM](https://github.com/user-attachments/assets/cb9e0c2f-0ccf-4969-83fa-36126c94b153)

`./mygrep.sh -vn hello testfile.txt`

![WhatsApp Image 2025-04-28 at 12 42 32 AM](https://github.com/user-attachments/assets/97ff7883-64f0-4051-9016-68509b58ec7a)

`./mygrep.sh -v testfile.txt`

![WhatsApp Image 2025-04-28 at 12 42 46 AM](https://github.com/user-attachments/assets/e8486e76-7576-4ca5-b7d0-320696dac032)


# Reflective Section

## Breakdown of How My Script Handles Arguments and Options

First, the script checks if the user gave enough arguments.
It reads the options (-n, -v) and allows them to be combined like -vn.
Then it searches the file and prints matching or non-matching lines, with line numbers if needed.

## If I Added Regex, -i, -c, or -l

I would need to add more flags for each option and use better parsing with getopts.
For regex `[[ "$line" =~ $PATTERN ]]` , I would use a different way to match patterns.
For `-c`, I would just count the matches. For `-l`, I would print the filename if there’s a match.

## Hardest Part

The hardest thing was dealing with combined options like -vn.
Also, making the script show the right lines when using -v was a little tricky.



# Q2 : Scenario

## Troubleshooting Internal Web Dashboard Connectivity
## Check Current DNS Configuration

The `/etc/resolv.conf` file contains the nameserver(s) that the system uses for DNS resolution.

Checking it helps confirm whether the system is configured to use internal DNS servers

`cat /etc/resolv.conf`

![Screenshot 2025-04-28 222940](https://github.com/user-attachments/assets/53d31814-af4a-4ab9-acdb-2a964c80aa95)


## Verify DNS Resolution

We performed DNS checks to verify whether `internal.example.com` is correctly resolvable both internally and externally.

## Query Internal DNS (`/etc/resolv.conf` server)

`dig internal.example.com`

## External DNS (Google Public DNS 8.8.8.8)
`dig internal.example.com @8.8.8.8`


![Verify DNS ](https://github.com/user-attachments/assets/c7d53ac5-1d94-4e5d-94d3-0aa2b43a47ac)

## Diagnose Service Reachability

To verify whether the internal service (`internal.example.com`) is reachable and properly running, the following steps were performed:

## Test HTTP Response with `curl`

We use `curl` to check if the service is up and responding correctly:
`curl -I http://internal.example.com`

Check Listening Ports with netstat
`netstat -tuln | grep ':80'`

Confirm TCP Connection with telnet
`telnet internal.example.com 80`

![Diagnose Service Reachability](https://github.com/user-attachments/assets/21c8908b-e4de-488d-ba46-1ddd2198746d)

## Step 3 & Step 4
# Possible Causes & Fixes

### 1) DNS Issues

Misconfigured or unreachable internal DNS server.
Domain is not known by public DNS servers.

Fixing:

Restart DNS service:
`sudo systemctl restart systemd-resolved`


Or update `/etc/resolv.conf` with correct internal DNS.


### 2) Service Issues

The web service may not be running on the correct port.
Network configuration issues preventing access to the server.

Fixing:

Check if service is listening on ports 

`sudo netstat -tuln | grep ':80\|:443'`

If no service is listening, that’s the issue.


### 3) Network Configuration

Misconfigured firewall or security group rules on the internal server.

Fixing:

Check firewall rules:
`sudo ufw status`


If ports are closed, that's the issue. Allow traffic:

`sudo ufw allow 80/tcp`

`sudo ufw allow 443/tcp`

`sudo ufw enable`

`sudo ufw reload`

![Screenshot 2025-04-28 224510](https://github.com/user-attachments/assets/22e7f499-e90b-4ea7-804b-837f0f76b3a5)

`sudo ufw status`

![Screenshot 2025-04-28 230128](https://github.com/user-attachments/assets/4052ebf8-5253-454b-abb9-fcef93840d6a)


# 📄 End of Report
