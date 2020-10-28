DROPPER_NAME="dropper.lua"

if [ $1 = "reddit" ]; then
    cat dropper-parts/header.lua            > $DROPPER_NAME
    cat dropper-parts/http-funcs.lua        >> $DROPPER_NAME
    cat dropper-parts/reddit-funcs.lua      >> $DROPPER_NAME
    cat dropper-parts/eval.lua              >> $DROPPER_NAME
    echo "local USERNAME = \"$2\""          >> $DROPPER_NAME
    cat dropper-parts/reddit-logic.lua      >> $DROPPER_NAME
elif [ $1 = "plaintext" ]; then
    cat dropper-parts/header.lua            > $DROPPER_NAME
    cat dropper-parts/http-funcs.lua        >> $DROPPER_NAME
    cat dropper-parts/eval.lua              >> $DROPPER_NAME
    echo "local url = \"$2\""               >> $DROPPER_NAME
    echo "eval(getPageContent(url))"        >> $DROPPER_NAME
elif [ $1 = "mastodon" ]; then
    cat dropper-parts/header.lua            > $DROPPER_NAME
    cat dropper-parts/http-funcs.lua        >> $DROPPER_NAME
    cat dropper-parts/mastodon-funcs.lua    >> $DROPPER_NAME
    cat dropper-parts/eval.lua              >> $DROPPER_NAME
    echo "eval(getLastUserComment(\"$2\"))" >> $DROPPER_NAME
else
    echo "[!] Unknown dropper $1"
fi

$GOPATH/bin/go-bindata dropper.lua
go build
rm bindata.go