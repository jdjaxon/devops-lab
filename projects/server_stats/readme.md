# Server Performance Stats
Goal of this project is to write a script to analyse server performance stats.

## Requirements

You are required to write a script `server-stats.sh` that can analyse basic server performance stats. You should be able to run the script on any Linux server and it should give you the following stats:

- Total CPU usage
- Total memory usage (Free vs Used including percentage)
- Total disk usage (Free vs Used including percentage)
- Top 5 processes by CPU usage
- Top 5 processes by memory usage

**Stretch goal:** Feel free to optionally add more stats such as os version, uptime, load average, logged in users, failed login attempts etc.


## Usage

### Methods
You can use one of the following methods to run the script on your machine. Simply paste the command into your terminal.

- `wget`
```bash
sudo bash -c "$(wget https://raw.githubusercontent.com/jdjaxon/devops-lab/refs/heads/main/projects/server_stats/server-stats.sh -O -)"
```

- `curl`
```bash
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/jdjaxon/devops-lab/refs/heads/main/projects/server_stats/server-stats.sh)"
```

- `fetch`
```bash
sudo bash -c "$(fetch -o https://raw.githubusercontent.com/jdjaxon/devops-lab/refs/heads/main/projects/server_stats/server-stats.sh)"
```
