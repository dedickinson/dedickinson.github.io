<!DOCTYPE html>
<html lang="en">
	<%include "header.gsp"%>
	<body>
	<%include "menu.gsp"%>
	
	<!-- Begin page content -->
	<div class="container">
		<div class="page-header">
			<h1>Dev notebook</h1>
		</div>
		<%published_posts.each {post ->%>
		<a href="${post.uri}"><h2>${post.title}</h2></a>
		<p>${new java.text.SimpleDateFormat("dd MMMM yyyy", Locale.ENGLISH).format(post.date)}</p>
		<p>
			<span class="glyphicon glyphicon-tags" aria-hidden="true"></span>
			<span class="sr-only">Tags:</span>
			<%post.tags?.each{tag->%>
				<a href='${content.rootpath}tags/${tag}.html'>${tag}</a>
			<%}%>
		</p>
		<p>${post.summary}</p>
  	<%}%>
	</div>

	<%include "footer.gsp"%>
</body></html>