<?php
//设置进程数
$workerNum = 5;
//创建进程池
$pool = new Swoole\Process\Pool($workerNum);

$pool->on("WorkerStart", function ($pool, $workerId) {
    echo "Worker#{$workerId} is started\n";
    $redis = new Redis();
    $redis->pconnect('192.168.112.1', 6379);
    $key = "key1";
    while (true) {
        $msgs = $redis->brpop($key, 2);
        
        if ( $msgs == null) continue;
        var_dump($msgs);
        echo "Processed by Worker#{$workerId}\n";
    }
});

$pool->on("WorkerStop", function ($pool, $workerId) {
    echo "Worker#{$workerId} is stopped\n";
});

$pool->start();