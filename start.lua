sudo_FAYNL = dofile("sudo.lua")
https = require("ssl.https")
JSON = dofile("./libs/JSON.lua")
local FAYNL_dev = io.open("FAYNL_online.lua")
if FAYNL_dev then
FAYNL_on = {string.match(FAYNL_dev:read('*all'), "^(.*)/(%d+)")}
local FAYNL_file = io.open("sudo.lua", 'w')
FAYNL_file:write("token = '" ..FAYNL_on[1].."'\n\nsudo_add = "..FAYNL_on[2].."" )
FAYNL_file:close()
https.request("https://api.telegram.org/bot"..FAYNL_on[1].."/sendMessage?chat_id="..FAYNL_on[2].."&text=Bot_FAYNL_is_start_new")
os.execute('cd .. && rm -rf .telegram-cli')
os.execute('rm -rfFAYNL_online.lua')  
os.execute('./tg -s ./FAYNL.lua $@ --bot='..FAYNL_on[1])
end
function chack(tokenCk)
local getme = "https://api.telegram.org/bot" ..tokenCk.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
print("\27[31m✓ DONE\27[m \27[1;34m»»Now Send Sudo ID««\27[m")
local sudo_send  = io.read()
print("\27[31m✓ DONE\27[m")
local FAYNL_file = io.open("sudo.lua", 'w')
FAYNL_file:write("token = '" ..tokenCk.."'\n\nsudo_add = "..sudo_send.."" )
FAYNL_file:close()
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
os.execute('./tg -s ./FAYNL.lua $@ --bot='..tokenCk)
else
print("\27[31m»»This TOKEN Incorrect , Send Right TOKEN««\27[m")
local token_send = io.read()
chack(token_send)
end
end
os.execute('cd .. && rm -rf .telegram-cli')
if token and token == "TOKEN" then 
print("\27[1;34m»»Send Your Bot TOKEN««\27[m")
local token_send = io.read()
chack(token_send)
else 
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
sudo_FAYNL = dofile("sudo.lua")
local getme = "https://api.telegram.org/bot" ..token.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
os.execute('rm -rf FAYNL.lua')
os.execute('wget https://raw.githubusercontent.com/FAYNLabas/FAYNL/master/FAYNL.lua')
dofile('./FAYNL.lua')  
os.execute('./tg -s ./FAYNL.lua $@ --bot='..token)
else
print("\27[31mTOKEN Incorrect , Send Right TOKEN««\27[m")
local token_send = io.read()
chack(token_send)
end
end
