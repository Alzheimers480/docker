# Debug flag
# Uncomment to debug script
# set -x

# To run this server functionality test, you first need to restart the server
# the remoter script should work, if not, read the source code which shows
# how to remotely restart the server

host=141.210.25.46

# create users
# do we really want passord dupe checking server side?
function mytest {
    if [ "$1" == "$2" ]
    then echo "Test passed"
    else
	echo "Test failed"
	echo $1
    fi
}

expect="True"
out=`curl -s $host/newuser.php -F \
"USERNAME=switch202" -F \
"PASSWORD=password" -F \
"PASSWORD2=password" -F \
"FNAME=Gary" -F \
"LNAME=McDermin" -F \
"EMAIL=scnolton@oakland.edu"`
mytest "$out" "$expect"

expect="True"
out=`curl -s $host/newuser.php -F \
"USERNAME=switcher" -F \
"PASSWORD=password" -F \
"PASSWORD2=password" -F \
"FNAME=Janice" -F \
"LNAME=Oldman" -F \
"EMAIL=scnolton@oakland.edu"`
mytest "$out" "$expect"

expect="New Acquaintance Created"
out=`curl -s $host/newacqu.php -F \
"USERNAME=ruby" -F \
"FNAME=Mark" -F \
"LNAME=Zineberg"`
mytest "$out" "$expect"

expect="True"
out=`curl -s $host/newuser.php -F \
"USERNAME=switch202" -F \
"PASSWORD=nimrod" -F \
"PASSWORD2=nimoy" -F \
"FNAME=Smorty" -F \
"LNAME=Gringlestein" -F \
"EMAIL=ramseybolton@oakland.edu"`
mytest "$out" "$expect"

expect="New Acquaintance Created"
out=`curl -s $host/newacqu.php -F \
"USERNAME=looby" -F \
"FNAME=Larry" -F \
"LNAME=McDermin"`
mytest "$out" "$expect"

expect="New Acquaintance Created"
out=`curl -s $host/newacqu.php -F \
"USERNAME=scooby" -F \
"FNAME=Smiles" -F \
"LNAME=McDermin"`
mytest "$out" "$expect"

expect="New Acquaintance Created"
out=`curl -s $host/newacqu.php -F \
"USERNAME=limby" -F \
"FNAME=Johnny" -F \
"LNAME=Grim"`
mytest "$out" "$expect"

expect="New Acquaintance Created"
out=`curl -s $host/newacqu.php -F \
"USERNAME=jc" -F \
"FNAME=Jimmy" -F \
"LNAME=Cringles"`
mytest "$out" "$expect"

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

expect="True"
out=`curl -s $host/relate.php -F \
"USERNAME=switch202" -F \
"ACQUNAME=jc" -F \
"RELATION=Grandson" -F \
"MESSAGE=My grandson. He's a twerp." -F \
"pics[]=@testdata/model/s06/1.pgm" -F \
"pics[]=@testdata/model/s06/2.pgm" -F \
"pics[]=@testdata/model/s06/3.pgm"`
mytest "$out" "$expect"

curl -sL $host/predict.php -F "pic=@testdata/test/s02/8.pgm" -F "USERNAME=switch202" -o outfile
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

curl -sL $host/predict.php -F "pic=@testdata/test/s03/8.pgm" -F "USERNAME=switch202" -o outfile
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

curl -sL $host/predict.php -F "pic=@testdata/test/s01/8.pgm" -F "USERNAME=switch202" -o outfile
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

curl -sL $host/predict.php -F "pic=@testdata/test/s02/8.pgm" -F "USERNAME=switcher" -o outfile
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

curl -sL $host/predict.php -F "pic=@testdata/test/s04/8.pgm" -F "USERNAME=switcher" -o outfile
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

curl -sL $host/predict.php -F "pic=@testdata/test/s06/8.pgm" -F "USERNAME=switch202" -o outfile
awk -f my.awk outfile > info
cat info
