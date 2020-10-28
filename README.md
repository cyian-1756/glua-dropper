# Glua Dropper
## A simple dropper written in gopher-lua

The programs downloads a gopher-lua script from a preset url or the last comment from a preset reddit account and evals it

### Building
Requires go-bindata

Build with ```./build.sh```

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

#### Builder
Instead of copy pasting code everywhere a builder should be written that will combine multible lua files into one 