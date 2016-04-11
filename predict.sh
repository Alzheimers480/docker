# Uncomment to debug script
# set -x

# To run this server functionality test, you first need to restart the server
# the remoter script should work, if not, read the source code which shows
# how to remotely restart the server
host=141.210.25.46
#host=192.168.99.100

# create users

echo "brad Wells"
curl -sL $host/predict.php -F "pic=@pics/brad_wells/4.jpg" -F "USERNAME=scnolton" -o myFile
cat myFile
echo "Chris wenson"
curl -sL $host/predict.php -F "pic=@pics/chris_wenson/4.jpg" -F "USERNAME=scnolton" -o myFile
cat myFile
echo "dan craun"
curl -sL $host/predict.php -F "pic=@pics/dan_craun/4.jpg" -F "USERNAME=scnolton" -o myFile
cat myFile
echo "dario"
curl -sL $host/predict.php -F "pic=@pics/dario/4.jpg" -F "USERNAME=scnolton" -o myFile
cat myFile
echo "david wagen"
curl -sL $host/predict.php -F "pic=@pics/david_wagenbach/4.jpg" -F "USERNAME=scnolton" -o myFile
cat myFile
echo "greg terry"
curl -sL $host/predict.php -F "pic=@pics/greg_terry/4.jpg" -F "USERNAME=scnolton" -o myFile
cat myFile
echo "isaac"
curl -sL $host/predict.php -F "pic=@pics/isaac/4.jpg" -F "USERNAME=scnolton" -o myFile
cat myFile
echo "josh dace"
curl -sL $host/predict.php -F "pic=@pics/joash_dace/4.jpg" -F "USERNAME=scnolton" -o myFile
cat myFile
echo "vani yedam"
curl -sL $host/predict.php -F "pic=@pics/vani_yedam/4.jpg" -F "USERNAME=scnolton" -o myFile
cat myFile


