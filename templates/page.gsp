<!DOCTYPE html>
<html lang="en">
	<%include "header.gsp"%>
	<body>
	<%include "menu.gsp"%>
	
	<!-- Begin page content -->
	<div class="container">
		<div class="page-header">
			<h1>Sticky footer with fixed navbar</h1>
		</div>
		<%published_posts.each {post ->%>
		<a href="${post.uri}"><h1>${post.title}</h1></a>
		<p>${new java.text.SimpleDateFormat("dd MMMM yyyy", Locale.ENGLISH).format(post.date)}</p>
		<p>${post.body}</p>
  	<%}%>
	</div>

	<%include "footer.gsp"%>
</body>

</html>