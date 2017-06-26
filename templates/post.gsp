<%include "header.gsp"%>
	
	<%include "menu.gsp"%>

	<article class="container">
		<header>
			<div class="page-header">
				<h1>${content.title}</h1>
				<details>
					<p>Posted: <time datetime="${new java.text.SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH).format(content.date)}">${new java.text.SimpleDateFormat("dd MMMM yyyy", Locale.ENGLISH).format(content.date)}</time></p>
					<p>
						<span class="glyphicon glyphicon-tags" aria-hidden="true"></span>
						<span class="sr-only">Tags:</span>
						<%content.tags?.each{tag->%>
							<a href='${content.rootpath}tags/${tag}.html'>${tag}</a>
						<%}%>
					</p>
				</details>
			</div>
		</header>

		<section>
		${content.body}
		</section>
	</article>
	
<%include "footer.gsp"%>
</body></html>