Charon [![Gem Version](https://badge.fury.io/rb/charon.png)](http://badge.fury.io/rb/charon)
========================

A Ruby library to query the Zen service on SpamHaus.org

<http://rubygems.org/gems/charon>

Installation and Usage
------------------------

You can verify your installation using this piece of code:

```bash
gem install charon
```

```ruby
require 'charon'

Charon.query '127.0.0.1'
```

Return Values
---

`Charon.query` will return `nil` if the given address or host is not present in the spamhaus database, otherwise it will
return an array in the form:

    [ code, name of the list ]

Where codes and lists, as defined on <http://www.spamhaus.org/zen/> are:

* 2 - Direct UBE sources, spam operations & spam services.
* 3 - Direct snowshoe spam sources detected via automation.
* 4..7 - CBL (3rd party exploits such as proxies, trojans, etc.).
* 10..11 - End-user Non-MTA IP addresses set by ISP outbound mail policy.

License
---

Released under the BSD license.  
Copyright &copy; 2013, Simone Margaritelli 
<evilsocket@gmail.com>  

<http://www.evilsocket.net/>
All rights reserved.

