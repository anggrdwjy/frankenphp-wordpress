## Tool Fastmode Installing FrankenPHP and Wordpress.

## Information

Before using this program, make sure to update repository `apt update` and install git `apt install git -y` to maximize running of program and Test Application on Ubuntu 24.10. It is recommended to use this script when the new server is installed. This tool has been tested 2 Core CPU, 2GB RAM, 10GB Storage on AWS EC2 with `Public IP` and LXC (Linux Container) with `Private IP`.

## Package Tools
* Go Language
* FrankenPHP
* MySQL Server
* Wordpress
  
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

## Configuration wp-config.php (Optional)
Information Database
```
define('DB_NAME', 'wordpress');
define('DB_USER', 'wp-user');
define('DB_PASSWORD', 'wp-pass');
define('DB_HOST', '127.0.0.1');
```
Auto update without FTP 
```
define( 'FS_METHOD', 'direct' );
```

## Support

* [:octocat: Follow me on GitHub](https://github.com/anggrdwjy)
* [🔔 Subscribe me on Youtube](https://www.youtube.com/@anggarda.wijaya)


## Bugs Fix

Installing theme failed, add set time limit on `wp-config.php`
```
set_time_limit(300);
```

Please open an issue on GitHub with as much information as possible if you found a bug.
* Your operating system / Linux distribution
* All the logs and message outputted
* etc
