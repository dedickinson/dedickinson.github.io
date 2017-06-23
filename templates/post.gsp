<%include "header.gsp"%>
	
	<%include "menu.gsp"%>

	<article class="container">
	<header>
		<h1>${content.title}</h1>
		<p><time datetime="${new java.text.SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH).format(content.date)}">${new java.text.SimpleDateFormat("dd MMMM yyyy", Locale.ENGLISH).format(content.date)}</time></p>
	</header>

	<section>
	${content.body}
	</section>

	</article>
	
<%include "footer.gsp"%>