sudo find ../volumes/django -type d -exec chmod 775 {} \;
sudo find ../volumes/django -type f -exec chmod 674 {} \;
sudo find ../volumes/django -type d -name \* -exec chmod 775 {} \;
sudo chown 1000:102 -R ../volumes/django
