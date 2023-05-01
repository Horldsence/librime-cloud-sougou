
--- 百度云及搜狗云拼音，Ctrl+t 和 Ctrl+g 分别为百度云和搜狗云输入触发键
--- 使用方法：
--- 需要哪一个即更改哪一个
--- 将 "lua_translator@baidu_translator" 和 "lua_processor@baidu_processor"分别加到输入方案的 engine/translators 和 engine/processors 中
local baidu = require("trigger_baidu")("Control+t", require("baidu"))
baidu_translator = baidu.translator
baidu_processor = baidu.processor
--- 将 "lua_translator@sougou_translator" 和 "lua_processor@sougou_processor"分别加到输入方案的 engine/translators 和 engine/processors 中

local sougou = require("trigger_sougou")("Control+g", require("sougou"))
sougou_translator = sougou.translator
sougou_processor = sougou.processor
