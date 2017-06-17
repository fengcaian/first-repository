/**
 * 
 */
var http = require('http');
var fs = require('fs');
var cheerio = require('cheerio');
var request = require('request');
var i =0;
var url = 'http://www.ss.pku.edu.cn/index.php/newscenter/news/2391';
//初始化url
function fetchPage(x){//封装一层函数
    startRequest(x);
}

function startRequest(x){
    //采用http模块向服务器发送一次get请求
    http.get(x,funciton(res) {
        var html = '';//用来存储请求页面的整个html内容
        var titles = [];
        res.setEncoding('utf-8');//防止中文乱码
        //监听data事件,每次取一块数据
        res.on('data',function(chunk){
            html += chunk;
        });
        //监听end事件，如果整个页面内容的html都获取完毕，就执行回调函数
        res.on('end',function(){
            var $ = cheerio.load(html);//采用cheerio模块解析html
            var time = $('.article-info a:first-child').next().next().trim();
            var news_item = {
                //获取文章的标题
                title:$('div.article-title a').next().trim(),
                //获取文章发布的时间
                Time:time,
                //获取当前文章的url
                link:'http://www.ss.pku.edu.cn'+$('div.article-title a').attr('href'),
                //获取供稿单位
                author:$('[title=供稿]').text().trim(),
                //i用来判断获取了多少篇文章
                i:i=i+1
            };
            console.log(news_item);//打印新闻信息
            var news_title = $('div.article-title a').text().trim();
            saveContent($,news_title);//存储每篇文章的内容及文章标题
            saveImg($,news_title);//存储每篇文章的图片及图片标题
            //下一篇文章的url
            var nextLink = 'http://www.ss.pku.edu.cn'+$('li.next a').attr('href'),
            strl = nextLink.split('-');//去掉url后面的中文
            str = encodeURI(strl[0]);
            //这是亮点之一，通过控制i,可以控制爬取多少篇文章
            if(i<=500){
                fetchPage(str);
            }
        });
    }).on('error',function(err){
            console.log(err);
    });
}

function saveContent($,news_title){
    $('.article-content p').each(function (index,item){
        var x = $(this).text();
        var y = x.substring(0,2).trim();
        if(y == ''){
            x = x+'\n';
            //将新闻文本内容一段一段添加到/data文件夹下，并用新闻的标题来命名文件
            fs.appendFile('./data/'+news_title+'.text',x,'utf-8',function(err){
                if(err){
                    console.log(err);
                }
            })
        }
    })
}

function saveImg($,news_title){
    $('.article-content img').each(function(index,item){
        var img_title =$(this).parent().next().next().trim();//获取图片的标题
        if(img_title.length>35 || img_title==''){
            img_title = 'Null';
        }
        var img_filename = img_title+'.jpg';
        var img_src = 'http://www.ss.pku.edu.cn'+$(this).attr('src');//获取图片的url
        //采用request模块，向服务器发起一次请求，获取图片资源
        request.head(img_src,function(err,res,body){
            if(err){
                console.log(err);
            }
        });
        //通过流的方式，把图片写到本地/image目录下，并用新闻的标题和图片的标题作为图片的名称
        request(img_src).pipe(fs.createWriteStream('./image/'+news-title+'---'+img_filename));
    })
}
fetchPage(url);//主程序运行