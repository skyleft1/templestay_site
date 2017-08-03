var MyApp = {}

var download = function download(tempfilename, filename) {
	var f = document.createElement('form');
	f.setAttribute('method','post');
	f.setAttribute('action','/download');
	f.setAttribute('enctype','application/x-www-form-urlencoded');
	document.body.appendChild(f);
	
	
	var i = document.createElement('input'); //input element, hidden
	i.type = 'text';
	i.name = 'tempfilename';
	i.value = tempfilename;
	f.appendChild(i);

	var i = document.createElement('input'); //input element, hidden
	i.type = 'text';
	i.name = 'filename';
	i.value = filename;
	f.appendChild(i);
	
	f.submit();
};

 
var sendpost = function sendpost(url, params) {
	var f = document.createElement('form');
	f.setAttribute('method','post');
	f.setAttribute('action',url);
	f.setAttribute('enctype','application/x-www-form-urlencoded');
	document.body.appendChild(f);
	
	for(var element in params){
		if(typeof params[element] != 'function' ){
			
			var i = document.createElement('input'); //input element, hidden
			i.type = 'text';
			i.name = element;
			i.value = params[element];
			f.appendChild(i);
			
		}
	}
	f.submit();
};


var delete_AttachFile = function delete_AttachFile(attachfileno) {
	var chk = confirm("정말로 삭제하시겠습니까?");
	if(chk == true){
	$.ajax({
        url : '/board/attachfiledelete',
        data: { 'attachfileno': attachfileno },   // 사용하는 경우에는 { data1:'test1', data2:'test2' }
        type: 'post',       // get, post
        timeout: 30000,     // 30초
        dataType: 'html',   // text, html, xml, json, jsonp, script
    }).done( function(data, textStatus, xhr ){
        // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
    	// 즉 DB에서는 삭제가 되었다는 의미
        if(data != null ){
            $('.attachfilelist a[attachfileno="' + attachfileno +'"]').parent().remove();
        }
        else {
            alert( '댓글 삭제 실패');
        }
    });
    return false;
    };
}

// 댓글쓰기
var comment_write = function comment_write(articleno, memo) {
    $.ajax({
        url : '/board/article_comment_write' 
        , data: { 'articleno': articleno, 'memo': memo },   // 사용하는 경우에는 { data1:'test1', data2:'test2' }
        type: 'post',       // get, post
        timeout: 30000,     // 30초
        dataType: 'html',   // text, html, xml, json, jsonp, script
    }).done( function(data, textStatus, xhr ){
        // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
        if(data != null ){
        	
            $('.comment_list').append( data );
            $('textarea').val('');
        }
        else {
            alert( '댓글 추가 실패');
        }
    });
    return false;
    };


    // 댓글 수정
var comment_modify = function comment_modify(commentno) {
	var textarea = $('div[commentno="' + commentno + '"] textarea');
	// 댓글 내용을 textarea에 담아 data로 controller에 쏴준다.
    $.ajax({
        url : '/board/article_comment_modify' 
        , data: { 'commentno': commentno, 'memo' : $(textarea).val() },   // 사용하는 경우에는 { data1:'test1', data2:'test2' }
        type: 'post',       // get, post
        timeout: 30000,     // 30초
        dataType: 'json',   // text, html, xml, json, jsonp, script
    }).done( function(data, textStatus, xhr ){
        // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
        if(data != null ){
        	$('div[commentno="' + commentno + '"]').find($('.comment_memo')).text(data);

        }
        else {
            alert( '댓글 수정 실패');
        }
    });
    return false;
}

// 댓글 삭제
var comment_delete = function comment_delete(commentno) {
    var chk = confirm("정말로 삭제하시겠습니까?");
    if (chk==true) {

        $.ajax({
            url : '/board/article_comment_delete',
            data: { 'commentno': commentno },   // 사용하는 경우에는 { data1:'test1', data2:'test2' }
            type: 'post',       // get, post
            timeout: 30000,    // 30초
            dataType: 'html',  // text, html, xml, json, jsonp, script
        }).done( function(data, textStatus, xhr ){
            // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
            if(data > 0){
                $('div[commentno="' + commentno +'"]').remove();
            }
            else {
                alert( '댓글 삭제 실패');
            }
        });
        return false;
    };
};




