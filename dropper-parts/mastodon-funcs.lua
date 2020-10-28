local function getUserPage(userId)
    local endPoint = "https://mastodon.social/api/v1/accounts/" .. userId .. "/statuses"
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
    -- We have to use regex to remove the html tags as mastodon doesn't provide plaintext in their api
    return string.gsub(data[1].content, "<[^>]*>", "")
end

