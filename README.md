Hello, I made a little Bash script that you can use to upload files to https://pixeldrain.com/ from the terminal. This is very useful for showing log files to developers or making quick backups of remote files through SSH.

To install it you can execute this command:

    sudo wget https://raw.githubusercontent.com/ramaadni/pxd/master/pxd -O "/usr/local/bin/pxd"; sudo chmod +x "/usr/local/bin/pxd"

Explanation: The wget command downloads the script from github and saves it to /usr/local/bin/pxd so you can run it from the terminal. Then chmod makes it executable

Then you can upload files from anywhere in the system using

    pxd file.txt

If you want to uninstall pxd you can run

    sudo rm "/usr/local/bin/pxd"

Be careful for typos! You don't want to accidentally remove your [/usr](https://github.com/MrMEEE/bumblebee-Old-and-abbandoned/issues/123) ;)
