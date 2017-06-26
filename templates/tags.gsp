<%include "header.gsp"%>
	
	<%include "menu.gsp"%>

	<article class="container">
		<header>
			<div class="page-header">
				<h1>Tag: ${tag}</h1>
				
			</div>
		</header>

		<section>
		<!--<ul>-->
		<%def last_month=null;%>
		<%tag_posts.each {post ->%>
		<%if (last_month) {%>
			<%if (new java.text.SimpleDateFormat("MMMM yyyy", Locale.ENGLISH).format(post.date) != last_month) {%>
				</ul>
				<h4>${new java.text.SimpleDateFormat("MMMM yyyy", Locale.ENGLISH).format(post.date)}</h4>
				<ul>
			<%}%>
		<%} else {%>
			<h4>${new java.text.SimpleDateFormat("MMMM yyyy", Locale.ENGLISH).format(post.date)}</h4>
			<ul>
		<%}%>
		
		<details>
			<summary><a href="${content.rootpath}${post.uri}">${post.title}</a></summary>
			<p>Posted: <time datetime="${new java.text.SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH).format(post.date)}">${new java.text.SimpleDateFormat("dd MMMM yyyy", Locale.ENGLISH).format(post.date)}</time></p>
			<p>
				<span class="glyphicon glyphicon-tags" aria-hidden="true"></span>
				<span class="sr-only">Tags:</span>
				<%post.tags?.each{tag->%>
					<a href='${content.rootpath}tags/${tag}.html'>${tag}</a>
				<%}%>
			<p>${post.summary}</p>
		</details>
		<% last_month = new java.text.SimpleDateFormat("MMMM yyyy", Locale.ENGLISH).format(post.date)%>
		<%}%>
	</ul>
		</section>
	</article>
	
<%include "footer.gsp"%>
</body></html>