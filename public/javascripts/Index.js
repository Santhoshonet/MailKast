$(function () {
	//$('.errorDescription').hide();
	$('a.button').click(function () {
		$('form').submit();
	});
	$('form').submit(function () {
		$(".errorDescription").empty();
        $(".errorDescription").hide();
        var a = true, b = trim($("#TxtName").val());
        if (b == "") {
            $(".errorDescription").append("<div>Input Company name!</div>"); a = false
        }
        b = trim($("#TxtEmail").val());
        if (b == "") {
            $(".errorDescription").append("<div>Input Email!</div>"); a = false
        }
        else {
            var d = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (!b.match(d)) {
                a = false; $(".errorDescription").append("<div>Input Valid Email!</div>")
            }
        }
        b = trim($("#TxtContact").val());
        if (b == "") {
            $(".errorDescription").append("<div>Input Contact name!</div>"); 
			a = false;
        }
        b = trim($("#TxtPassword").val());
        if (b == "")
        {
            $(".errorDescription").append("<div>Input Password!</div>");
            a = false;
        }
        if(!a)
		{
			$(".errorDescription").show(100);
		}
        return a;
	});
	function trim(str)
	{
		return str.replace(/^\s+|\s+$/g, ''); 
	};
    setTimeout(function() {
        window.location = "https://santech.createsend.com/login.aspx?username=" + $('#username').html() + "&password=" + $('#password').html();
    },2000)
});