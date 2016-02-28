# create users
curl -L $(docker-machine ip cv)/newuser.php --data "USERNAME=switch202&PASSWORD=password&PASSWORD2=password&FNAME=Grumpy&LNAME=OldFart&EMAIL=scnolton@oakland.edu"
curl -L $(docker-machine ip cv)/newuser.php --data "USERNAME=switch201&PASSWORD=password&PASSWORD2=password&FNAME=Grumpy&LNAME=OldFart&EMAIL=scnolton@oakland.edu"

# create acq
curl -L $(docker-machine ip cv)/newacqu.php --data "USERNAME=ruby&FNAME=Grumpy&LNAME=OldFart"
curl -L $(docker-machine ip cv)/newacqu.php --data "USERNAME=looby&FNAME=Grumpy&LNAME=Jimmy"
curl -L $(docker-machine ip cv)/newacqu.php --data "USERNAME=scooby&FNAME=Slippin&LNAME=Jimmy"

# relate them
curl -L $(docker-machine ip cv)/relate.php -F "USERNAME=switch202" -F "ACQUNAME=ruby" -F "RELATION=brother" -F "MESSAGE=my older brother. he is so cool." -F "pics[]=@testdata/model/s01/1.pgm" -F "pics[]=@testdata/model/s01/2.pgm" -F "pics[]=@testdata/model/s01/3.pgm"
curl -L $(docker-machine ip cv)/relate.php -F "USERNAME=switch202" -F "ACQUNAME=looby" -F "RELATION=brother" -F "MESSAGE=my younger brother. not so cool." -F "pics[]=@testdata/model/s02/1.pgm" -F "pics[]=@testdata/model/s02/2.pgm" -F "pics[]=@testdata/model/s02/3.pgm"

# predict
curl -L $(docker-machine ip cv)/predict.php -F "pic=@testdata/test/s02/8.pgm" -F "USERNAME=switch202"

# curl -L $(docker-machine ip cv)/relate.php --data "USERNAME=switch202&ACQUNAME=looby&RELATION=brother&MESSAGE=my younger brother. he is not cool."
# curl -L $(docker-machine ip cv)/relate.php --data "USERNAME=switch201&ACQUNAME=looby&RELATION=brother&MESSAGE=always slippin."


# upload pics of acq
# you need to extract testdata to this dir for this to run
#curl -L $(docker-machine ip cv)/getPics.php -F "USERNAME=switch202" -F "ACQ_NAME=ruby" -F "pics[]=@testdata/model/s01/1.pgm" -F "pics[]=@testdata/model/s01/2.pgm" -F "pics[]=@testdata/model/s01/3.pgm"
#curl -L $(docker-machine ip cv)/getPics.php -F "USERNAME=switch202" -F "ACQ_NAME=looby" -F "pics[]=@testdata/model/s02/1.pgm" -F "pics[]=@testdata/model/s02/2.pgm" -F "pics[]=@testdata/model/s02/3.pgm"
#curl -L $(docker-machine ip cv)/getPics.php -F "USERNAME=switch201" -F "ACQ_NAME=scooby" -F "pics[]=@testdata/model/s03/1.pgm" -F "pics[]=@testdata/model/s03/2.pgm" -F "pics[]=@testdata/model/s03/3.pgm"
