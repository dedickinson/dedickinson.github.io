<%include "header.gsp"%>
	
	<%include "menu.gsp"%>

	<article class="container">
		<header>
			<div class="page-header">
				<h1>All tags</h1>
				
			</div>
		</header>

		<section>
			<ul>
			<% alltags.sort().each { tag -> %>
				<li><a href='${content.rootpath}tags/${tag}.html'>${tag}</a></li>
			<% } %>
			</ul>
		</section>
	</article>
	
<%include "footer.gsp"%>
</body></html>