# ec2-auto-shutdown

*ec2-auto-shutdown* is a systemd service that helps you reduce AWS costs. 
It will shut down an instance automatically when there is no SSH activity for configured period of time and average load is bellow configured threshold.

## Installation

```sh
curl -o- https://raw.githubusercontent.com/holmesal/ec2-auto-shutdown/master/install.sh | sudo bash
```

## Configuration

Config file is located at */etc/ec2-auto-shutdown/ec2-auto-shutdown-config*.

Restart service after making changes using:
```sh
sudo systemctl restart ec2-auto-shutdown
```

## Logs

```sh
journalctl -u ec2-auto-shutdown -ef
```
