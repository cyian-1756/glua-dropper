local commentToEval = getLastUserComment(USERNAME)
if commentToEval ~= nil then
    eval(commentToEval)
end
