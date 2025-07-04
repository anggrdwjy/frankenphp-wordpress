<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'root' );

/** Database password */
define( 'DB_PASSWORD', 'baseball' );

/** Database hostname */
define( 'DB_HOST', '127.0.0.1' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '` ju|!O{6tu^!R_y7sQb2cLXFaf=d8PUM1^k urcdQc%1w9](=hS5z_k{Zfi(y~%' );
define( 'SECURE_AUTH_KEY',  '*Y]:6L.4M`$m<|q^m!kzTP!NAkf!k)z>vjDR%T~ta=ukomI@xqsGQLSeGoYE6j#z' );
define( 'LOGGED_IN_KEY',    'H8j2G/J~;S81yDk85eDeVkHs4H;kV:F/Wm)dx^a2*xpgJC]=+*&[ppnwF@aewO/_' );
define( 'NONCE_KEY',        'Tx=}NJqohAH#=bRyYJd5@:aGAs=5{M@r ^^n.ldSx<Bq8{#0KW6+Sp_>!*V[Qt;s' );
define( 'AUTH_SALT',        'C]p&!%Ki^x7=p.>1Dv8 Njn<GRV+^k~BF 0r.Ba#|4Uy%D^OU/?;O2(HaO26evr/' );
define( 'SECURE_AUTH_SALT', 'dr*nUY%$/uQU[wH?_QvI_E?j/;D?N$?!&`t(u1x3-8C@Q<ld}--}1I>#js)PD6S?' );
define( 'LOGGED_IN_SALT',   '!~8-]Xs$J;i8aDl>;cLb?Df7kf ([j?IT]zQx:`BX3P0t]KIV2%Ym*`f@>G3Ehs)' );
define( 'NONCE_SALT',       'njDM=lth|2f]~zY:Yd!~-u{|oiiYJPa*uz!ATj;]SX[@WOz<q3:bZ*_S^_/jM[b>' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
*
 * At the installation time, database tables are created with the specified prefix.
 * Changing this value after WordPress is installed will make your site think
 * it has not been installed.
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/#table-prefix
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */

/** Sets up 'direct' method for wordpress, auto update without ftp */
define( 'FS_METHOD', 'direct' );
set_time_limit(300);

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}
/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

