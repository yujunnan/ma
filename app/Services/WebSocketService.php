<?php
namespace App\Services;
use Hhxsv5\LaravelS\Swoole\WebSocketHandlerInterface;
use Illuminate\Support\Facades\Log;
use Swoole\Http\Request;
use Swoole\WebSocket\Frame;
use Swoole\WebSocket\Server;
class WebSocketService implements WebSocketHandlerInterface
{
    public function __construct()
    {

    }

    // 连接建立时触发
    public function onOpen(Server $server, Request $request)
    {
        // 在触发 WebSocket 连接建立事件之前，Laravel 应用初始化的生命周期已经结束，你可以在这里获取 Laravel 请求和会话数据
        // 调用 push 方法向客户端推送数据，fd 是客户端连接标识字段
        Log::info('WebSocket 连接建立');
        //$server->push($request->fd, 'Welcome to WebSocket Server built on LaravelS');
    }

    // 收到消息时触发
    public function onMessage(Server $server, Frame $frame)
    {
        // $frame->fd 是客户端 id，$frame->data 是客户端发送的数据
        Log::info("从 {$frame->fd} 接收到的数据: {$frame->data}");
        foreach($server->connections as $fd){
            if (!$server->isEstablished($fd)) {
                // 如果连接不可用则忽略
                continue;
            }
            $server->push($fd , $frame->data); // 服务端通过 push 方法向所有连接的客户端发送数据
        }
    }

    // 关闭连接时触发
    public function onClose(Server $server, $fd, $reactorId)
    {
        Log::info('WebSocket 连接关闭');
    }
}