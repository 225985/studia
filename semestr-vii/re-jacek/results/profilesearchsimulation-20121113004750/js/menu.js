
function setDetailsLinkUrl(){
    $("#details_link").attr('href', encodeURIComponent('req_dashboard.html'));
}

function setDetailsMenu(){
    var menu = $(".nav ul");
    $("<a>").attr({href: encodeURIComponent('req_dashboard.html')}).text('Dashboard').wrap("<li>").parent().appendTo(menu);
    $("<a>").attr({href: encodeURIComponent('req_profile_1.html')}).text('Profile 1').wrap("<li>").parent().appendTo(menu);
    $("<a>").attr({href: encodeURIComponent('req_profile_2.html')}).text('Profile 2').wrap("<li>").parent().appendTo(menu);
}

function setGlobalMenu(){
    $(".nav ul").append("<li><a href='#active_sessions'>Active Sessions</a></li><li><a href='#requests'>Requests / sec</a></li><li><a href='#transactions'>Transactions / sec</a></li>");
}

function getLink(link){
	var a = link.split('/');
	return (a.length<=1)? link : a[a.length-1];
}
 
function setActiveMenu(){
	$(".nav a").each(function(){
		if($(this).attr('href') == getLink(window.location.pathname)){
			$(this).parent().attr('class', 'on');
			return false;
		}
	});
}
