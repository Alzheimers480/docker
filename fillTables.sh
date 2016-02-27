curl -L $(docker-machine ip cv)/newuser.php --data "USERNAME=switch202&PASSWORD=password&PASSWORD2=password&FNAME=Grumpy&LNAME=OldFart&EMAIL=scnolton@oakland.edu";
curl -L $(docker-machine ip cv)/newacqu.php --data "USERNAME=loopy&FNAME=Grumpy&LNAME=OldFart";
curl -L $(docker-machine ip cv)/relate.php --data "USERNAME=switch202&ACQUNAME=loopy&RELATION=brother&MESSAGE=my older brother. he is so cool.";
