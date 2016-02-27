<?php
echo exec("../facerec/faces train ../facerec/my.csv");
echo exec("../facerec/faces predict ../facerec/testdata/test/s08/5.pgm");
?>
