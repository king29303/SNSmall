<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<script type="text/javascript">
function sendSns(sns, url, txt)
{
	alert(sns+", "+url+", "+txt);
    var o;
    var _url = encodeURIComponent(url);
    var _txt = encodeURIComponent(txt);
    var _br  = encodeURIComponent('\r\n');
 
    switch(sns)
    {
        case 'facebook':
            o = {
                method:'popup',
                url:'http://www.facebook.com/sharer/sharer.php?u=' + _url
      		  };
            break;
 
        case 'twitter':
            o = {
                method:'popup',
                url:'http://twitter.com/intent/tweet?text=' + _txt + '&url=' + _url
            };
            break;
 
         case 'blog':
            o = {
                method:'popup',
                url:"http://blog.naver.com/openapi/share?url=" + _url + "&title=" + _txt
            };
            break; 
         case 'google':
            o = {
                method:'popup',
                url:"https://plus.google.com/share?url=" + _url + "&text=" + _txt
            };
            break; 
         case 'line':
            o = {
                method:'popup',
                url:"http://line.me/R/msg/text/?url=" + _url + " " + _txt
            };
            break; 
         case 'pholar':
            o = {
                method:'popup',
                url:"http://www.pholar.co/spi/rephol?url=" + _url + "&title=" + _txt
            };
            break; 
            
        case 'me2day' :
        	o = {
        		method:'popup',
                url:'http://me2day.net/posts/new?new_post[body]=' + _txt + _br + _url + '&new_post[tags]=epiloum'
      	    }
        	break;
 
        case 'kakaotalk':
            o = {
                method:'web2app',
                param:'sendurl?msg=' + _txt + '&url=' + _url + '&type=link&apiver=2.0.1&appver=2.0&appid=dev.epiloum.net&appname=' + encodeURIComponent('Epiloum 개발노트'),
                a_store:'itms-apps://itunes.apple.com/app/id362057947?mt=8',
                g_store:'market://details?id=com.kakao.talk',
                a_proto:'kakaolink://',
                g_proto:'scheme=kakaolink;package=com.kakao.talk'
            };
            break;
 
        case 'kakaostory':
            o = {
                method:'web2app',
                param:'posting?post=' + _txt + _br + _url + '&apiver=1.0&appver=2.0&appid=dev.epiloum.net&appname=' + encodeURIComponent('Epiloum 개발노트'),
                a_store:'itms-apps://itunes.apple.com/app/id486244601?mt=8',
                g_store:'market://details?id=com.kakao.story',
                a_proto:'storylink://',
                g_proto:'scheme=kakaolink;package=com.kakao.story'
            };
            break;
 
        case 'band':
            o = {
                method:'web2app',
                param:'create/post?text=' + _txt + _br + _url,
                a_store:'itms-apps://itunes.apple.com/app/id542613198?mt=8',
                g_store:'market://details?id=com.nhn.android.band',
                a_proto:'bandapp://',
                g_proto:'scheme=bandapp;package=com.nhn.android.band'
            };
            break;
 
        default:
            alert('지원하지 않는 SNS입니다.');
            return false;
    }
 
    switch(o.method)
    {
        case 'popup':
            window.open(o.url);
            break;
 
        case 'web2app':
            if(navigator.userAgent.match(/android/i))
            {
                // Android
                setTimeout(function(){ location.href = 'intent://' + o.param + '#Intent;' + o.g_proto + ';end'}, 100);
            }
            else if(navigator.userAgent.match(/(iphone)|(ipod)|(ipad)/i))
            {
                // Apple
                setTimeout(function(){ location.href = o.a_store; }, 200);          
                setTimeout(function(){ location.href = o.a_proto + o.param }, 100);
            }
            else
            {
                alert('이 기능은 모바일에서만 사용할 수 있습니다.');
            }
            break;
    }
}
</script>
<body>
    <div id='fb-root'></div>
    <script src='http://connect.facebook.net/en_US/all.js'></script>
    <p><a onclick='postToFeed(); return false;'>Post to Feed</a></p>
    <p id='msg'></p>
 
    <script> 
      FB.init({appId: "1185421938235757", status: true, cookie: true});
 
      function postToFeed() {
 
        // calling the API ...
        var obj = {
          method: 'feed',
          link: 'https://developers.facebook.com/docs/reference/dialogs/',
          picture: 'http://fbrell.com/f8.jpg',
          name: 'Facebook Dialogs',
          caption: 'Reference Documentation',
          description: 'Using Dialogs to interact with people.',
        };
 
        function callback(response) {
          document.getElementById('msg').innerHTML = "Post ID: " + response['post_id'];
        }
 
        FB.ui(obj, callback);
      }
 
    </script>
<button onclick="sendSns('facebook', 'http://sunju635.cafe24.com/SNSmall/index.jsp', '안녕')">페이스북</button>
<button onclick="sendSns('kakaotalk', 'http://localhost:8080/Test/sns_test.jsp', '안녕')">카카오</button>
<button onclick="sendSns('twitter', 'http://localhost:8080/Test/sns_test.jsp', '안녕')">트위터</button>
<button onclick="sendSns('me2day', 'http://localhost:8080/Test/sns_test.jsp', '안녕')">me2day</button>
<button onclick="sendSns('kakaostory', 'http://localhost:8080/Test/sns_test.jsp', '안녕')">kakaostory</button>
<button onclick="sendSns('band', 'http://localhost:8080/Test/sns_test.jsp', '안녕')">band</button>
<button onclick="sendSns('blog', 'http://localhost:8080/Test/sns_test.jsp', '안녕')">블로그</button>
<button onclick="sendSns('line', 'http://localhost:8080/Test/sns_test.jsp', '안녕')">라인</button>
<button onclick="sendSns('pholar', 'http://localhost:8080/Test/sns_test.jsp', '안녕')">pholar</button>
<button onclick="sendSns('google', 'http://www.naver.com', '안녕')">google</button>
</body>
</html>