# Debug flag
# Uncomment to debug script
# set -x

# To run this server functionality test, you first need to restart the server
# the remoter script should work, if not, read the source code which shows
# how to remotely restart the server
host=141.210.25.46
#host=192.168.99.100

# create users

function mytest {
    if [ "$1" == "$2" ]
    then echo "Test passed"
    else
	echo "Test failed"
	echo $1
    fi
}

# Test 1
echo "Test 1"
expect="True"
out=`curl -s $host/newuser.php -F \
"USERNAME=switch202" -F \
"PASSWORD=password" -F \
"PASSWORD2=password" -F \
"FNAME=Gary" -F \
"LNAME=McDermin" -F \
"EMAIL=scnolton@oakland.edu"`
mytest "$out" "$expect"

# Test 2
echo "Test 2"
expect="True"
out=`curl -s $host/newuser.php -F \
"USERNAME=switcher" -F \
"PASSWORD=password" -F \
"PASSWORD2=password" -F \
"FNAME=Janice" -F \
"LNAME=Oldman" -F \
"EMAIL=scnolton@oakland.edu"`
mytest "$out" "$expect"

# Test 3
echo "Test 3"
expect="True"
out=`curl -s $host/newacqu.php -F \
"USERNAME=ruby" -F \
"FNAME=Mark" -F \
"LNAME=Zineberg" -F \
"GENDER=male"`
mytest "$out" "$expect"

# Test 4
echo "Test 4"
expect="user already exists False"
out=`curl -s $host/newuser.php -F \
"USERNAME=switch202" -F \
"PASSWORD=nimrod" -F \
"PASSWORD2=nimrod" -F \
"FNAME=Smorty" -F \
"LNAME=Gringlestein" -F \
"EMAIL=scnolton@oakland.edu"`
mytest "$out" "$expect"

# Test 5
echo "Test 5"
expect="False"
out=`curl -s $host/auth.php -F \
"USERNAME=switch202" -F \
"PASSWORD=nimrod"`
mytest "$out" "$expect"

# Test auth with wrong password
# This test is failing
# Test 6
echo "Test 6"
expect="False"
out=`curl -s $host/auth.php -F \
"USERNAME=switch202" -F \
"PASSWORD=passwordiord"`
mytest "$out" "$expect"

# Test 7
echo "Test 7"
expect="True"
out=`curl -s $host/auth.php -F \
"USERNAME=switch202" -F \
"PASSWORD=password"`
mytest "$out" "$expect"

# Test 11
echo "Test 11"
expect="True"
out=`curl -s $host/newacqu.php -F \
"USERNAME=looby" -F \
"FNAME=Larry" -F \
"LNAME=McDermin" -F \
"GENDER=male"`
mytest "$out" "$expect"

# Test 12
echo "Test 12"
expect="True"
out=`curl -s $host/newacqu.php -F \
"USERNAME=scooby" -F \
"FNAME=Smiles" -F \
"LNAME=McDermin" -F \
"GENDER=male"`
mytest "$out" "$expect"

# Test 13
echo "Test 13"
expect="True"
out=`curl -s $host/newacqu.php -F \
"USERNAME=limby" -F \
"FNAME=Johnny" -F \
"LNAME=Grim" -F \
"GENDER=female"`
mytest "$out" "$expect"

# Test 14
echo "Test 14"
expect="True"
out=`curl -s $host/newacqu.php -F \
"USERNAME=jc" -F \
"FNAME=Jimmy" -F \
"LNAME=Cringles" -F \
"GENDER=male"`
mytest "$out" "$expect"

# Test 15
echo "Test 15"
expect="Acuqintance ID does not exists False"
out=`curl -s $host/relate.php -F \
"USERNAME=switch202" -F \
"ACQUNAME=kk" -F \
"RELATION=CareTaker" -F \
"MESSAGE=He gives you your medication." -F \
"pics[]=@testdata/model/s07/1.pgm" -F \
"pics[]=@testdata/model/s07/2.pgm" -F \
"pics[]=@testdata/model/s07/3.pgm"`
mytest "$out" "$expect"

# Test 16
echo "Test 16"
expect="True"
out=`curl -s $host/newacqu.php -F \
"USERNAME=kk" -F \
"FNAME=Kenny" -F \
"LNAME=Kreepy" -F \
"GENDER=male"`
mytest "$out" "$expect"

# Test 17
echo "Test 17"
expect="True"
out=`curl -s $host/relate.php -F \
"USERNAME=switch202" -F \
"ACQUNAME=ruby" -F \
"RELATION=Grandson" -F \
"MESSAGE=My least favorite grandson. He just stays in his room." -F \
"pics[]=@testdata/model/s01/1.pgm" -F \
"pics[]=@testdata/model/s01/2.pgm" -F \
"pics[]=@testdata/model/s01/3.pgm"`
mytest "$out" "$expect"

