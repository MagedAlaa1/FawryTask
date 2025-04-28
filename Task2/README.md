# Troubleshooting Internal Web Dashboard Connectivity

## Step 1: Verify DNS Resolution

### 1. Compare DNS Resolution from `/etc/resolv.conf` vs. 8.8.8.8

To verify DNS resolution from your local configuration and compare it to Google's DNS (8.8.8.8), follow these steps:

#### Check DNS Resolution from `/etc/resolv.conf`
![Diagnose Service Reachability](https://github.com/user-attachments/assets/e3dba3b5-2b39-407e-af89-8a20ebe4bde1)

Run the following command to check the DNS settings from your local system’s DNS resolver:

```bash
cat /etc/resolv.conf

dig internal.example.com

dig @8.8.8.8 internal.example.com
