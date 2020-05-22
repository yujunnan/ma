<?php
$process = new swoole_process(function (\Swoole\Process $worker) {

    swoole_event_add($worker->pipe, function ($pipe) use ($worker) {
        // 子进程逻辑
        // 通过管道从主进程读取数据
        $cmd = $worker->read();
        ob_start();
        // 执行外部程序并显示未经处理的原始输出，会直接打印输出
        passthru($cmd);
        //echo $cmd;
        $ret = ob_get_clean() ? : ' ';
        $ret = trim($ret) . ". worker pid:" . $worker->pid . "\n";
        // 将数据写入管道
        $worker->write($ret);
        $worker->exit(0);  // 退出子进程
    });


});  // Process 构造函数第三个参数默认为 true，启用管道，如果第二个参数也设置为 true，则在子进程中可以通过 echo 将数据写入管道

// 启动进程
$process->start();
// 从主进程将通过管道发送数据到子进程
$process->write('php --version');
// 从子进程读取返回数据并打印
$msg = $process->read();
echo 'result from worker: ' . $msg;