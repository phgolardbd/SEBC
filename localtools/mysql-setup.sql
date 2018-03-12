CREATE DATABASE cmserver DEFAULT CHARACTER SET utf8;
CREATE DATABASE rman DEFAULT CHARACTER SET utf8;
CREATE DATABASE metastore DEFAULT CHARACTER SET utf8;
CREATE DATABASE amon DEFAULT CHARACTER SET utf8;
CREATE DATABASE sentry DEFAULT CHARACTER SET utf8;
CREATE DATABASE nav DEFAULT CHARACTER SET utf8;
CREATE DATABASE navms DEFAULT CHARACTER SET utf8;
CREATE DATABASE hue DEFAULT CHARACTER SET utf8;
CREATE DATABASE oozie DEFAULT CHARACTER SET utf8;

GRANT ALL on cmserver.* TO 'cmserveruser'@'%' IDENTIFIED BY 'password';
GRANT ALL on rman.* TO 'rmanuser'@'%' IDENTIFIED BY 'password';
GRANT ALL on metastore.* TO 'hiveuser'@'%' IDENTIFIED BY 'password';
GRANT ALL on amon.* TO 'amonuser'@'%' IDENTIFIED BY 'password';
GRANT ALL on sentry.* TO 'sentryuser'@'%' IDENTIFIED BY 'password';
GRANT ALL on nav.* TO 'navuser'@'%' IDENTIFIED BY 'password';
GRANT ALL on navms.* TO 'navmsuser'@'%' IDENTIFIED BY 'password';
GRANT ALL on hue.* TO 'hueuser'@'%' IDENTIFIED BY 'password';
GRANT ALL on oozie.* TO 'oozieuser'@'%' IDENTIFIED BY 'password';