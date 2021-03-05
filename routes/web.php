<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/', function () {
   
   return view('welcome');
});
Route::get('/task/test', function () {
   $task = new \App\Jobs\TestTask('测试异步任务');
   $success = \Hhxsv5\LaravelS\Swoole\Task\Task::deliver($task);  //异步投递任务，触发调用任务类的 handle 方法
   var_dump($success);
});
Route::get('/event/test', function () {
   $event = new \App\Events\TestEvent('测试异步事件监听及处理');
   $success = \Hhxsv5\LaravelS\Swoole\Task\Event::fire($event);
   var_dump($success);
});
Route::get('/test','TestController@index');
Route::get('/test/spike','TestController@spike');
Route::get('/test/redis/spike','TestController@redis_spike');
Route::get('/test/redis/spike2','TestController@redis_spike2');
Route::get('/test/redis/spike3','TestController@redis_spike3');

/**
 * redis实战
 *
 * 实现悲观锁机制
 *
 */
Route::get('/pessimistic_lock', function () {
   //暂停
   $timeout = 5000;
   //实例化redis
   $redis=new \Redis();
   $redis->connect('192.168.112.1', 6379);
   do{
      
      $microtime=microtime(true)*1000;
      $microtime_time = date('Y-m-d H:i:s',$microtime);
      echo "执行microtime:{$microtime} ";
      echo "执行microtime_time:{$microtime_time} ";
      echo '<pre>';
      $microtimeout=$microtime+$timeout+1;
      $microtimeout_time = date('Y-m-d H:i:s',$microtimeout);
      echo "执行microtimeout_time:{$microtimeout_time} ";
      echo '<pre>';
      // 上锁
      $isLock = $redis->setnx('lock.count', $microtimeout);
      if(!$isLock){
         $getTime = $redis->get('lock.count');
         // 睡眠 降低抢锁频率　缓解redis压力
         usleep(5000);
         // 未超时继续等待
         continue;
      }
      // 超时,抢锁,可能有几毫秒级时间差可忽略
      $previousTime = $redis->getset('lock.count', $microtimeout);
      if ((int)$previousTime < $microtime) {
         break;
      }

   }while(!$isLock);
   $count = $redis->get('count')? : 0;
   // file_put_contents('/var/log/count.log.1', ($count+1));
   // 业务逻辑
   echo "执行count加1操作～ ";
   echo '<pre>';
   $redis->set('count', $count+1);
   // 删除锁
   $redis->del('lock.count');
   // 打印count值
   $count = $redis->get('count');
   echo "count值为：$count ";
   echo '<pre>';

});
/**
 * string 是 redis 最基本的数据类型。一个 key 对应一个 value。
 *
 * string 是二进制安全的。也就是说 redis 的 string 可以包含任何数据。比如 jpg 图片或者序列化的对象。
 *string 类型是 redis 最基本的数据类型，string 类型的值最大能存储 512 MB。
 */
Route::get('/redis/string', function () {
   $redis=new Redis();
   $redis->connect('192.168.112.1', 6379);
   $redis->set("count",1);
   $yujunnan=$redis->get("count");
   var_dump($yujunnan);
});
Route::get('/redis/getstring', function () {
   $redis=new Redis();
   $redis->connect('192.168.112.1', 6379);
   $yujunnan=$redis->get("count");
   var_dump($yujunnan);
});
/**
 * Redis hash 是一个键值对（key - value）集合。
 * Redis hash 是一个 string 类型的 key 和 value 的映射表，hash 特别适合用于存储对象。
 * 理解：可以将 hash 看成一个 key - value 的集合。也可以将其想成一个 hash 对应着多个 string。
 * 与 string 区别：string 是 一个 key - value 键值对，而 hash 是多个 key - value 键值对。
 */
