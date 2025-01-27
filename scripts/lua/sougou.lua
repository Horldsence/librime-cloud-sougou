local json = require("json")
local http = require("socket.http")
http.TIMEOUT = 0.5

local function make_url(input, bg, ed)
   return 'http://olime.baidu.com/py?input=' .. input ..
      '&inputtype=py&bg='.. bg .. '&ed='.. ed ..
      '&result=hanzi&resultcoding=utf-8&ch_en=0&clientinfo=web&version=1'
end

local function translator(input, seg)
   local reply = http.request(make_url(input, 0, 5))
   local _, j = pcall(json.decode, reply)
   if j.status == "T" and j.result and j.result[1] then
      for i, v in ipairs(j.result[1]) do
	 local c = Candidate("simple", seg.start, seg.start + v[2], v[1], "(搜狗云拼音)")
	 c.quality = 2
	 if string.gsub(v[3].pinyin, "'", "") == string.sub(input, 1, v[2]) then
	    c.preedit = string.gsub(v[3].pinyin, "'", " ")
	 end
	 yield(c)
      end
   end   
end

return translator