# Test 18
echo "Test 18"
expect="True"
out=`curl -s $host/relate.php -F \
"USERNAME=switch202" -F \
"ACQUNAME=looby" -F \
"RELATION=brother" -F \
"MESSAGE=My younger brother. He's so cool." -F \
"pics[]=@testdata/model/s02/1.pgm" -F \
"pics[]=@testdata/model/s02/2.pgm" -F \
"pics[]=@testdata/model/s02/3.pgm"`
mytest "$out" "$expect"

# Test 19
echo "Test 19"
expect="True"
out=`curl -s $host/relate.php -F \
"USERNAME=switch202" -F \
"ACQUNAME=scooby" -F \
"RELATION=Son" -F \
"MESSAGE=My son who brings light and joy into the world" -F \
"pics[]=@testdata/model/s03/1.pgm" -F \
"pics[]=@testdata/model/s03/2.pgm" -F \
"pics[]=@testdata/model/s03/3.pgm"`
mytest "$out" "$expect"

# Test 20
echo "Test 20"
expect="True"
out=`curl -s $host/relate.php -F \
"USERNAME=switcher" -F \
"ACQUNAME=looby" -F \
"RELATION=Friend" -F \
"MESSAGE=You met him in 2014 playing euchre" -F \
"pics[]=@testdata/model/s02/1.pgm" -F \
"pics[]=@testdata/model/s02/2.pgm" -F \
"pics[]=@testdata/model/s02/3.pgm"`
mytest "$out" "$expect"

# Test 21
echo "Test 21"
expect="True"
out=`curl -s $host/relate.php -F \
"USERNAME=switcher" -F \
"ACQUNAME=limby" -F \
"RELATION=Grandson" -F \
"MESSAGE=Your sad grandson" -F \
"pics[]=@testdata/model/s04/1.pgm" -F \
"pics[]=@testdata/model/s04/2.pgm" -F \
"pics[]=@testdata/model/s04/3.pgm"`
mytest "$out" "$expect"

# Test 22
echo "Test 22"
expect="True"
out=`curl -s $host/relate.php -F \
"USERNAME=switch202" -F \
"ACQUNAME=jc" -F \
"RELATION=Grandson" -F \
"MESSAGE=He's a twerp." -F \
"pics[]=@testdata/model/s06/1.pgm" -F \
"pics[]=@testdata/model/s06/2.pgm" -F \
"pics[]=@testdata/model/s06/3.pgm"`
mytest "$out" "$expect"

# Test 23
echo "Test 23"
curl -sL $host/predict.php -F "pic=@testdata/test/s02/8.pgm" -F "USERNAME=switch202" -o outfile
cat outfile

# Test 24
echo "Test 24"
curl -sL $host/predict.php -F "pic=@testdata/test/s03/8.pgm" -F "USERNAME=switch202" -o outfile
cat outfile

# Test 25
echo "Test 25"
curl -sL $host/predict.php -F "pic=@testdata/test/s01/8.pgm" -F "USERNAME=switch202" -o outfile
cat outfile

# Test 26
echo "Test 26"
curl -sL $host/predict.php -F "pic=@testdata/test/s02/8.pgm" -F "USERNAME=switcher" -o outfile
cat outfile

# Test 27
echo "Test 27"
curl -sL $host/predict.php -F "pic=@testdata/test/s04/8.pgm" -F "USERNAME=switcher" -o outfile
cat outfile

# Test 28
echo "Test 28"
curl -sL $host/predict.php -F "pic=@testdata/test/s06/8.pgm" -F "USERNAME=switch202" -o outfile
cat outfile

# Test 29
echo "Test 29"
curl -sL $host/predict.php -F "pic=@testdata/test/s07/9.pgm" -F "USERNAME=switch202" -o outfile
cat outfile

# Test 30
echo "Test 30"
out=`curl -s $host/relate.php -F \
"USERNAME=switch202" -F \
"ACQUNAME=kk" -F \
"RELATION=CareTaker" -F \
"MESSAGE=He gives you your medication." -F \
"pics[]=@testdata/model/s07/1.pgm" -F \
"pics[]=@testdata/model/s07/2.pgm" -F \
"pics[]=@testdata/model/s07/3.pgm"`

# Test 31
echo "Test 31"
curl -sL $host/predict.php -F "pic=@testdata/test/s07/9.pgm" -F "USERNAME=switch202"
