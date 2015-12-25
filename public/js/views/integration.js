$(document).ready(function(){

  function syntaxHighlight(json) {
    json = json.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
    return json.replace(/("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/g, function (match) {
      var cls = 'number';
      if (/^"/.test(match)) {
        if (/:$/.test(match)) {
          cls = 'key';
        } else {
          cls = 'string';
        }
      } else if (/true|false/.test(match)) {
        cls = 'boolean';
      } else if (/null/.test(match)) {
        cls = 'null';
      }
      return '<span class="' + cls + '">' + match + '</span>';
    });
  }

  $("#mikecrm").click(function(){
    var socket = io();
    socket.emit('first connect', 'hello world');

    socket.on('hashid', function(hashid){
      console.log("hashId :", hashid);
      $(".prompt").html("webhook: www.jianliao.com/webook/mikecrm/" + hashid);
    });

    socket.on('message', function(msg){
      // $(".message").append(document.createElement('pre')).html(syntaxHighlight(msg));
      // console.log("message from server", syntaxHighlight(msg));

      // var obj = {a:1, 'b':'foo', c:[false,'false',null, 'null', {d:{e:1.3e5,f:'1.3e5'}}]};
      // var str = JSON.stringify(obj, undefined, 4);
      // $(".message").append(document.createElement('pre')).html(str);

      // var obj = {a:1, 'b':'foo', c:[false,'false',null, 'null', {d:{e:1.3e5,f:'1.3e5'}}]};
      // document.getElementById("json").innerHTML = JSON.stringify(obj, undefined, 2);

      document.getElementById("json").innerHTML = msg;
    });

  });
});
