# create users
curl -L localhost/newuser.php --data "USERNAME=switch202&PASSWORD=password&PASSWORD2=password&FNAME=Grumpy&LNAME=OldMan&EMAIL=scnolton@oakland.edu" > /dev/null

# create acq
curl -L localhost/newacqu.php --data "USERNAME=ruby&FNAME=Mark&LNAME=Zineberg"
curl -L localhost/newacqu.php --data "USERNAME=looby&FNAME=Larry&LNAME=McDermin"
curl -L localhost/newacqu.php --data "USERNAME=scooby&FNAME=Smiles&LNAME=McDermin"

# relate them and upload pics
curl -L localhost/relate.php -F "USERNAME=switch202" -F "ACQUNAME=ruby" -F "RELATION=Grandson" -F "MESSAGE=My least favorite grandson. He just stays in his room." -F "pics[]=@testdata/model/s01/1.pgm" -F "pics[]=@testdata/model/s01/2.pgm" -F "pics[]=@testdata/model/s01/3.pgm"

curl -L localhost/relate.php -F "USERNAME=switch202" -F "ACQUNAME=looby" -F "RELATION=brother" -F "MESSAGE=My younger brother. He's so cool." -F "pics[]=@testdata/model/s02/1.pgm" -F "pics[]=@testdata/model/s02/2.pgm" -F "pics[]=@testdata/model/s02/3.pgm"

curl -L localhost/relate.php -F "USERNAME=switch202" -F "ACQUNAME=scooby" -F "RELATION=Son" -F "MESSAGE=My son who brings light and joy into the world" -F "pics[]=@testdata/model/s03/1.pgm" -F "pics[]=@testdata/model/s03/2.pgm" -F "pics[]=@testdata/model/s03/3.pgm"

# predict
curl -L localhost/predict.php -F "pic=@testdata/test/s02/8.pgm" -F "USERNAME=switch202"
curl -L localhost/predict.php -F "pic=@testdata/test/s03/8.pgm" -F "USERNAME=switch202"
curl -L localhost/predict.php -F "pic=@testdata/test/s01/8.pgm" -F "USERNAME=switch202"
