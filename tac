# create user
curl -L $(docker-machine ip cv)/newuser.php --data "USERNAME=switch202&PASSWORD=password&PASSWORD2=password&FNAME=Grumpy&LNAME=OldFart&EMAIL=scnolton@oakland.edu"

# create acq
curl -L $(docker-machine ip cv)/newacqu.php --data "USERNAME=ruby&FNAME=Grumpy&LNAME=OldFart"

# relate them
curl -L $(docker-machine ip cv)/relate.php --data "USERNAME=switch202&ACQUNAME=ruby&RELATION=brother&MESSAGE=my older brother. he is so cool."

# upload pics of acq
# you need to extract testdata to this dir for this to run
curl -L $(docker-machine ip cv)/getPics.php -F "USERNAME=switch202" -F "ACQ_NAME=ruby" -F "pics[]=@testdata/model/s01/1.pgm" -F "pics[]=@testdata/model/s01/2.pgm" -F "pics[]=@testdata/model/s01/3.pgm"
