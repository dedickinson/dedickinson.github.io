<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <% if (content) { %>
  <meta name="keywords" content="${content?.tags?.join(',')}">
  <meta name="description" content="${content?.summary}">
  <% } else { %>
  <meta name="keywords" content="cloud, aws, azure, development">
  <meta name="description" content="A technical notebook site that describes various experiments with software.">
  <% } %>
  <meta name="author" content="Duncan Dickinson">
  <link rel="icon" href="/favicon.ico">

  <title>Dev Notebook</title>

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
    crossorigin="anonymous">
  
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/github.min.css">
  <script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script> 
  <script>hljs.initHighlightingOnLoad();</script>
  
  <link href="/css/local.css" rel="stylesheet">
</head>
   