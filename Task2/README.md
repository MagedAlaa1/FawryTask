# Troubleshooting Internal Web Dashboard Connectivity

## Step 1: Verify DNS Resolution

### 1. Compare DNS Resolution from `/etc/resolv.conf` vs. 8.8.8.8

To verify DNS resolution from your local configuration and compare it to Google's DNS (8.8.8.8), follow these steps:

#### Check DNS Resolution from `/etc/resolv.conf`

Run the following command to check the DNS settings from your local system’s DNS resolver:

```bash
cat /etc/resolv.conf
![Verify DNS ](https://github.com/user-attachments/assets/4cfd88e8-3a5a-4c23-bc78-cf455d13b911)

