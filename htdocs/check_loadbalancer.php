<?php

#####################################################################
#   WARNING   WARNING   WARNING   WARNING   WARNING   WARNING       #
#                                                                   #
# THIS FILE IS MANAGED BY CFENGINE ALL LOCAL CHANGES WILL BE LOST   #
#                                                                   #
#   WARNING   WARNING   WARNING   WARNING   WARNING   WARNING       #
#####################################################################
#


   $hostname = exec('hostname -f');
   $type_srv = substr($hostname,0,3);

   if (! file_exists("/etc/loadbalancer/monitor_UP"))
   {
       $ret_val = 'FALSE ' . $hostname . " is out of the LoadBalancer.<br />";
   }
   else
   {
      switch ($type_srv)
      {
          case "sol":
              $url = 'http://localhost:8983/solr/check.txt';
              break;
          case "web":
              $url = 'http://localhost/check.txt';
              break;
          case "img":
              $url = 'http://localhost/api/check.txt';
              break;
      }

      $result = file_get_contents($url);

      if (trim($result) <> 'OK')
         $ret_val = 'FALSE ' . $hostname .   ' URL is unreachable, system will be taken out of the LoadBalancer.<br />';
      else
         $ret_val = 'TRUE';
   }

   exit ($ret_val);
?>

