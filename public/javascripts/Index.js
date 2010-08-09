$(function () {
	$('#errorDescription').hide();
	$('a.button').click(function () {
		$('form').submit();
	});
	$('form').submit(function () {
		var ErrorInfo = "We need some information about you to create your account. ";
        var a = true, b = trim($("#TxtName").val());
        if (b == "") {
            ErrorInfo += "<br />Fill your <strong>Company Name</strong> ";
            a = false
        }
        b = trim($("#TxtEmail").val());
        if (b == "") {
            ErrorInfo += "<br />Fill your <strong>Email</strong> ";
            a = false
        }
        else {
            var d = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (!b.match(d)) {
                a = false;
                ErrorInfo += "<br />Input Valid <strong>Email</strong>";
            }
        }
        b = trim($("#TxtContact").val());
        if (b == "") {
            ErrorInfo += "<br />Fill your <strong>Contact name</strong> ";
			a = false;
        }
        b = trim($("#TxtPassword").val());
        if (b == "")
        {
            ErrorInfo += "<br />Fill your <strong>Password</strong> ";
            a = false;
        }
        if(!a)
		{
            $("#errorDescription").html(ErrorInfo);
			$("#errorDescription").show(500);
            setTimeout(function() {
                $("#errorDescription").hide(1000);
            },5000);
		}
        return a;
	});
	function trim(str)
	{
		return str.replace(/^\s+|\s+$/g, ''); 
	}
   
});