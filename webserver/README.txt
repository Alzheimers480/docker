There are currently 4 php scripts and one bash script in the public_html folder.
There is also 1 php script in the php_templ folder. I will go over each script here.
ALWAYS DOUBLE CHECK THE ECHOS I try to key it up to date with what you see here. but with debugging and consstant change some echos may be different

---------------------auth.php-----------------------
auth.php: This script is used to authorize login for a user. it takes 2 paramters: USERNAME and
PASSWORD. The script will return the echo "True" if the user is authorized to log in.
The script will echo "False" if the Password is wwrong for that user.
The script will echo "user wasn't found False" if the username was not found in the database.

Here is an example curl for auth.php:
curl -L <docker-machine IP>/auth.php --data "USERNAME=switch201&PASSWORD=password"
It should return "True"
---------------------auth.php-----------------------

---------------------newuser.php-----------------------
newuser.php: This script is used to add a new user to the USERS2 database.
This script takes 6 paramters: USERNAME, PASSWORD, PASSWORD2, FNAME, LNAME, and EMAIL
If everything is filled out correctly, the script will echo "New User Created".
If something is wrong the script will echo one of the following:
"one of the fields was blank Unable to create new user"
"The 2 passwords didn't match Unable to create new user"
"user already exists Unable to create new user"
When a new user is created email.php is sent to the the user. when the user clics the link his or her email becomes verified.

Here is an example curl for newuser.php:
curl -L $(docker-machine ip cv)/newuser.php --data "USERNAME=switch202&PASSWORD=password&PASSWORD2=password&FNAME=Grumpy&LNAME=OldFart&EMAIL=scnolton@oakland.edu"
It should return "New User Created"
---------------------newuser.php-----------------------

---------------------var.php-----------------------
var.php: This script is used to check if a user has verfiyed his or her email or not.
The script only takes one paramter: USERNAME
The script will return a "1", if the user has verfied his or heer email. It will return "0"
note that these are strings from an echo and not integers.

Here is an example curl for var.php
curl -L <docker-machine IP>/var.php --data "USERNAME=switch201"
this should return "0" unleess the variable in the database gets changed
---------------------var.php-----------------------

---------------------email.php-----------------------
email.php: this is the script we send to users email so that they can verfiy their email.
when we send them the link to the script we injeect the username paramter into the URL
so that the database knows what user to flip the verfied bit for.
---------------------email.php-----------------------

---------------------db.php-----------------------
This is a reusable script for creating an intial connection to the scnolton database
---------------------db.php-----------------------

---------------------newacqu.php-----------------------
newacqu.php: this function will add an acquaintance to the database. (we still need to figure out how to send pictures to my server. The pics are NOT on the database though)
This script takes 3 paramters: USERNAME, FNAME, LNAME. When calling this functions it is our job to make sure that the USERNAME is unique.
this script also creates a dir on the server where face pics will be stored. this absolute file path is stored in the database. the file path to the pics is always
"/SECS/home/s/scnolton/facePics/<Acquaintance-Username>"
These are the various echos the script can return. you can figure out whan and why each echo takes place based on what they say:
"New Acquaintance Created"
"one or more paramters missing Unable to Create New Acquaintance"
"Acquaintance already exists Unable to Create New Acquaintance"
<<<<<<< HEAD
"New Acquaintance Created dir already exists!"(the way I have it programed this last one should never happen unless someone deltes a user from the database but doesn't dealete the corisponding dir)
here is a curl you can use to test. make sure you keep the database in order though:
curl -L <docker-machine IP>/newacqu.php --data "USERNAME=loopy&FNAME=Grumpy&LNAME=OldFart"
---------------------newacqua.php-----------------------

---------------------relate.php-----------------------
relate.php: this function will relate a user to an acquaintance. for the user, the app will only recognize acquatneces that are matched up in the acquaintance table.
this script takes 4 parameters: USERNAME, ACQUNAME, RELATION, and MESSAGE.
these are the various Echos possible 
"True"  (that means it worked)
"Acuqintance ID does not exists False"
"user does not exists False"
"conn failure False"
"one of the feilds was blank False"
here is an example curl you can use to test. make sure you access the database through phpMyAdmin.
curl -L <docker-machine IP>/relate.php --data "USERNAME=switch202&ACQUNAME=loopy&RELATION=brother&MESSAGE=my older brother. he is so cool."
---------------------relate.php-----------------------


---------------------delete.php-----------------------
This script is used to delte a user from the database
This script only takes the one parameter: "USERNAME"
It will return "True" if it worked "False" if it didn't work.
curl -L <docker-machine IP>/~scnolton/delete.php --data "USERNAME=switch202"
---------------------delete.php-----------------------

---------------------changepass.php-----------------------
this script will change a user's password. the idea is that this script can be used for when a user forgets his or her password
it takes 3 params: "USERNAME", "PASSWORD", and "PASSWORD2"
password and password 2 must match and this is what the user's new password will be.
it will return true if it worked and (some message) False if it does not.
here is an example curl
curl -L <docker-machine IP>/~scnolton/changepass.php --data "USERNAME=switch202&PASSWORD=bibidy&PASSWORD2=bibidy"
---------------------changepass.php-----------------------\

---------------------getPics.php-----------------------
this script recieves images for the purpose of training the Open cv to recoginze an aquantance
the file that is on there right now only takes one picture as Argument. 
for now you will want to name the picture after the acquantence ID. so when you run fill tables. the defualt aquantence is loopy
so your pic should be named loopy.jpg or loopy.png
if everything worked you should get an echo back saying "Yay"
here is an exmaple curl:
curl -L $(docker-machine ip cv)/getPics.php -F "PIC1=@/loopy.jpg"
the @/loop.jpg is where your file path to the picture you want to send goes. mine just happens to be in the same dir as I cam calling this comand from.
---------------------getPics.php-----------------------
