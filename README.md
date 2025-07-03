## Tool Fastmode Installing FrankenPHP and Wordpress.

## Information

Before using this program, make sure to update repository `apt update` and install git `apt install git -y` to maximize running of program and Test Application on Ubuntu 24.10. It is recommended to use this script when the new server is installed. This tool has been tested on AWS EC2 with `Public IP` and LXC (Linux Container) with `Private IP`.
  
## Installing Program
```
git clone https://github.com/anggrdwjy/frankenphp-wordpress.git
```
```
cd frankenphp-wordpress
```
```
chmod -R 777 *
```

## Running Program
```
./frankenphp-wp.sh
```

## Support

* [:octocat: Follow me on GitHub](https://github.com/anggrdwjy)
* [🔔 Subscribe me on Youtube](https://www.youtube.com/@anggarda.wijaya)


## Bugs Fix

Installing Theme Failed, Add Set Time Limit on wp-config.php
```
set_time_limit(300);
```

Please open an issue on GitHub with as much information as possible if you found a bug.
* Your operating system / Linux distribution
* All the logs and message outputted
* etc
