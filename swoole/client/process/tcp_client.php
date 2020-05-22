<?php
namespace Swoole;

// Swoole4以后通过协程来实现异步通信
go(function () {
    $client = new Coroutine\Client(SWOOLE_SOCK_TCP);
    // 尝试与指定 TCP 服务端建立连接（IP和端口号需要与服务端保持一致，超时时间为0.5秒）
    if ($client->connect("0.0.0.0", 9501, 0.5)) {
        // 建立连接后发送内容
        $client->send("hello world\n");
        // 打印接收到的消息
        echo $client->recv();
        // 关闭连接
        $client->close();
    } else {
        echo "connect failed.";
    }
});