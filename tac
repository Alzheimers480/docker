# To run this server functionality test, you first need to restart the server
# the remoter script should work, if not, read the source code which shows
# how to remotely restart the server

x=141.210.25.46

# create users
out=`curl -sL $x/newuser.php --data "USERNAME=switch202&PASSWORD=password&PASSWORD2=password&FNAME=Gary&LNAME=McDermin&EMAIL=scnolton@oakland.edu"`
if [ "$out" == "True" ]
then echo "Test passed"
else
echo "Test failed"
echo $out
fi

out=`curl -sL $x/newuser.php --data "USERNAME=switcher&PASSWORD=password&PASSWORD2=password&FNAME=Janice&LNAME=Oldman&EMAIL=scnolton@oakland.edu"`
if [ "$out" == "True" ]
then echo "Test passed"
else
echo "Test failed"
echo $out
fi

# create acq
out=`curl -sL $x/newacqu.php --data "USERNAME=ruby&FNAME=Mark&LNAME=Zineberg"`
if [ "$out" == "New Acquaintance Created" ]
then echo "Test passed"
else
echo "Test failed"
echo $out
fi

out=`curl -sL $x/newacqu.php --data "USERNAME=looby&FNAME=Larry&LNAME=McDermin"`
if [ "$out" == "New Acquaintance Created" ]
then echo "Test passed"
else
echo "Test failed"
echo $out
fi

out=`curl -sL $x/newacqu.php --data "USERNAME=scooby&FNAME=Smiles&LNAME=McDermin"`
if [ "$out" == "New Acquaintance Created" ]
then echo "Test passed"
else
echo "Test failed"
echo $out
fi

out=`curl -sL $x/newacqu.php --data "USERNAME=limby&FNAME=Johnny&LNAME=Grim"`
if [ "$out" == "New Acquaintance Created" ]
then echo "Test passed"
else
echo "Test failed"
echo $out
fi

# relate them and upload pics
out=`curl -sL $x/relate.php -F "USERNAME=switch202" -F "ACQUNAME=ruby" -F "RELATION=Grandson" -F "MESSAGE=My least favorite grandson. He just stays in his room." -F "pics[]=@testdata/model/s01/1.pgm" -F "pics[]=@testdata/model/s01/2.pgm" -F "pics[]=@testdata/model/s01/3.pgm"`
if [ "$out" == "True" ]
then echo "Test passed"
else
echo "Test failed"
echo $out
fi

out=`curl -sL $x/relate.php -F "USERNAME=switch202" -F "ACQUNAME=looby" -F "RELATION=brother" -F "MESSAGE=My younger brother. He's so cool." -F "pics[]=@testdata/model/s02/1.pgm" -F "pics[]=@testdata/model/s02/2.pgm" -F "pics[]=@testdata/model/s02/3.pgm"`
if [ "$out" == "True" ]
then echo "Test passed"
else
echo "Test failed"
echo $out
fi

out=`curl -sL $x/relate.php -F "USERNAME=switch202" -F "ACQUNAME=scooby" -F "RELATION=Son" -F "MESSAGE=My son who brings light and joy into the world" -F "pics[]=@testdata/model/s03/1.pgm" -F "pics[]=@testdata/model/s03/2.pgm" -F "pics[]=@testdata/model/s03/3.pgm"`
if [ "$out" == "True" ]
then echo "Test passed"
else
echo "Test failed"
echo $out
fi

out=`curl -sL $x/relate.php -F "USERNAME=switcher" -F "ACQUNAME=looby" -F "RELATION=Friend" -F "MESSAGE=You met him in 2014 playing euchre" -F "pics[]=@testdata/model/s02/1.pgm" -F "pics[]=@testdata/model/s02/2.pgm" -F "pics[]=@testdata/model/s02/3.pgm"`
if [ "$out" == "True" ]
then echo "Test passed"
else
echo "Test failed"
echo $out
fi

out=`curl -sL $x/relate.php -F "USERNAME=switcher" -F "ACQUNAME=limby" -F "RELATION=Grandson" -F "MESSAGE=Your sad grandson" -F "pics[]=@testdata/model/s04/1.pgm" -F "pics[]=@testdata/model/s04/2.pgm" -F "pics[]=@testdata/model/s04/3.pgm"`
if [ "$out" == "True" ]
then echo "Test passed"
else
echo "Test failed"
echo $out
fi

# predict
curl -sL $x/predict.php -F "pic=@testdata/test/s02/8.pgm" -F "USERNAME=switch202" -o outfile
awk -f my.awk outfile > info
fname=`sed '3q;d' info`
lname=`sed '4q;d' info`
relation=`sed '5q;d' info`
mess=`sed '6q;d' info`
if [ "$fname" == "Larry" ] && [ "$lname" == "McDermin" ] && [ "$relation" == "brother" ] && [ "$mess" == "My younger brother. He's so cool." ]
then echo "Test passed"
else
echo "Test failed"
cat info
fi

curl -sL $x/predict.php -F "pic=@testdata/test/s03/8.pgm" -F "USERNAME=switch202" -o outfile
awk -f my.awk outfile > info
fname=`sed '3q;d' info`
lname=`sed '4q;d' info`
relation=`sed '5q;d' info`
mess=`sed '6q;d' info`
if [ "$fname" == "Smiles" ] && [ "$lname" == "McDermin" ] && [ "$relation" == "Son" ] && [ "$mess" == "My son who brings light and joy into the world" ]
then echo "Test passed"
else
echo "Test failed"
cat info
fi

curl -sL $x/predict.php -F "pic=@testdata/test/s01/8.pgm" -F "USERNAME=switch202" -o outfile
awk -f my.awk outfile > info
fname=`sed '3q;d' info`
lname=`sed '4q;d' info`
relation=`sed '5q;d' info`
mess=`sed '6q;d' info`
if [ "$fname" == "Mark" ] && [ "$lname" == "Zineberg" ] && [ "$relation" == "Grandson" ] && [ "$mess" == "My least favorite grandson. He just stays in his room." ]
then echo "Test passed"
else
echo "Test failed"
cat info
fi

curl -sL $x/predict.php -F "pic=@testdata/test/s02/8.pgm" -F "USERNAME=switcher" -o outfile
awk -f my.awk outfile > info
fname=`sed '3q;d' info`
lname=`sed '4q;d' info`
relation=`sed '5q;d' info`
mess=`sed '6q;d' info`
if [ "$fname" == "Larry" ] && [ "$lname" == "McDermin" ] && [ "$relation" == "Friend" ] && [ "$mess" == "You met him in 2014 playing euchre" ]
then echo "Test passed"
else
echo "Test failed"
cat info
fi

curl -sL $x/predict.php -F "pic=@testdata/test/s04/8.pgm" -F "USERNAME=switcher" -o outfile
awk -f my.awk outfile > info
fname=`sed '3q;d' info`
lname=`sed '4q;d' info`
relation=`sed '5q;d' info`
mess=`sed '6q;d' info`
if [ "$fname" == "Johnny" ] && [ "$lname" == "Grim" ] && [ "$relation" == "Grandson" ] && [ "$mess" == "Your sad grandson" ]
then echo "Test passed"
else
echo "Test failed"
cat info
fi