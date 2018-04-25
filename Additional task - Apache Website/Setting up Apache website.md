# Setting up Apache website on local Linux box
## Installation
Go to your terminal and type:
```bash
sudo apt-get update
sudo apt-get install apache2
sudo systemctl status apache2
```
## Initial testing
Type your IP address in a browser <br/>
If a website is shown in the brower, it means you have successfully set up Apache

## Build website
Under “It works!” it says “replace this file” , you want to copy the link that follows not including index.html (/var/www/html/)
```bash
cd /var/www/html/
ls
```

### To go to the file that holds Downloads:
```bash
cd 
sudo mv home/ariannaalfiero/Downloads/index.html var/www/html/index.html -f
```
### To give you permissions to drag and drop these files into the html folder in www in var
Type `sudo nautilus` on the terminal
