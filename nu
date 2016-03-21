# create users
curl -L $(docker-machine ip cv)/newuser.php --data "USERNAME=switch203&PASSWORD=password&PASSWORD2=password&FNAME=Grumpy&LNAME=OldFart&EMAIL=scnolton@oakland.edu"
curl -L $(docker-machine ip cv)/newuser.php --data "USERNAME=switch204&PASSWORD=password&PASSWORD2=password&FNAME=Grumpy&LNAME=OldFart&EMAIL=scnolton@oakland.edu"