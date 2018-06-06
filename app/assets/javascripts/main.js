$(window).scroll(function(){
	$('nav').toggleClass('scrolled', $(this).scrollTop() > 50);
});

$(function(){
$(window).on('scroll', function() {
    var scrollTop = $(this).scrollTop();
    $('.section').each(function() {
        var topDistance = $(this).offset().top;
        if ( (topDistance) < scrollTop ) {
            $('#navbar').css('background-color',$(this).attr('fill-color'));
            $('#navbar a').css('color',$(this).attr('logo-color'));
            $('#navbar-nav a').css('color',$(this).attr('link-color'));
        }
    });
});
})

// for characteristic popups
function showInformation(id, id2) {
		var characteristic = document.getElementById(id2)
    var popup = document.getElementById(id);
    popup.classList.toggle("show");
		characteristic.classList.toggle("orange")
}