Route::get('/redis/hash', function () {
   $redis=new Redis();
   $redis->connect('192.168.112.1', 6379);
   $redis->hset("hash-key","sub-key1","value1");
   $redis->hset("hash-key","sub-key2","value2");
   $redis->hset("hash-key","sub-key3",array("111","111"));   
   $hgetall=$redis->hgetall("hash-key");
   $redis->hdel("hash-key","sub-key1");
   $redis->hdel("hash-key","sub-key2");
   $redis->hdel("hash-key","sub-key3");  

   
});
/**
 * Redis 列表是简单的字符串列表，按照插入顺序排序。我们可以网列表的左边或者右边添加元素。
 * 
 */
Route::get('/redis/list', function () {
   $redis=new Redis();
   $redis->connect('192.168.112.1', 6379);
   $redis->rpush("list-key",array(1,2,3)); 
   $redis->rpush("list-key","v2");  
   $redis->rpush("list-key","v1"); 
   $lrange= $redis->lrange("list-key",0,-1);
   var_dump($lrange);
   $redis->lindex("list-key",1);//"v2" 
   $redis->lpop("list"); //(nil) 
   $redis->lpop("list-key"); //v1
   $redis->lpop("list-key"); //v1

});
/**
 * redis 的 set 是字符串类型的无序集合。集合是通过哈希表实现的，因此添加、删除、查找的复杂度都是 O（1）
 * 
 */
Route::get('/redis/set', function () {
   $redis=new Redis();
   $redis->connect('192.168.112.1', 6379);

   $redis->smembers('k1');
   $r6=$redis->srem('k1','v2');
   $r5=$redis->smembers('k1');
});
/**
 * 订阅端代码
 */
Route::get('/redis/zset', function () {
   $redis=new Redis();
   $redis->connect('192.168.112.1', 6379);

   $redis->zadd('zset-key','728','member1');
   $redis->zadd('zset-key','982','member0');
   $zrange=$redis->zrange('zset-key',0,1,'withscores');
   $redis->zrem('zset-key','member1');

});
/**
 *发布端代码
 */
Route::get('/redis/subscribe', function () {
   $redis = new Redis();
   $redis->connect('192.168.112.1', 6379);
   $redis->subscribe(['order'], function ($redis, $chan, $msg) {
      var_dump($redis);
      var_dump($chan);
      var_dump($msg);
  });

});
/**
 * 订阅端代码
 */
Route::get('/redis/publish', function () {
   $redis = new Redis();
   $redis->connect('192.168.112.1', 6379);
   $order = [
       'id' => 1,
       'name' => '小米6',
       'price' => 2499,
       'created_at' => '2017-07-14'
   ];
   $redis->publish("order", json_encode($order));
});

/**
 * 事物
 */
Route::get('/redis/multi', function () {
   $redis = new Redis();
   $redis->connect('192.168.112.1', 6379);
   $redis->multi();
   $redis->set("book-name","Mastering C++ in 21 days"); 
   $redis->get("book-name"); 
   $redis->sadd("tag","C++","Programming","Mastering Series");
   $smembers=$redis->smembers("tag");
   $redis->exec();
   
});
/**
 * redis实战
 *
 * 实现乐观锁机制
 *
 * @example php optimistic-lock.php
 */
Route::get('/redis/optimistic_lock', function () {
   header('content-type:text/html;chaeset=utf-8');
   $redis = new Redis();
   $redis->connect('192.168.112.1', 6379);
   // 监视 count 值
   $redis->watch('count');
   // 开启事务
   $redis->multi();
   // 操作count
   $time = time();
   $redis->set('count', $time);
   //-------------------------------
   /**
    * 模拟并发下其他进程进行set count操作 请执行下面操作
    *
    * redis-cli 执行 $redis->set('count', 'is simulate'); 模拟其他终端
    */
   //sleep(10);
   //-------------------------------
   // 提交事务
   $res = $redis->exec();
   if ($res) {
    //成功...
    echo 'success:' . $time;
    return;
   }
   // 失败...
   echo 'fail:' . $time;   
});
/**
 * 分布式锁及死锁处理
 *
 * Distributed lock
 * @example 
 */

Route::get('/redis/struct', function () {

});
Route::get('/member', function () {
    return view('member');
});



Route::get('aa/list','Article\ArticleController@index');

Route::get('/home', 'HomeController@index')->name('home');
