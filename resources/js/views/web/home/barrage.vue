<style lang="scss" scoped>
    #danmu {
        font-family: 'Avenir', Helvetica, Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        text-align: center;
        color: #2c3e50;
    }
    .stage {
        height: 300px;
        width: 100%;

        margin: 0;
        position: relative;
        overflow: hidden;
    }

    h1, h2 {
        font-weight: normal;
    }
    ul {
        list-style-type: none;
        padding: 0;
    }
    li {
        display: inline-block;
        margin: 0 10px;
    }

    a {
        color: #42b983;
    }

    .baberrage-stage {
        z-index: 5;
    }

    .baberrage-stage .baberrage-item.normal{
        color:#FFF;
    }
    .top{
        border:1px solid #66aabb;
    }
    .danmu-control{
        position: absolute;
        margin: 0 auto;
        width: 100%;
        bottom: 300px;
        top: 70%;
        height: 69px;
        box-sizing: border-box;
        text-align: center;
        display: flex;
        justify-content: center;
        div {
            width: 300px;
            background: rgba(0, 0, 0, 0.6);
            padding: 15px;
            border-radius: 5px;
            border: 2px solid #8ad9ff;
        }
        input,button,select{
            height:35px;
            padding:0;
            float:left;
            background:#027fbb;
            border:1px solid #CCC;
            color:#FFF;
            border-radius:0;
            width:18%;
            box-sizing: border-box;
        }
        select{
            height:33px;
            margin-top:1px;
            border: 0px;
            outline: 1px solid rgb(204,204,204);
        }
        input{
            width:64%;
            height:35px;
            background:rgba(0,0,0,.7);
            border:1px solid #8ad9ff;
            padding-left:5px;
            color:#FFF;
        }
    }
</style>
<template>
    <div id="barrage">
        <div class="stage">

        </div>
        <div class="danmu-control">

        </div>

    </div>
</template>


<script>

</script>
