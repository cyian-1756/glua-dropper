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
