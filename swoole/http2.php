<?php
$server = new Swoole\Http\Server('0.0.0.0', 9501);
$server->on('Request', function ($request, $response) {
    $channel = new \Swoole\Coroutine\Channel(3);
    go(function () use ($channel) {
        $mysql = new Swoole\Coroutine\MySQL();
        $mysql->connect([
            'host' => '172.26.0.3',
            'user' => 'root',
            'password' => 'root',
            'database' => 'test',
        ]);
        $result = $mysql->query('select sleep(3)');
        $channel->push($result);

    });
    go(function () use ($channel) {
        var_dump(time());   
        $redis1 = new Swoole\Coroutine\Redis();
        $redis1->connect('192.168.112.1', 6379);
        $result = $redis1->set('hello', 'world');
        //var_dump(time());

        $channel->push($result);

    });
    go(function () use ($channel) {
        var_dump(time());

        $redis2 = new Swoole\Coroutine\Redis();
        $redis2->connect('192.168.112.1', 6379);

        $result = $redis2->get('hello');
        $channel->push($result);
    });



    $results=[];
    for($i=0;$i<3;$i++){

        $results[]=$channel->pop();
    }
    $response->end(json_encode([
        'data' => $results,
        'time' => time()
    ]));

});
$server->start();
?>