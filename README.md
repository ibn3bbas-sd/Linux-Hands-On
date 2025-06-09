# Linux Commands Reference

A collection of essential Linux commands for various tasks.

## File and Directory Management
- **List files and directories**: `ls -la`
- **Change directory**: `cd directory_name`
- **Create a new file**: `touch filename`
- **Create a new directory**: `mkdir directory_name`
- **Move a file or directory**: `mv source destination`
- **Remove a file**: `rm filename`
- **Remove a directory**: `rm -rf directory_name`

## System Information
- **Check Linux distribution**: `cat /etc/os-release`
- **View system details**: `uname -a`
- **Show running processes**: `ps aux`
- **Check memory usage**: `free -h`

## Package Management (Debian-based)
- **Update package lists**: `sudo apt update`
- **Upgrade installed packages**: `sudo apt upgrade`
- **Install a package**: `sudo apt install package_name`
- **Remove a package**: `sudo apt remove package_name`

## Networking
- **Check IP address**: `ip a`
- **Ping a host**: `ping example.com`
- **Test network connectivity**: `curl -I example.com`

## Permissions and Users
- **Change file permissions**: `chmod 755 filename`
- **Change file ownership**: `chown user:group filename`
- **Switch user**: `su - username`

## Miscellaneous
- **Search for a file**: `find /path -name filename`
- **Search within files**: `grep "text" filename`
- **Show command history**: `history`

Feel free to add or customize commands based on your needs!
