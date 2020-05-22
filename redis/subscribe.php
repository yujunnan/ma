<?php
   $redis= new Redis();
   $redis->connect('192.168.112.1',6379);
   $redis->subscribe(['order'],function ($redis, $chan, $msg) {
     	var_dump($redis);
      var_dump($chan);
      var_dump($msg);
  });	




?>
