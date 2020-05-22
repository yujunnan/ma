<?php
//创建http服务
$server = new Swoole\Http\Server('0.0.0.0', 9501);
//事件绑定
$server->on('Request', function ($request, $response) {
    var_dump(time());
    //创建mysql对象
    $mysql = new Swoole\Coroutine\MySQL();
    //连接mysql网关
    $mysql->connect([
        'host' => '172.26.0.3',
        'user' => 'root',
        'password' => 'root',
        'database' => 'test',
    ]);
    $mysql->setDefer();
    $mysql->query('select sleep(3)');
    var_dump(time());   
    $redis1 = new Swoole\Coroutine\Redis();
    $redis1->connect('192.168.112.1', 6379);
    $redis1->setDefer();
    $redis1->set('hello', 'world');
    var_dump(time());  

    $redis2 = new Swoole\Coroutine\Redis();
    $redis2->connect('192.168.112.1', 6379);
    $redis2->setDefer();
    $redis2->get('hello');
    $result1 = $mysql->recv();
    $result2 = $redis2->recv();
    var_dump($result1, $result2, time());

    $response->end('Request Finish: ' . time());
});

$server->start();
?>