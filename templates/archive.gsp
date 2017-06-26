<!DOCTYPE html>
<html lang="en">
	<%include "header.gsp"%>
	<body>
	<%include "menu.gsp"%>
	
	<!-- Begin page content -->
	<div class="container">
	<div class="page-header">
		<h1>Blog Archive</h1>
	</div>
	
	<!--<ul>-->
		<%def last_month=null;%>
		<%published_posts.each {post ->%>
			<%if (last_month) {%>
				<%if (new java.text.SimpleDateFormat("MMMM yyyy", Locale.ENGLISH).format(post.date) != last_month) {%>
					</ul>
					<h4>${new java.text.SimpleDateFormat("MMMM yyyy", Locale.ENGLISH).format(post.date)}</h4>
					<ul>
				<%}%>
			<% } else { %>
				<h4>${new java.text.SimpleDateFormat("MMMM yyyy", Locale.ENGLISH).format(post.date)}</h4>
				<ul>
			<% }%>
			
			<li>
				<details>
					<summary><a href="${content.rootpath}${post.uri}">${post.title}</a></summary>
					<p>Posted: <time datetime="${new java.text.SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH).format(post.date)}">${new java.text.SimpleDateFormat("dd MMMM yyyy", Locale.ENGLISH).format(post.date)}</time></p>
					<p>
						<span class="glyphicon glyphicon-tags" aria-hidden="true"></span>
						<span class="sr-only">Tags:</span>
						<%post.tags?.each{tag->%>
							<a href='${content.rootpath}tags/${tag}.html'>${tag}</a>
						<%}%></p>
					<p>${post.summary}</p>
				</details>
			</li>
			<%last_month = new java.text.SimpleDateFormat("MMMM yyyy", Locale.ENGLISH).format(post.date)%>
		<%}%>
	</ul>

	</div>
	
<%include "footer.gsp"%>
</body></html>