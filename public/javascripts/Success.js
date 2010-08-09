$(function() {
    $('iframe').load(function() {
        setTimeout(function() {
            window.location = "https://santech.createsend.com/login.aspx?username=" + $('#username').html() + "&password=" + $('#password').html();
        },3000);
        var pagesize = ___getPageSize();
        $('.ContainerMain').css({
            height: pagesize[1],
            width:pagesize[0]
        });
        $('.containerPop').css('left',(pagesize[0] / 2) - 200);
        $('.containerPop').fadeIn(500);
        $('.ContainerMain').fadeIn(500);
    }) ;
    $(window).resize(function() {
        var pagesize = ___getPageSize();
        $('.containerPop').css('left',(pagesize[0] / 2) - 200);
        $('.ContainerMain').css({
            height: pagesize[1],
            width: pagesize[0]
        });
    }) ;
    function ___getPageSize () {
        var xScr, yScr;
        var w = window;
        var d = document;
        if (w.innerHeight && w.scrollMaxY) {
            xScr = w.innerWidth + w.scrollMaxX;
            yScr = w.innerHeight + w.scrollMaxY;
        } else if (d.body.scrollHeight > document.body.offsetHeight) {
            xScr = document.body.scrollWidth;
            yScr = document.body.scrollHeight;
        } else {
            xScr = d.body.offsetWidth;
            yScr = d.body.offsetHeight;
        }
        var wW, wH;
        if (self.innerHeight) {
            if (d.documentElement.clientWidth) {
                wW = d.documentElement.clientWidth;
            } else {
                wW = self.innerWidth;
            }
            wH = self.innerHeight;
        } else if (d.documentElement && d.documentElement.clientHeight) {
            wW = d.documentElement.clientWidth;
            wH = d.documentElement.clientHeight;
        } else if (d.body) {
            wW = d.body.clientWidth;
            wH = d.body.clientHeight;
        }
        if (yScr < wH) {
            pageHeight = wH;
        } else {
            pageHeight = yScr;
        }
        if (xScr < wW) {
            pageWidth = xScr;
        } else {
            pageWidth = wW;
        }
        arrayPageSize = new Array(pageWidth, pageHeight, wW, wH);
        return arrayPageSize;
    }
});
