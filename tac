# create users
curl -L $(docker-machine ip cv)/newuser.php --data "USERNAME=switch202&PASSWORD=password&PASSWORD2=password&FNAME=Grumpy&LNAME=OldFart&EMAIL=scnolton@oakland.edu"

# create acq
curl -L $(docker-machine ip cv)/newacqu.php --data "USERNAME=ruby&FNAME=Grimy&LNAME=Johnny"
curl -L $(docker-machine ip cv)/newacqu.php --data "USERNAME=looby&FNAME=Grumpy&LNAME=Bill"
curl -L $(docker-machine ip cv)/newacqu.php --data "USERNAME=scooby&FNAME=Slippin&LNAME=Jimmy"

# relate them and upload pics
curl -L $(docker-machine ip cv)/relate.php -F "USERNAME=switch202" -F "ACQUNAME=ruby" -F "RELATION=brother" -F "MESSAGE=my older brother. he is so cool." -F "pics[]=@testdata/model/s01/1.pgm" -F "pics[]=@testdata/model/s01/2.pgm" -F "pics[]=@testdata/model/s01/3.pgm"

curl -L $(docker-machine ip cv)/relate.php -F "USERNAME=switch202" -F "ACQUNAME=looby" -F "RELATION=brother" -F "MESSAGE=my younger brother. not so cool." -F "pics[]=@testdata/model/s02/1.pgm" -F "pics[]=@testdata/model/s02/2.pgm" -F "pics[]=@testdata/model/s02/3.pgm"

curl -L $(docker-machine ip cv)/relate.php -F "USERNAME=switch202" -F "ACQUNAME=scooby" -F "RELATION=sister" -F "MESSAGE=my sister. she has cats." -F "pics[]=@testdata/model/s03/1.pgm" -F "pics[]=@testdata/model/s03/2.pgm" -F "pics[]=@testdata/model/s03/3.pgm"

# predict
curl -L $(docker-machine ip cv)/predict.php -F "pic=@testdata/test/s02/8.pgm" -F "USERNAME=switch202"
curl -L $(docker-machine ip cv)/predict.php -F "pic=@testdata/test/s03/8.pgm" -F "USERNAME=switch202"
curl -L $(docker-machine ip cv)/predict.php -F "pic=@testdata/test/s01/8.pgm" -F "USERNAME=switch202"