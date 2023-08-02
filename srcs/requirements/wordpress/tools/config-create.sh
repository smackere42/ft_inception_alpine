#!bin/sh
if [ ! -f "/var/www/wp-config.php" ]; then
cat << EOF > /var/www/wp-config.php
<?php
define( 'DB_NAME', '${DB_NAME}' );
define( 'DB_USER', '${DB_USER}' );
define( 'DB_PASSWORD', '${DB_PASS}' );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define('FS_METHOD','direct');
\$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
define( 'ABSPATH', __DIR__ . '/' );}
define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', 6379 );
define( 'WP_REDIS_TIMEOUT', 1 );
define( 'WP_REDIS_READ_TIMEOUT', 1 );
define( 'WP_REDIS_DATABASE', 0 );
require_once ABSPATH . 'wp-settings.php';
EOF
fi

cat << EOF > start.sh

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
while ! wp core install --allow-root --url='https://www.smackere.42.fr' --title='smackere.42.fr' --admin_user=${DB_USER} --admin_password=${DB_PASS} --admin_email=${MAIL}; do
	sleep 1
done
wp user create ${WP_USER} ${WP_MAIL} --user_pass=${WP_PASS} --role=author --allow-root;
# wp theme install nanospace --activate --allow-root;
/etc/init.d/php-fpm8 -F restart
exit 0
EOF

# Add execution permissions to the script
chmod +x start.sh