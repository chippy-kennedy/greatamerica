# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/var/www/greatamerica"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/var/www/greatamerica/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/logs/unicorn.log"
# stdout_path "/path/to/logs/unicorn.log"
stderr_path "/var/www/greatamerica/logs/unicorn.log"
stdout_path "/var/www/greatamerica/logs/unicorn.log"

# Unicorn socket
# listen "/tmp/unicorn.[app name].sock"
listen "/tmp/unicorn.greatamerica.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30
