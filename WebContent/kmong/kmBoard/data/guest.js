
String.prototype.trim = function() {
		var TRIM_PATTERN = /(^\s*)|(\s*$)/g;
		return this.replace(TRIM_PATTERN, "");
};

function guSendIt() {
    f = document.myForm;
    
   

    str = f.guContent.value;
    str = str.trim();
    if(!str) {
        alert("내용을 입력하세요 !!!");
        f.guContent.focus();
        return;
    }
     f.guContent.value = str;
    
    f.action="<%=cp%>/study/km/article.do";
    f.submit();
}
