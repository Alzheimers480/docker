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

out=`curl -s $host/newuser.php -F \
"USERNAME=scnolton" -F \
"PASSWORD=p" -F \
"PASSWORD2=p" -F \
"FNAME=Gary" -F \
"LNAME=McDermin" -F \
"EMAIL=scnolton@oakland.edu"`
echo $out

out=`curl -s $host/newacqu.php -F \
"USERNAME=brad" -F \
"FNAME=Brad" -F \
"LNAME=Wells" -F \
"GENDER=male"`
echo $out

out=`curl -s $host/newacqu.php -F \
"USERNAME=chris" -F \
"FNAME=Chris" -F \
"LNAME=Wenson" -F \
"GENDER=male"`
echo $out

out=`curl -s $host/newacqu.php -F \
"USERNAME=dan" -F \
"FNAME=Dan" -F \
"LNAME=Craun" -F \
"GENDER=male"`
echo $out

out=`curl -s $host/newacqu.php -F \
"USERNAME=dario" -F \
"FNAME=Dario" -F \
"LNAME=Strazimiri" -F \
"GENDER=male"`
echo $out

out=`curl -s $host/newacqu.php -F \
"USERNAME=david" -F \
"FNAME=David" -F \
"LNAME=Wagenbach" -F \
"GENDER=male"`
echo $out

out=`curl -s $host/newacqu.php -F \
"USERNAME=greg" -F \
"FNAME=Greg" -F \
"LNAME=Terry" -F \
"GENDER=male"`
echo $out

out=`curl -s $host/newacqu.php -F \
"USERNAME=isaac" -F \
"FNAME=Isaac" -F \
"LNAME=Mehreteab" -F \
"GENDER=male"`
echo $out

out=`curl -s $host/newacqu.php -F \
"USERNAME=joash" -F \
"FNAME=Joash" -F \
"LNAME=Dace" -F \
"GENDER=male"`
echo $out

out=`curl -s $host/newacqu.php -F \
"USERNAME=vani" -F \
"FNAME=Vani" -F \
"LNAME=Yedam" -F \
"GENDER=female"`
echo $out

out=`curl -s $host/relate.php -F \
"USERNAME=scnolton" -F \
"ACQUNAME=brad" -F \
"RELATION=coworker" -F \
"MESSAGE=A neat guy" -F \
"pics[]=@pics/brad_wells/1.jpg" -F \
"pics[]=@pics/brad_wells/2.jpg" -F \
"pics[]=@pics/brad_wells/3.jpg"`
echo $out

out=`curl -s $host/relate.php -F \
"USERNAME=scnolton" -F \
"ACQUNAME=chris" -F \
"RELATION=coworker" -F \
"MESSAGE=Awesome guy" -F \
"pics[]=@pics/chris_wenson/1.jpg" -F \
"pics[]=@pics/chris_wenson/2.jpg" -F \
"pics[]=@pics/chris_wenson/3.jpg"`
echo $out

out=`curl -s $host/relate.php -F \
"USERNAME=scnolton" -F \
"ACQUNAME=dan" -F \
"RELATION=coworker" -F \
"MESSAGE=Coolest dude" -F \
"pics[]=@pics/dan_craun/1.jpg" -F \
"pics[]=@pics/dan_craun/2.jpg" -F \
"pics[]=@pics/dan_craun/3.jpg"`
echo $out

out=`curl -s $host/relate.php -F \
"USERNAME=scnolton" -F \
"ACQUNAME=dario" -F \
"RELATION=classmate" -F \
"MESSAGE=Smartest man alive" -F \
"pics[]=@pics/dario/1.jpg" -F \
"pics[]=@pics/dario/2.jpg" -F \
"pics[]=@pics/dario/3.jpg"`
echo $out

out=`curl -s $host/relate.php -F \
"USERNAME=scnolton" -F \
"ACQUNAME=david" -F \
"RELATION=Coworker" -F \
"MESSAGE=My bestie" -F \
"pics[]=@pics/david_wagenbach/1.jpg" -F \
"pics[]=@pics/david_wagenbach/2.jpg" -F \
"pics[]=@pics/david_wagenbach/3.jpg"`
echo $out

out=`curl -s $host/relate.php -F \
"USERNAME=scnolton" -F \
"ACQUNAME=greg" -F \
"RELATION=coworker" -F \
"MESSAGE=Interesting man" -F \
"pics[]=@pics/greg_terry/1.jpg" -F \
"pics[]=@pics/greg_terry/2.jpg" -F \
"pics[]=@pics/greg_terry/3.jpg"`
echo $out

out=`curl -s $host/relate.php -F \
"USERNAME=scnolton" -F \
"ACQUNAME=isaac" -F \
"RELATION=classmate" -F \
"MESSAGE=The most interesting man in the world" -F \
"pics[]=@pics/isaac/1.jpg" -F \
"pics[]=@pics/isaac/2.jpg" -F \
"pics[]=@pics/isaac/3.jpg"`
echo $out

out=`curl -s $host/relate.php -F \
"USERNAME=scnolton" -F \
"ACQUNAME=joash" -F \
"RELATION=coworker" -F \
"MESSAGE=Tallest man in the world" -F \
"pics[]=@pics/joash_dace/1.jpg" -F \
"pics[]=@pics/joash_dace/2.jpg"`
echo $out

out=`curl -s $host/relate.php -F \
"USERNAME=scnolton" -F \
"ACQUNAME=vani" -F \
"RELATION=coworker" -F \
"MESSAGE=shes the hardest worker" -F \
"pics[]=@pics/vani_yedam/1.jpg" -F \
"pics[]=@pics/vani_yedam/2.jpg" -F \
"pics[]=@pics/vani_yedam/3.jpg"`
echo $out

out=`curl -s $host/modacqu.php -F \
"USERNAME=scnolton" -F \
"ACQUNAME=joash" -F \
"pics[]=@pics/joash_dace/3.jpg"`
echo $out
