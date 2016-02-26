<?php
echo exec("/root/facerec/faces train /root/facerec/my.csv");
echo exec("/root/facerec/faces predict /root/facerec/testdata/test/s05/5.pgm");
?>
