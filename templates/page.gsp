<!DOCTYPE html>
<html lang="en">
	<%include "header.gsp"%>
	<body>
	<%include "menu.gsp"%>
	
	<!-- Begin page content -->
	<div class="container">
		<div class="page-header">
			<h1>${content.title}</h1>
		</div>
		${content.body}
	</div>

	<%include "footer.gsp"%>
</body>

</html>