--dumped reason: top
-- ААААА CHATGPT = ALL 
-- ААА АНФАЛ Я ТВОЮ МАТЬ ЕБАЛ АХАХАХА МЕЙНИТ С ДАТИКСАМ АХАХАХАХАХА 8 ЛЕТ ПАЦАНАМ АХАХАХАХАХ
-- UNFALL I FUCK YOUR MOM DOGG$$$ LEARN LUA LOLLLL BOT BOT BOT BOT BBOT BOT BOT BOT BOT
-- 8 Y.O
--Краснодарский пидорас я те мамочку ебал
--я решил пожалеть тебя и слить не такой уж читабельный код
-- но ты меня разозлил ебанный сын шлюхи
-- который не додумался пососать мои яйца молча
local easing = require "gamesense/easing"
local ffi = require("ffi")
local pui = require("gamesense/pui")
local base64 = require("gamesense/base64")
local vector = require("vector")
local ent = require("gamesense/entity")
local bit = require("bit")
local bitband = bit.band
local screen_size, local_player = { client.screen_size() }, ent.get_local_player
local x, y = client.screen_size()
lerp = function(a, b, t)
    return a + (b - a) * t
end
RGBAtoHEX = function(redArg, greenArg, blueArg, alphaArg)
    return string.format('%.2x%.2x%.2x%.2x', redArg, greenArg, blueArg, alphaArg)
end

local function table_contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end
local notification = function(x, y, r, g, b, r2, g2, b2, a2, font, text, r3, g3, b3, a3)
    local size = renderer.measure_text(font, text)
    renderer.rectangle(x - size/2, y, size, 1, r2, g2, b2, a2)
    renderer.rectangle(x - size/2, y + 22, size, 1, r2, g2, b2, a2)
    renderer.rectangle(x - size/2, y + 1, size, 21, r2, g2, b2, a2)
    renderer.rectangle(x - size/2 - 1, y + 2, 1, 19, r2, g2, b2, a2)
    renderer.rectangle(x - size/2 - 2, y + 3, 1, 17, r2, g2, b2, a2)
    renderer.rectangle(x - size/2 + size, y + 2, 1, 19, r2, g2, b2, a2)
    renderer.rectangle(x - size/2 + size + 1, y + 3, 1, 17, r2, g2, b2, a2)
        renderer.rectangle(x - size/2, y - 1, size, 1, r, g, b ,255)
        renderer.rectangle(x - size/2 - 1, y, 1, 1, r, g, b ,255)
        renderer.rectangle(x - size/2 + size, y, 1, 1, r, g, b ,255)
        renderer.rectangle(x - size/2 - 2, y + 1, 1, 1, r, g, b ,255)
        renderer.rectangle(x - size/2 + size + 1, y + 1, 1, 1, r, g, b ,255)
        renderer.rectangle(x - size/2 + size + 2, y + 2, 1, 5, r, g, b ,255)
        renderer.rectangle(x - size/2 - 3, y + 2, 1, 5, r, g, b ,255)
        renderer.rectangle(x - size/2 + size + 2, y + 7, 1, 3, r, g, b, 225)
        renderer.rectangle(x - size/2 - 3, y + 7, 1, 3, r, g, b, 225)
        renderer.rectangle(x - size/2 + size + 2, y + 10, 1, 3, r, g, b, 175)
        renderer.rectangle(x - size/2 - 3, y + 10, 1, 3, r, g, b, 175)
        renderer.rectangle(x - size/2 + size + 2, y + 13, 1, 3, r, g, b, 125)
        renderer.rectangle(x - size/2 - 3, y + 13, 1, 3, r, g, b, 125)
        renderer.rectangle(x - size/2 + size + 2, y + 16, 1, 5, r, g, b, 75)
        renderer.rectangle(x - size/2 - 3, y + 16, 1, 5, r, g, b, 75)
        renderer.rectangle(x - size/2 - 1, y + 22, 1, 1, r, g, b ,65)
        renderer.rectangle(x - size/2 + size, y + 22, 1, 1, r, g, b ,65)
        renderer.rectangle(x - size/2 - 2, y + 21, 1, 1, r, g, b ,65)
        renderer.rectangle(x - size/2 + size + 1, y + 21, 1, 1, r, g, b ,65)
        renderer.rectangle(x - size/2, y + 23, size, 1, r, g, b ,65)
    renderer.rectangle(x - size/2 - 2, y + 2, 1, 1, r2, g2, b2, a2)
    renderer.rectangle(x - size/2 - 1, y + 1, 1, 1, r2, g2, b2, a2)

    renderer.rectangle(x - size/2 + size, y + 1, 1, 1, r2, g2, b2, a2)
    renderer.rectangle(x - size/2 + size + 1, y + 2, 1, 1, r2, g2, b2, a2)
    renderer.rectangle(x - size/2 - 1, y + 21, 1, 1, r2, g2, b2, a2)
    renderer.rectangle(x - size/2 - 2, y + 20, 1, 1, r2, g2, b2, a2)
    renderer.rectangle(x - size/2 + size, y + 21, 1, 1, r2, g2, b2, a2)
    renderer.rectangle(x - size/2 + size + 1, y + 20, 1, 1, r2, g2, b2, a2)
    renderer.text(x - size/2, y + 5, r3, g3, b3, a3, font, 0, text)
end
local welcomerData = {
    welcomer = false,
    welcomervector = 0,
    welcomertime = 0,
    welcomerlist = {}
}

local local_player_index = entity.get_local_player()
local local_player_name = entity.get_player_name(local_player_index)
table.insert(welcomerData.welcomerlist, " ДОБРО ПОЖАЛОВАТЬ НАХУЙ АХАХАХАХ:  " .. local_player_name)

local function welcomerfunc()
    if welcomerData.welcomertime >= 0 and welcomerData.welcomertime < 740 then
        welcomerData.welcomertime = welcomerData.welcomertime + 1
    end
    if welcomerData.welcomertime == 10 then
        welcomerData.welcomer = true
    elseif welcomerData.welcomertime == 700 then
        welcomerData.welcomer = false
    elseif welcomerData.welcomertime == 740 then
        table.remove(welcomerData.welcomerlist, 1)
    end

    if welcomerData.welcomer then
        welcomerData.welcomervector = lerp(welcomerData.welcomervector, 0, globals.frametime() * 15)
    else
        welcomerData.welcomervector = lerp(welcomerData.welcomervector, 200, globals.frametime() * 15)
    end

    local time_factor = (globals.realtime() * 0.5) % (2 * math.pi)  
    local r = math.floor((math.sin(time_factor) + 1) * 127.5) 
    local g = math.floor((math.sin(time_factor + (2 * math.pi / 3)) + 1) * 127.5)  
    local b = math.floor((math.sin(time_factor + (4 * math.pi / 3)) + 1) * 127.5) 

    if #welcomerData.welcomerlist == 1 then
        notification(x / 2, y / 1.2 + welcomerData.welcomervector, 142, 165, 229, 25, 25, 25, 100, "nil", welcomerData.welcomerlist[1], r, g, b, 255)
    end
end
local ref = {
    aa_enable = ui.reference("AA","anti-aimbot angles","enabled"),
    pitch = ui.reference("AA","anti-aimbot angles","pitch"),
    pitch_value = select(2, ui.reference("AA","anti-aimbot angles","pitch")),
    yaw_base = ui.reference("AA","anti-aimbot angles","yaw base"),
    yaw = ui.reference("AA","anti-aimbot angles","yaw"),
    yaw_value = select(2, ui.reference("AA","anti-aimbot angles","yaw")),
    yaw_jitter = ui.reference("AA","Anti-aimbot angles","Yaw Jitter"),
    yaw_jitter_value = select(2, ui.reference("AA","Anti-aimbot angles","Yaw Jitter")),
    body_yaw = ui.reference("AA","Anti-aimbot angles","Body yaw"),
    body_yaw_value = select(2, ui.reference("AA","Anti-aimbot angles","Body yaw")),
    freestand_body_yaw = ui.reference("AA","Anti-aimbot angles","freestanding body yaw"),
    edgeyaw = ui.reference("AA","anti-aimbot angles","edge yaw"),
    freestand = {ui.reference("AA","anti-aimbot angles","freestanding")},
    roll = ui.reference("AA","anti-aimbot angles","roll"),
    slide = {ui.reference("AA","other","slow motion")},
    fakeduck = ui.reference("rage","other","duck peek assist"),
    quick_peek = {ui.reference("rage", "other", "quick peek assist")},
    doubletap = {ui.reference("rage", "aimbot", "double tap")},
}

local doubletap = ui.reference( "Rage", "Aimbot", "Double tap" )
local onshot = ui.reference( "AA", "Other", "On shot anti-aim" )
local limit = ui.reference( "AA", "Fake lag", "Limit" )

function get_velocity()
    if not entity.get_local_player() then return end
    local first_velocity, second_velocity = entity.get_prop(entity.get_local_player(), "m_vecVelocity")
    local speed = math.floor(math.sqrt(first_velocity*first_velocity+second_velocity*second_velocity))
    
    return speed
end

local ground_tick = 1
function get_state(speed)
    if not entity.is_alive(entity.get_local_player()) then return end
    local flags = entity.get_prop(entity.get_local_player(), "m_fFlags")
    local land = bit.band(flags, bit.lshift(1, 0)) ~= 0
    if land == true then ground_tick = ground_tick + 1 else ground_tick = 0 end

    if bit.band(flags, 1) == 1 then
        if ground_tick < 10 then if bit.band(flags, 4) == 4 then return 5 else return 4 end end
        if bit.band(flags, 4) == 4 or ui.get(ref.fakeduck) then 
            return 6 
        else
            if speed <= 3 then
                return 2 
            else
                if ui.get(ref.slide[2]) then
                    return 7 
                else
                    return 3
                end
            end
        end
    elseif bit.band(flags, 1) == 0 then
        if bit.band(flags, 4) == 4 then
            return 5 
        else
            return 4 
        end
    end
end

ffi.cdef [[
	typedef int(__thiscall* get_clipboard_text_count)(void*);
	typedef void(__thiscall* set_clipboard_text)(void*, const char*, int);
	typedef void(__thiscall* get_clipboard_text)(void*, int, const char*, int);
]]

local VGUI_System = ffi.cast(ffi.typeof('void***'), client.create_interface("vgui2.dll", "VGUI_System010") or error("Error finding VGUI_System010"))

local get_clipboard_text_count = ffi.cast("get_clipboard_text_count", VGUI_System[0][7]) or error("get_clipboard_text_count Invalid")
local set_clipboard_text = ffi.cast("set_clipboard_text", VGUI_System[0][9]) or error("set_clipboard_text Invalid")
local get_clipboard_text = ffi.cast("get_clipboard_text", VGUI_System[0][11]) or error("get_clipboard_text Invalid")

clipboard_import = function()
    local clipboard_text_length = get_clipboard_text_count(VGUI_System)
   
    if clipboard_text_length > 0 then
        local buffer = ffi.new("char[?]", clipboard_text_length)
        local size = clipboard_text_length * ffi.sizeof("char[?]", clipboard_text_length)
   
        get_clipboard_text(VGUI_System, 0, buffer, size )
   
        return ffi.string( buffer, clipboard_text_length-1)
    end

    return ""
end

local function clipboard_export(string)
	if string then
		set_clipboard_text(VGUI_System, string, string:len())
	end
end

local aa_state = {[1] = "G", [2] = "S", [3] = "M", [4] = "A", [5] = "A-C", [6] = "C", [7] = "SW"}
local aa_state_full = {[1] = "\aFF0110FFGlobal", [2] = "\aFF0110FFStand", [3] = "\aFF0110FFMove", [4] = "\aFF0110FFAir", [5] = "\aFF0110FFAir-crouch", [6] = "\aFF0110FFCrouch", [7] = "\aFF0110FFSlow-walk"}
 
    local last_sim_time = 0
    local defensive_until = 0
    local function is_defensive_active()
        local tickcount = globals.tickcount()
        local sim_time = toticks(entity.get_prop(entity.get_local_player(), "m_flSimulationTime"))
        local sim_diff = sim_time - last_sim_time

        if sim_diff < 0 then
            defensive_until = tickcount + math.abs(sim_diff) - toticks(client.latency())
        end

        last_sim_time = sim_time

        return defensive_until > tickcount
    end

    local function is_vulnerable()
        for _, v in ipairs(entity.get_players(true)) do
            local flags = (entity.get_esp_data(v)).flags

            if bit.band(flags, bit.lshift(1, 11)) ~= 0 then
                return true
            end
        end

        return false
    end



local function vec_3( _x, _y, _z ) 
	return { x = _x or 0, y = _y or 0, z = _z or 0 } 
end


contains = function(tbl, arg)
    for index, value in next, tbl do 
        if value == arg then 
            return true end 
        end 
    return false
end

pui.accent = "C3C6FFFF"

local group = pui.group("aa", "anti-aimbot angles")
local _ui = {
    lua = {
        enable = group:checkbox("\aFF0110FF☭\v OMICRON.LUA"), 
        tab = group:combobox("\n ", "\aFF0110FFHome", "\aFF0110FFRagebot", "\aFF0110FFVisuals", "\aFF0110FFAnti-aim", "\aFF0110FFMiscellaneous"), 
    },
    
home = {
    infolabel1 = group:label("\aFF0110FF➜\v WELCOME TO\aFF0110FF OMICRON.LUA"),  
    infolabel2 = group:label("\aFF0110FF➜\v BUILD:\aFF0110FF N1"),                
    infolabel3 = group:label("\aFF0110FF➜\v LUA OWNER:\aFF0110FF dolboeb"),        
    infolabel4 = group:label("\aFF0110FF➜\v LAST UPDATE:\aFF0110FF dead unfall papa"), 
    infolabel5 = group:label("\aFF0110FF➜\v LUA USER:\aFF0110FF " .. local_player_name), 
    discord = group:button("\aFF0110FFDiscord Lua", function ()
        panorama.loadstring(panorama.open("CSGOHud").SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/WYzZg8pq8S"))
    end),
},
	
ragebot = {
	label33 = group:label("\aFF0110FFGET OUT"),
},

visuals = {
label = group:label("\aFF0110FFGO IN VISUALS > EFFECTS"),
},

antiaim = {
    enable = group:checkbox("\aFF0110FFEnable"),
    tab = group:combobox("\vAnti-aim tab", "\aFF0110FFBuilder", "\aFF0110FFSettings"),

        condition = group:combobox("\vConditions", aa_state_full),

        freestanding = group:hotkey("\aFF0110FF◯\v Freestanding"),
        edge_yaw = group:hotkey("\aFF0110FF⭮\v  Edge Yaw"),
        cfg_export = group:button("\vExport anti-aim settings", function() config.export() end),
        cfg_import = group:button("\vImport anti-aim settings", function() config.import() end),
        cfg_reset = group:button("\aFF0110FFReset anti-aim settings", function() config.import("W3siZW5hYmxlIjp0cnVlLCJ0YWIiOiJTZXR0aW5ncyIsImZyZWVzdGFuZGluZyI6WzEsMCwifiJdLCJjb25kaXRpb24iOiJHbG9iYWwiLCJlZGdlX3lhdyI6WzEsMCwifiJdLCJ0d2Vha3MiOlsifiJdfSxbeyJ5YXdfYmFzZSI6IkxvY2FsIHZpZXciLCJwaXRjaCI6Ik9mZiIsImJvZHlfeWF3IjoiT2ZmIiwieWF3IjoiT2ZmIiwiZnJlZXN0YW5kX2JvZHlfeWF3IjpmYWxzZSwiYm9keV95YXdfdmFsdWUiOjAsInlhd19qaXR0ZXIiOiJPZmYiLCJ5YXdfdmFsdWUiOjAsIm92ZXJyaWRlIjp0cnVlLCJ5YXdfaml0dGVyX3ZhbHVlIjowfSx7Inlhd19iYXNlIjoiTG9jYWwgdmlldyIsInBpdGNoIjoiT2ZmIiwiYm9keV95YXciOiJPZmYiLCJ5YXciOiJPZmYiLCJmcmVlc3RhbmRfYm9keV95YXciOmZhbHNlLCJib2R5X3lhd192YWx1ZSI6MCwieWF3X2ppdHRlciI6Ik9mZiIsInlhd192YWx1ZSI6MCwib3ZlcnJpZGUiOmZhbHNlLCJ5YXdfaml0dGVyX3ZhbHVlIjowfSx7Inlhd19iYXNlIjoiTG9jYWwgdmlldyIsInBpdGNoIjoiT2ZmIiwiYm9keV95YXciOiJPZmYiLCJ5YXciOiJPZmYiLCJmcmVlc3RhbmRfYm9keV95YXciOmZhbHNlLCJib2R5X3lhd192YWx1ZSI6MCwieWF3X2ppdHRlciI6Ik9mZiIsInlhd192YWx1ZSI6MCwib3ZlcnJpZGUiOmZhbHNlLCJ5YXdfaml0dGVyX3ZhbHVlIjowfSx7Inlhd19iYXNlIjoiTG9jYWwgdmlldyIsInBpdGNoIjoiT2ZmIiwiYm9keV95YXciOiJPZmYiLCJ5YXciOiJPZmYiLCJmcmVlc3RhbmRfYm9keV95YXciOmZhbHNlLCJib2R5X3lhd192YWx1ZSI6MCwieWF3X2ppdHRlciI6Ik9mZiIsInlhd192YWx1ZSI6MCwib3ZlcnJpZGUiOmZhbHNlLCJ5YXdfaml0dGVyX3ZhbHVlIjowfSx7Inlhd19iYXNlIjoiTG9jYWwgdmlldyIsInBpdGNoIjoiT2ZmIiwiYm9keV95YXciOiJPZmYiLCJ5YXciOiJPZmYiLCJmcmVlc3RhbmRfYm9keV95YXciOmZhbHNlLCJib2R5X3lhd192YWx1ZSI6MCwieWF3X2ppdHRlciI6Ik9mZiIsInlhd192YWx1ZSI6MCwib3ZlcnJpZGUiOmZhbHNlLCJ5YXdfaml0dGVyX3ZhbHVlIjowfSx7Inlhd19iYXNlIjoiTG9jYWwgdmlldyIsInBpdGNoIjoiT2ZmIiwiYm9keV95YXciOiJPZmYiLCJ5YXciOiJPZmYiLCJmcmVlc3RhbmRfYm9keV95YXciOmZhbHNlLCJib2R5X3lhd192YWx1ZSI6MCwieWF3X2ppdHRlciI6Ik9mZiIsInlhd192YWx1ZSI6MCwib3ZlcnJpZGUiOmZhbHNlLCJ5YXdfaml0dGVyX3ZhbHVlIjowfSx7Inlhd19iYXNlIjoiTG9jYWwgdmlldyIsInBpdGNoIjoiT2ZmIiwiYm9keV95YXciOiJPZmYiLCJ5YXciOiJPZmYiLCJmcmVlc3RhbmRfYm9keV95YXciOmZhbHNlLCJib2R5X3lhd192YWx1ZSI6MCwieWF3X2ppdHRlciI6Ik9mZiIsInlhd192YWx1ZSI6MCwib3ZlcnJpZGUiOmZhbHNlLCJ5YXdfaml0dGVyX3ZhbHVlIjowfV0sW3siZGVmZW5zaXZlX21vZGlmaWVycyI6ZmFsc2UsInlhd19iYXNlIjoiTG9jYWwgdmlldyIsInBpdGNoIjoiT2ZmIiwiZGVmZW5zaXZlX2FhX2VuYWJsZSI6ZmFsc2UsImJvZHlfeWF3IjoiT2ZmIiwieWF3IjoiT2ZmIiwieWF3X3ZhbHVlIjowLCJ5YXdfaml0dGVyX3ZhbHVlIjowLCJ5YXdfaml0dGVyIjoiT2ZmIiwiYm9keV95YXdfdmFsdWUiOjAsInBpdGNoX3ZhbHVlIjowLCJmb3JjZV9kZWZlbnNpdmUiOmZhbHNlfSx7ImRlZmVuc2l2ZV9tb2RpZmllcnMiOmZhbHNlLCJ5YXdfYmFzZSI6IkxvY2FsIHZpZXciLCJwaXRjaCI6Ik9mZiIsImRlZmVuc2l2ZV9hYV9lbmFibGUiOmZhbHNlLCJib2R5X3lhdyI6Ik9mZiIsInlhdyI6Ik9mZiIsInlhd192YWx1ZSI6MCwieWF3X2ppdHRlcl92YWx1ZSI6MCwieWF3X2ppdHRlciI6Ik9mZiIsImJvZHlfeWF3X3ZhbHVlIjowLCJwaXRjaF92YWx1ZSI6MCwiZm9yY2VfZGVmZW5zaXZlIjpmYWxzZX0seyJkZWZlbnNpdmVfbW9kaWZpZXJzIjpmYWxzZSwieWF3X2Jhc2UiOiJMb2NhbCB2aWV3IiwicGl0Y2giOiJPZmYiLCJkZWZlbnNpdmVfYWFfZW5hYmxlIjpmYWxzZSwiYm9keV95YXciOiJPZmYiLCJ5YXciOiJPZmYiLCJ5YXdfdmFsdWUiOjAsInlhd19qaXR0ZXJfdmFsdWUiOjAsInlhd19qaXR0ZXIiOiJPZmYiLCJib2R5X3lhd192YWx1ZSI6MCwicGl0Y2hfdmFsdWUiOjAsImZvcmNlX2RlZmVuc2l2ZSI6ZmFsc2V9LHsiZGVmZW5zaXZlX21vZGlmaWVycyI6ZmFsc2UsInlhd19iYXNlIjoiTG9jYWwgdmlldyIsInBpdGNoIjoiT2ZmIiwiZGVmZW5zaXZlX2FhX2VuYWJsZSI6ZmFsc2UsImJvZHlfeWF3IjoiT2ZmIiwieWF3IjoiT2ZmIiwieWF3X3ZhbHVlIjowLCJ5YXdfaml0dGVyX3ZhbHVlIjowLCJ5YXdfaml0dGVyIjoiT2ZmIiwiYm9keV95YXdfdmFsdWUiOjAsInBpdGNoX3ZhbHVlIjowLCJmb3JjZV9kZWZlbnNpdmUiOmZhbHNlfSx7ImRlZmVuc2l2ZV9tb2RpZmllcnMiOmZhbHNlLCJ5YXdfYmFzZSI6IkxvY2FsIHZpZXciLCJwaXRjaCI6Ik9mZiIsImRlZmVuc2l2ZV9hYV9lbmFibGUiOmZhbHNlLCJib2R5X3lhdyI6Ik9mZiIsInlhdyI6Ik9mZiIsInlhd192YWx1ZSI6MCwieWF3X2ppdHRlcl92YWx1ZSI6MCwieWF3X2ppdHRlciI6Ik9mZiIsImJvZHlfeWF3X3ZhbHVlIjowLCJwaXRjaF92YWx1ZSI6MCwiZm9yY2VfZGVmZW5zaXZlIjpmYWxzZX0seyJkZWZlbnNpdmVfbW9kaWZpZXJzIjpmYWxzZSwieWF3X2Jhc2UiOiJMb2NhbCB2aWV3IiwicGl0Y2giOiJPZmYiLCJkZWZlbnNpdmVfYWFfZW5hYmxlIjpmYWxzZSwiYm9keV95YXciOiJPZmYiLCJ5YXciOiJPZmYiLCJ5YXdfdmFsdWUiOjAsInlhd19qaXR0ZXJfdmFsdWUiOjAsInlhd19qaXR0ZXIiOiJPZmYiLCJib2R5X3lhd192YWx1ZSI6MCwicGl0Y2hfdmFsdWUiOjAsImZvcmNlX2RlZmVuc2l2ZSI6ZmFsc2V9LHsiZGVmZW5zaXZlX21vZGlmaWVycyI6ZmFsc2UsInlhd19iYXNlIjoiTG9jYWwgdmlldyIsInBpdGNoIjoiT2ZmIiwiZGVmZW5zaXZlX2FhX2VuYWJsZSI6ZmFsc2UsImJvZHlfeWF3IjoiT2ZmIiwieWF3IjoiT2ZmIiwieWF3X3ZhbHVlIjowLCJ5YXdfaml0dGVyX3ZhbHVlIjowLCJ5YXdfaml0dGVyIjoiT2ZmIiwiYm9keV95YXdfdmFsdWUiOjAsInBpdGNoX3ZhbHVlIjowLCJmb3JjZV9kZWZlbnNpdmUiOmZhbHNlfV1d") end),
        cfg_default = group:button("\vLoad default settings", function() config.import("W3siZW5hYmxlIjp0cnVlLCJ0YWIiOiJcdTAwMDdGRjAxMTBGRlNldHRpbmdzIiwiZnJlZXN0YW5kaW5nIjpbMiw3MiwifiJdLCJlZGdlX3lhdyI6WzEsNzcsIn4iXSwiY29uZGl0aW9uIjoiXHUwMDA3RkYwMTEwRkZDcm91Y2gifSxbeyJ5YXdfYmFzZSI6IkxvY2FsIHZpZXciLCJwaXRjaCI6Ik9mZiIsImJvZHlfeWF3IjoiT2ZmIiwieWF3IjoiT2ZmIiwiZnJlZXN0YW5kX2JvZHlfeWF3IjpmYWxzZSwiYm9keV95YXdfdmFsdWUiOjAsInlhd19qaXR0ZXIiOiJPZmYiLCJ5YXdfdmFsdWUiOjAsIm92ZXJyaWRlIjp0cnVlLCJ5YXdfaml0dGVyX3ZhbHVlIjowfSx7Inlhd19iYXNlIjoiQXQgdGFyZ2V0cyIsInBpdGNoIjoiRG93biIsImJvZHlfeWF3IjoiT3Bwb3NpdGUiLCJ5YXciOiIxODAiLCJmcmVlc3RhbmRfYm9keV95YXciOmZhbHNlLCJib2R5X3lhd192YWx1ZSI6MTgwLCJ5YXdfaml0dGVyIjoiUmFuZG9tIiwieWF3X3ZhbHVlIjoxOSwib3ZlcnJpZGUiOnRydWUsInlhd19qaXR0ZXJfdmFsdWUiOjI5fSx7Inlhd19iYXNlIjoiQXQgdGFyZ2V0cyIsInBpdGNoIjoiRG93biIsImJvZHlfeWF3IjoiT3Bwb3NpdGUiLCJ5YXciOiIxODAiLCJmcmVlc3RhbmRfYm9keV95YXciOmZhbHNlLCJib2R5X3lhd192YWx1ZSI6MTgwLCJ5YXdfaml0dGVyIjoiUmFuZG9tIiwieWF3X3ZhbHVlIjotMjIsIm92ZXJyaWRlIjp0cnVlLCJ5YXdfaml0dGVyX3ZhbHVlIjo0MH0seyJ5YXdfYmFzZSI6IkF0IHRhcmdldHMiLCJwaXRjaCI6IkRvd24iLCJib2R5X3lhdyI6Ik9wcG9zaXRlIiwieWF3IjoiMTgwIiwiZnJlZXN0YW5kX2JvZHlfeWF3IjpmYWxzZSwiYm9keV95YXdfdmFsdWUiOjE4MCwieWF3X2ppdHRlciI6IlJhbmRvbSIsInlhd192YWx1ZSI6MjIsIm92ZXJyaWRlIjp0cnVlLCJ5YXdfaml0dGVyX3ZhbHVlIjotMzF9LHsieWF3X2Jhc2UiOiJBdCB0YXJnZXRzIiwicGl0Y2giOiJEb3duIiwiYm9keV95YXciOiJPcHBvc2l0ZSIsInlhdyI6IjE4MCIsImZyZWVzdGFuZF9ib2R5X3lhdyI6ZmFsc2UsImJvZHlfeWF3X3ZhbHVlIjoxODAsInlhd19qaXR0ZXIiOiJSYW5kb20iLCJ5YXdfdmFsdWUiOjIyLCJvdmVycmlkZSI6dHJ1ZSwieWF3X2ppdHRlcl92YWx1ZSI6MjR9LHsieWF3X2Jhc2UiOiJMb2NhbCB2aWV3IiwicGl0Y2giOiJEb3duIiwiYm9keV95YXciOiJPcHBvc2l0ZSIsInlhdyI6IjE4MCIsImZyZWVzdGFuZF9ib2R5X3lhdyI6ZmFsc2UsImJvZHlfeWF3X3ZhbHVlIjoxODAsInlhd19qaXR0ZXIiOiJSYW5kb20iLCJ5YXdfdmFsdWUiOjE5LCJvdmVycmlkZSI6dHJ1ZSwieWF3X2ppdHRlcl92YWx1ZSI6Mjh9LHsieWF3X2Jhc2UiOiJBdCB0YXJnZXRzIiwicGl0Y2giOiJEb3duIiwiYm9keV95YXciOiJPcHBvc2l0ZSIsInlhdyI6IjE4MCIsImZyZWVzdGFuZF9ib2R5X3lhdyI6ZmFsc2UsImJvZHlfeWF3X3ZhbHVlIjoxODAsInlhd19qaXR0ZXIiOiJSYW5kb20iLCJ5YXdfdmFsdWUiOi0xNywib3ZlcnJpZGUiOnRydWUsInlhd19qaXR0ZXJfdmFsdWUiOjIyfV0sW3siZGVmZW5zaXZlX21vZGlmaWVycyI6ZmFsc2UsInlhd19iYXNlIjoiTG9jYWwgdmlldyIsInBpdGNoIjoiT2ZmIiwiZGVmZW5zaXZlX2FhX2VuYWJsZSI6ZmFsc2UsImJvZHlfeWF3IjoiT2ZmIiwieWF3IjoiT2ZmIiwieWF3X3ZhbHVlIjowLCJ5YXdfaml0dGVyX3ZhbHVlIjowLCJ5YXdfaml0dGVyIjoiT2ZmIiwiYm9keV95YXdfdmFsdWUiOjAsInBpdGNoX3ZhbHVlIjowLCJmb3JjZV9kZWZlbnNpdmUiOmZhbHNlfSx7ImRlZmVuc2l2ZV9tb2RpZmllcnMiOnRydWUsInlhd19iYXNlIjoiQXQgdGFyZ2V0cyIsInBpdGNoIjoiRG93biIsImRlZmVuc2l2ZV9hYV9lbmFibGUiOnRydWUsImJvZHlfeWF3IjoiT3Bwb3NpdGUiLCJ5YXciOiIxODAiLCJ5YXdfdmFsdWUiOi0yMiwieWF3X2ppdHRlcl92YWx1ZSI6NTQsInlhd19qaXR0ZXIiOiJSYW5kb20iLCJib2R5X3lhd192YWx1ZSI6MTgwLCJwaXRjaF92YWx1ZSI6MCwiZm9yY2VfZGVmZW5zaXZlIjp0cnVlfSx7ImRlZmVuc2l2ZV9tb2RpZmllcnMiOnRydWUsInlhd19iYXNlIjoiQXQgdGFyZ2V0cyIsInBpdGNoIjoiRG93biIsImRlZmVuc2l2ZV9hYV9lbmFibGUiOnRydWUsImJvZHlfeWF3IjoiT3Bwb3NpdGUiLCJ5YXciOiIxODAiLCJ5YXdfdmFsdWUiOjIyLCJ5YXdfaml0dGVyX3ZhbHVlIjoyNCwieWF3X2ppdHRlciI6IlJhbmRvbSIsImJvZHlfeWF3X3ZhbHVlIjoxODAsInBpdGNoX3ZhbHVlIjowLCJmb3JjZV9kZWZlbnNpdmUiOnRydWV9LHsiZGVmZW5zaXZlX21vZGlmaWVycyI6dHJ1ZSwieWF3X2Jhc2UiOiJBdCB0YXJnZXRzIiwicGl0Y2giOiJEb3duIiwiZGVmZW5zaXZlX2FhX2VuYWJsZSI6dHJ1ZSwiYm9keV95YXciOiJPZmYiLCJ5YXciOiIxODAiLCJ5YXdfdmFsdWUiOi0yNCwieWF3X2ppdHRlcl92YWx1ZSI6LTUyLCJ5YXdfaml0dGVyIjoiUmFuZG9tIiwiYm9keV95YXdfdmFsdWUiOjE4MCwicGl0Y2hfdmFsdWUiOjAsImZvcmNlX2RlZmVuc2l2ZSI6dHJ1ZX0seyJkZWZlbnNpdmVfbW9kaWZpZXJzIjp0cnVlLCJ5YXdfYmFzZSI6IkF0IHRhcmdldHMiLCJwaXRjaCI6IkRvd24iLCJkZWZlbnNpdmVfYWFfZW5hYmxlIjp0cnVlLCJib2R5X3lhdyI6Ik9wcG9zaXRlIiwieWF3IjoiMTgwIiwieWF3X3ZhbHVlIjotMjIsInlhd19qaXR0ZXJfdmFsdWUiOjQ5LCJ5YXdfaml0dGVyIjoiUmFuZG9tIiwiYm9keV95YXdfdmFsdWUiOjE4MCwicGl0Y2hfdmFsdWUiOjAsImZvcmNlX2RlZmVuc2l2ZSI6dHJ1ZX0seyJkZWZlbnNpdmVfbW9kaWZpZXJzIjp0cnVlLCJ5YXdfYmFzZSI6IkF0IHRhcmdldHMiLCJwaXRjaCI6IkRvd24iLCJkZWZlbnNpdmVfYWFfZW5hYmxlIjp0cnVlLCJib2R5X3lhdyI6Ik9wcG9zaXRlIiwieWF3IjoiMTgwIiwieWF3X3ZhbHVlIjotMTgsInlhd19qaXR0ZXJfdmFsdWUiOjUyLCJ5YXdfaml0dGVyIjoiUmFuZG9tIiwiYm9keV95YXdfdmFsdWUiOjE4MCwicGl0Y2hfdmFsdWUiOjAsImZvcmNlX2RlZmVuc2l2ZSI6dHJ1ZX0seyJkZWZlbnNpdmVfbW9kaWZpZXJzIjp0cnVlLCJ5YXdfYmFzZSI6IkF0IHRhcmdldHMiLCJwaXRjaCI6IkRvd24iLCJkZWZlbnNpdmVfYWFfZW5hYmxlIjp0cnVlLCJib2R5X3lhdyI6Ik9wcG9zaXRlIiwieWF3IjoiMTgwIiwieWF3X3ZhbHVlIjoyNiwieWF3X2ppdHRlcl92YWx1ZSI6NDcsInlhd19qaXR0ZXIiOiJSYW5kb20iLCJib2R5X3lhd192YWx1ZSI6MTgwLCJwaXRjaF92YWx1ZSI6MCwiZm9yY2VfZGVmZW5zaXZlIjp0cnVlfV1d") end)
    }, 

misc = {
    console_filter = group:checkbox("\aFF0110FF•\v  Console Filter"),
    discharge = group:checkbox("\aFF0110FF⚠ \vExperimental Auto Recharge Double Tap Exploit"),
        d_mode = group:combobox("\vMode", "\aFF0110FFInstant", "\aFF0110FFIdeal"),
    }
}

_ui.home.infolabel1:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFHome"})
_ui.home.infolabel2:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFHome"})
_ui.home.infolabel3:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFHome"})
_ui.home.infolabel4:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFHome"})
_ui.ragebot.label33:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFRagebot"})
_ui.visuals.label:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFVisuals"})
_ui.home.infolabel5:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFHome"})
_ui.home.discord:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFHome"})

aa_builder = {}
aa_builder_defensive = {}

for i = 1, 7 do
    aa_builder[i] = {}
    aa_builder[i].override = group:checkbox("\v➤  Override  " .. aa_state_full[i] .. "  \v➤  Player State")
    aa_builder[i].pitch = group:combobox(aa_state_full[i] .. "  \v⮞  Pitch", "Off", "Default", "Down", "Up", "Minimal", "Random")
    aa_builder[i].yaw_base = group:combobox(aa_state_full[i] .. "  \v⮞  Yaw Base", "Local view", "At targets")
    aa_builder[i].yaw = group:combobox(aa_state_full[i] .. "  \v⮞  Yaw", "Off", "180", "Spin", "Static", "180 Z", "Crosshair")
    aa_builder[i].yaw_value = group:slider(aa_state_full[i] .. "  \v⮞  Yaw Offset", -180, 180, 0)
    aa_builder[i].yaw_jitter = group:combobox(aa_state_full[i] .. "  \v⮞  Yaw Jitter", "Off", "Offset", "Center", "Random", "Skitter")
    aa_builder[i].yaw_jitter_value = group:slider(aa_state_full[i] .. "  \v⮞  Yaw Jitter Value", -180, 180, 0)
    aa_builder[i].body_yaw = group:combobox(aa_state_full[i] .. "  \v⮞  Body Yaw", "Off", "Opposite", "Jitter", "Static")
    aa_builder[i].body_yaw_value = group:slider(aa_state_full[i] .. "  \v⮞  Body Yaw Value", -180, 180, 0)
    aa_builder[i].freestand_body_yaw = group:checkbox(aa_state_full[i] .. "  \v⮞  Freestanding Body Yaw")

    aa_builder_defensive[i] = {}
    aa_builder_defensive[i].defensive_modifiers = group:checkbox(aa_state_full[i] .. "  \v⮞ Defensive Modifiers")
    aa_builder_defensive[i].force_defensive = group:checkbox(aa_state_full[i] .. "  \v⮞ Force Defensive")
    aa_builder_defensive[i].defensive_aa_enable = group:checkbox(aa_state_full[i] .. "  \v⮞ Defensive Anti-Aim")
    aa_builder_defensive[i].pitch = group:combobox(aa_state_full[i] .. "  \v⮞ Defensive Pitch", "Off", "Default", "Down", "Up", "Minimal", "Random", "Custom")
    aa_builder_defensive[i].pitch_value = group:slider(aa_state_full[i] .. "  \v⮞ Defensive Pitch Value", -89, 89, 0)
    aa_builder_defensive[i].yaw_base = group:combobox(aa_state_full[i] .. "  \v⮞ Defensive Yaw Base", "Local view", "At targets")
    aa_builder_defensive[i].yaw = group:combobox(aa_state_full[i] .. "  \v⮞ Defensive Yaw", "Off", "180", "Spin", "Static", "180 Z", "Crosshair")
    aa_builder_defensive[i].yaw_value = group:slider(aa_state_full[i] .. "  \v⮞ Defensive Yaw Offset", -180, 180, 0)
    aa_builder_defensive[i].yaw_jitter = group:combobox(aa_state_full[i] .. "  \v⮞ Defensive Yaw Jitter", "Off", "Offset", "Center", "Random", "Skitter")
    aa_builder_defensive[i].yaw_jitter_value = group:slider(aa_state_full[i] .. "  \v⮞ Defensive Yaw Jitter Value", -180, 180, 0)
    aa_builder_defensive[i].body_yaw = group:combobox(aa_state_full[i] .. "  \v⮞ Defensive Body Yaw", "Off", "Opposite", "Jitter", "Static")
    aa_builder_defensive[i].body_yaw_value = group:slider(aa_state_full[i] .. "  \v⮞ Defensive Body Yaw Value", -180, 180, 0)
end

_ui.lua.tab:depend({_ui.lua.enable, true})

_ui.antiaim.enable:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"})
_ui.antiaim.tab:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true})
_ui.antiaim.condition:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"})
for i = 1, 7 do
    aa_builder[i].override:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"}, {_ui.antiaim.condition, aa_state_full[i]})
    aa_builder[i].pitch:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"}, {_ui.antiaim.condition, aa_state_full[i]}, {aa_builder[i].override, true})
    aa_builder[i].yaw_base:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"}, {_ui.antiaim.condition, aa_state_full[i]}, {aa_builder[i].override, true})
    aa_builder[i].yaw:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"}, {_ui.antiaim.condition, aa_state_full[i]}, {aa_builder[i].override, true})
    aa_builder[i].yaw_value:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"}, {_ui.antiaim.condition, aa_state_full[i]}, {aa_builder[i].override, true}, {aa_builder[i].yaw, "180", "Spin", "Static", "180 Z"})
    aa_builder[i].yaw_jitter:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"}, {_ui.antiaim.condition, aa_state_full[i]}, {aa_builder[i].override, true})
    aa_builder[i].yaw_jitter_value:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"}, {_ui.antiaim.condition, aa_state_full[i]}, {aa_builder[i].override, true}, {aa_builder[i].yaw_jitter, "Offset", "Center", "Random", "Skitter"})
    aa_builder[i].body_yaw:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"}, {_ui.antiaim.condition, aa_state_full[i]}, {aa_builder[i].override, true})
    aa_builder[i].body_yaw_value:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"}, {_ui.antiaim.condition, aa_state_full[i]}, {aa_builder[i].override, true}, {aa_builder[i].body_yaw, "Jitter", "Static"})
    aa_builder[i].freestand_body_yaw:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"}, {_ui.antiaim.condition, aa_state_full[i]}, {aa_builder[i].override, true}, {aa_builder[i].body_yaw, "Opposite", "Jitter", "Static"})

    aa_builder_defensive[i].defensive_modifiers:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"}, {_ui.antiaim.condition, aa_state_full[i]}, {aa_builder[i].override, true})
    aa_builder_defensive[i].force_defensive:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"}, {_ui.antiaim.condition, aa_state_full[i]}, {aa_builder_defensive[i].defensive_modifiers, true}, {aa_builder[i].override, true})
    aa_builder_defensive[i].defensive_aa_enable:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"}, {_ui.antiaim.condition, aa_state_full[i]}, {aa_builder_defensive[i].defensive_modifiers, true}, {aa_builder[i].override, true})
    aa_builder_defensive[i].pitch:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"}, {_ui.antiaim.condition, aa_state_full[i]}, {aa_builder_defensive[i].defensive_modifiers, true}, {aa_builder[i].override, true}, {aa_builder_defensive[i].defensive_aa_enable, true})
    aa_builder_defensive[i].pitch_value:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"}, {_ui.antiaim.condition, aa_state_full[i]}, {aa_builder_defensive[i].pitch, "Custom"}, {aa_builder_defensive[i].defensive_modifiers, true}, {aa_builder[i].override, true}, {aa_builder_defensive[i].defensive_aa_enable, true})
    aa_builder_defensive[i].yaw_base:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"}, {_ui.antiaim.condition, aa_state_full[i]}, {aa_builder_defensive[i].defensive_modifiers, true}, {aa_builder[i].override, true}, {aa_builder_defensive[i].defensive_aa_enable, true})
    aa_builder_defensive[i].yaw:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"}, {_ui.antiaim.condition, aa_state_full[i]}, {aa_builder_defensive[i].defensive_modifiers, true}, {aa_builder[i].override, true}, {aa_builder_defensive[i].defensive_aa_enable, true})
    aa_builder_defensive[i].yaw_value:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"}, {_ui.antiaim.condition, aa_state_full[i]}, {aa_builder_defensive[i].defensive_modifiers, true}, {aa_builder_defensive[i].yaw, "180", "Spin", "Static", "180 Z"}, {aa_builder[i].override, true}, {aa_builder_defensive[i].defensive_aa_enable, true})
    aa_builder_defensive[i].yaw_jitter:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"}, {_ui.antiaim.condition, aa_state_full[i]}, {aa_builder_defensive[i].defensive_modifiers, true}, {aa_builder[i].override, true}, {aa_builder_defensive[i].defensive_aa_enable, true})
    aa_builder_defensive[i].yaw_jitter_value:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"}, {_ui.antiaim.condition, aa_state_full[i]}, {aa_builder_defensive[i].defensive_modifiers, true}, {aa_builder_defensive[i].yaw_jitter, "Offset", "Center", "Random", "Skitter"}, {aa_builder[i].override, true}, {aa_builder_defensive[i].defensive_aa_enable, true})
    aa_builder_defensive[i].body_yaw:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"}, {_ui.antiaim.condition, aa_state_full[i]}, {aa_builder_defensive[i].defensive_modifiers, true}, {aa_builder[i].override, true}, {aa_builder_defensive[i].defensive_aa_enable, true})
    aa_builder_defensive[i].body_yaw_value:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFBuilder"}, {_ui.antiaim.condition, aa_state_full[i]}, {aa_builder_defensive[i].defensive_modifiers, true}, {aa_builder_defensive[i].body_yaw, "Jitter", "Static"}, {aa_builder[i].override, true}, {aa_builder_defensive[i].defensive_aa_enable, true})
end
for k,v in pairs({_ui.antiaim.tweaks, _ui.antiaim.freestanding, _ui.antiaim.anti_backstab_checkbox, _ui.antiaim.edge_yaw, _ui.antiaim.cfg_export, _ui.antiaim.cfg_import, _ui.antiaim.cfg_reset, _ui.antiaim.cfg_default}) do v:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFAnti-aim"}, {_ui.antiaim.enable, true}, {_ui.antiaim.tab, "\aFF0110FFSettings"}) end

for k,v in pairs({_ui.misc.console_filter, _ui.misc.discharge}) do v:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFMiscellaneous"}) end
_ui.misc.d_mode:depend({_ui.lua.enable, true}, {_ui.lua.tab, "\aFF0110FFMiscellaneous"}, {_ui.misc.discharge, true})

local hide_refs = function(value)
    value = not value
    ui.set_visible(ref.aa_enable, value) ui.set_visible(ref.pitch, value) ui.set_visible(ref.pitch_value, value)
    ui.set_visible(ref.yaw_base, value) ui.set_visible(ref.yaw, value) ui.set_visible(ref.yaw_value, value)
    ui.set_visible(ref.yaw_jitter, value) ui.set_visible(ref.yaw_jitter_value, value) ui.set_visible(ref.body_yaw, value)
    ui.set_visible(ref.body_yaw_value, value) ui.set_visible(ref.edgeyaw, value) ui.set_visible(ref.freestand[1], value)
    ui.set_visible(ref.freestand[2], value) ui.set_visible(ref.roll, value) ui.set_visible(ref.freestand_body_yaw, value)
end

local config_items = {
    _ui.antiaim,
    aa_builder,
    aa_builder_defensive
}

local package, data, encrypted, decrypted = pui.setup(config_items), "", "", ""
config = {}

config.export = function()
    data = package:save()
    encrypted = base64.encode(json.stringify(data))
    clipboard_export(encrypted)
end

config.import = function(input)
    decrypted = json.parse(base64.decode(input ~= nil and input or clipboard_import()))
    package:load(decrypted)
end

local function choking(cmd)
    local choke = false

    if cmd.allow_send_packet == false or cmd.chokedcommands > 1 then
        choke = true
    else
        choke = false
    end

    return choke
end


local antiaim_features = function(cmd)
    if not _ui.antiaim.enable.value or not _ui.lua.enable.value or not entity.get_local_player() then return end

    local state = get_state(get_velocity())
    local players = entity.get_players(false)
    local get_override = aa_builder[state].override.value and state or 1

    cmd.force_defensive = aa_builder_defensive[get_override].force_defensive.value and true
    ui.set(ref.freestand[1], ui.get(_ui.antiaim.freestanding.ref) and true or false)
    ui.set(ref.edgeyaw, ui.get(_ui.antiaim.edge_yaw.ref) and true or false)
	
    ui.set(ref.roll, 0)
    ui.set(ref.freestand[2], "always on")

    for k, v in pairs(ref) do
        local key = (is_defensive_active() and not choking(cmd) and aa_builder_defensive[get_override].defensive_modifiers.value and aa_builder_defensive[get_override].defensive_aa_enable.value) and aa_builder_defensive[get_override][k] or aa_builder[get_override][k]
        
        if key then
            ui.set(v, key.value)
        end
    end
	end

local client_latency, client_screen_size, client_set_event_callback, client_system_time, entity_get_local_player, entity_get_player_resource, entity_get_prop, globals_absoluteframetime, globals_tickinterval, math_ceil, math_floor, math_min, math_sqrt, renderer_measure_text, ui_reference, pcall, renderer_gradient, renderer_rectangle, renderer_text, string_format, table_insert, ui_get, ui_new_checkbox, ui_new_color_picker, ui_new_multiselect, ui_new_textbox, ui_set, ui_set_callback, ui_set_visible = client.latency, client.screen_size, client.set_event_callback, client.system_time, entity.get_local_player, entity.get_player_resource, entity.get_prop, globals.absoluteframetime, globals.tickinterval, math.ceil, math.floor, math.min, math.sqrt, renderer.measure_text, ui.reference, pcall, renderer.gradient, renderer.rectangle, renderer.text, string.format, table.insert, ui.get, ui.new_checkbox, ui.new_color_picker, ui.new_multiselect, ui.new_textbox, ui.set, ui.set_callback, ui.set_visible

local flag, old_renderer_text, old_renderer_measure_text = "d", renderer_text, renderer_measure_text
function renderer_text(x, y, r, g, b, a, flags, max_width, ...)
	return old_renderer_text(x, y, r, g, b, a, flags == nil and flag or flag .. flags, max_width, ...)
end
function renderer_measure_text(flags, ...)
	return old_renderer_measure_text(flags == nil and flag or flag .. flags, ...)
end

local allow_unsafe_scripts = pcall(client.create_interface)

local FLOW_OUTGOING, FLOW_INCOMING = 0, 1
local native_GetNetChannelInfo, GetRemoteFramerate, native_GetTimeSinceLastReceived, native_GetAvgChoke, native_GetAvgLoss, native_IsLoopback, GetAddress

if allow_unsafe_scripts then
	local ffi = require "ffi"

	local function vmt_entry(instance, index, type)
		return ffi.cast(type, (ffi.cast("void***", instance)[0])[index])
	end

	local function vmt_thunk(index, typestring)
		local t = ffi.typeof(typestring)
		return function(instance, ...)
			assert(instance ~= nil)
			if instance then
				return vmt_entry(instance, index, t)(instance, ...)
			end
		end
	end

	local function vmt_bind(module, interface, index, typestring)
		local instance = client.create_interface(module, interface) or error("invalid interface")
		local instance = client.create_interface(module, interface) or error("invalid interface")
		local fnptr = vmt_entry(instance, index, ffi.typeof(typestring)) or error("invalid vtable")
		return function(...)
			return fnptr(instance, ...)
		end
	end

	native_GetNetChannelInfo = vmt_bind("engine.dll", "VEngineClient014", 78, "void*(__thiscall*)(void*)")
	local native_GetName = vmt_thunk(0, "const char*(__thiscall*)(void*)")
	local native_GetAddress = vmt_thunk(1, "const char*(__thiscall*)(void*)")
	native_IsLoopback = vmt_thunk(6, "bool(__thiscall*)(void*)")
	local native_IsTimingOut = vmt_thunk(7, "bool(__thiscall*)(void*)")
	native_GetAvgLoss = vmt_thunk(11, "float(__thiscall*)(void*, int)")
	native_GetAvgChoke = vmt_thunk(12, "float(__thiscall*)(void*, int)")
	native_GetTimeSinceLastReceived = vmt_thunk(22, "float(__thiscall*)(void*)")
	local native_GetRemoteFramerate = vmt_thunk(25, "void(__thiscall*)(void*, float*, float*, float*)")
	local native_GetTimeoutSeconds = vmt_thunk(26, "float(__thiscall*)(void*)")

	local pflFrameTime = ffi.new("float[1]")
	local pflFrameTimeStdDeviation = ffi.new("float[1]")
	local pflFrameStartTimeStdDeviation = ffi.new("float[1]")

	function GetRemoteFramerate(netchannelinfo)
		native_GetRemoteFramerate(netchannelinfo, pflFrameTime, pflFrameTimeStdDeviation, pflFrameStartTimeStdDeviation)
		if pflFrameTime ~= nil and pflFrameTimeStdDeviation ~= nil and pflFrameStartTimeStdDeviation ~= nil then
			return pflFrameTime[0], pflFrameTimeStdDeviation[0], pflFrameStartTimeStdDeviation[0]
		end
	end

	function GetAddress(netchannelinfo)
		local addr = native_GetAddress(netchannelinfo)
		if addr ~= nil then
			return ffi.string(addr)
		end
	end

	local function GetName(netchannelinfo)
		local name = native_GetName(netchannelinfo)
		if name ~= nil then
			return ffi.string(name)
		end
	end
end


local cvar_game_mode, cvar_game_type, cvar_fps_max, cvar_fps_max_menu = cvar.game_mode, cvar.game_type, cvar.fps_max, cvar.fps_max_menu
local table_clear = require "table.clear"

local window = ((function() local a={}local b,c,d,e,f=renderer.rectangle,renderer.gradient,renderer.texture,math.floor,math.ceil;local function g(h,i,j,k,l,m,n,o,p)p=p or 1;b(h,i,j,p,l,m,n,o)b(h,i+k-p,j,p,l,m,n,o)b(h,i+p,p,k-p*2,l,m,n,o)b(h+j-p,i+p,p,k-p*2,l,m,n,o)end;local function q(h,i,j,k,r,s,t,u,v,w,x,y,z,p)p=p or 1;if z then b(h,i,p,k,r,s,t,u)b(h+j-p,i,p,k,v,w,x,y)c(h+p,i,j-p*2,p,r,s,t,u,v,w,x,u,true)c(h+p,i+k-p,j-p*2,p,r,s,t,u,v,w,x,u,true)else b(h,i,j,p,r,s,t,u)b(h,i+k-p,j,p,v,w,x,y)c(h,i+p,p,k-p*2,r,s,t,u,v,w,x,y,false)c(h+j-p,i+p,p,k-p*2,r,s,t,u,v,w,x,y,false)end end;local A;do local B="\x14\x14\x14\xFF"local C="\x0c\x0c\x0c\xFF"A=renderer.load_rgba(table.concat({B,B,B,C,B,C,B,C,B,C,B,B,B,C,B,C}),4,4)end;local function D(E,F)if F~=nil and type(E)=="string"and E:sub(-1,-1)=="%"then E=math.floor(tonumber(E:sub(1,-2))/100*F)end;return E end;local function G(H)if H.position=="fixed"then local I,J=client.screen_size()if H.left~=nil then H.x=D(H.left,I)elseif H.right~=nil then H.x=I-(H.w or 0)-D(H.right,I)end;if H.top~=nil then H.y=D(H.top,J)elseif H.bottom~=nil then H.y=J-(H.h or 0)-D(H.bottom,J)end end;local h,i,j,k,o=H.x,H.y,H.w,H.h,H.a or 255;local K=1;if h==nil or i==nil or j==nil or o==nil then return end;H.i_x,H.i_y,H.i_w,H.i_h=H.x,H.y,H.w,H.h;if H.title_bar then K=(H.title~=nil and select(2,renderer.measure_text(H.title_text_size,H.title))or 13)+2;H.t_x,H.t_y,H.t_w,H.t_h=H.x,H.y,H.w,K end;if H.border then g(h,i,j,k,18,18,18,o)g(h+1,i+1,j-2,k-2,62,62,62,o)g(h+2,i+K+1,j-4,k-K-3,44,44,44,o,H.border_width)g(h+H.border_width+2,i+K+H.border_width+1,j-H.border_width*2-4,k-K-H.border_width*2-3,62,62,62,o)H.i_x=H.i_x+H.border_width+3;H.i_y=H.i_y+H.border_width+3;H.i_w=H.i_w-(H.border_width+3)*2;H.i_h=H.i_h-(H.border_width+3)*2;H.t_x,H.t_y,H.t_w=H.x+2,H.y+2,H.w-4;K=K-1 end;if K>1 then c(H.t_x,H.t_y,H.t_w,K,56,56,56,o,44,44,44,o,false)if H.title~=nil then local l,m,n,o=unpack(H.title_text_color)o=o*H.a/255;renderer.text(H.t_x+3,H.t_y+2,l or 255,m or 255,n or 255,o or 255,(H.title_text_size or"")..(H.title_text_flags or""),0,tostring(H.title))end;H.i_y=H.i_y+K;H.i_h=H.i_h-K end;if H.gradient_bar then local L=0;if H.background then L=1;local M,N=16,25;b(H.i_x+1,H.i_y,H.i_w-2,1,M,M,M,o)b(H.i_x+1,H.i_y+3,H.i_w-2,1,N,N,N,o)for O=0,1 do c(H.i_x+(H.i_w-1)*O,H.i_y,1,4,M,M,M,o,N,N,N,o,false)end end;do local h,i,P=H.i_x+L,H.i_y+L,1;local Q,R=e((H.i_w-L*2)/2),f((H.i_w-L*2)/2)for O=1,2 do c(h,i,Q,1,59*P,175*P,222*P,o,202*P,70*P,205*P,o,true)c(h+Q,i,R,1,202*P,70*P,205*P,o,201*P,227*P,58*P,o,true)i,P=i+1,P*0.5 end end;H.i_y=H.i_y+2+L*2;H.i_h=H.i_h-2-L*2 end;if H.background then d(A,H.i_x,H.i_y,H.i_w,H.i_h,255,255,255,255,"t")end;if H.draggable then local p=7;renderer.triangle(h+j-1,i+k-p,h+j-1,i+k-1,h+j-p,i+k-1,62,62,62,o)end;H.i_x=H.i_x+H.margin_left;H.i_w=H.i_w-H.margin_left-H.margin_right;H.i_y=H.i_y+H.margin_top;H.i_h=H.i_h-H.margin_top-H.margin_bottom end;local S={}local T={}local U={}local V={__index=U}function U:set_active(W)if W then S[self.id]=self;table.insert(T,1,self.id)else S[self.id]=nil end end;function U:set_z_index(X)self.z_index=X;self.z_index_reset=true end;function U:is_in_window(h,i)return h>=self.x and h<=self.x+self.w and i>=self.y and i<=self.y+self.h end;function U:set_inner_width(Y)if self.border then Y=Y+(self.border_width+3)*2 end;Y=Y+self.margin_left+self.margin_right;self.w=Y end;function U:set_inner_height(Z)local K=1;if self.title_bar then K=(self.title~=nil and select(2,renderer.measure_text(self.title_text_size,self.title))or 13)+2 end;if self.border then Z=Z+(self.border_width+3)*2;K=K-1 end;if K>1 then Z=Z+K end;if self.gradient_bar then local L=0;if self.background then L=1 end;Z=Z+2+L*2 end;Z=Z+self.margin_top+self.margin_bottom;self.h=Z end;function a.new(_,h,i,j,k,a0)local H=setmetatable({id=_,top=h,left=i,w=j,h=k,a=255,paint_callback=a0,title_bar=true,title_bar_in_menu=false,title_text_color={255,255,255,255},title_text_size=nil,gradient_bar=true,border=true,border_width=3,background=true,first=true,visible=true,margin_top=0,margin_bottom=0,margin_left=0,margin_right=0,position="fixed",draggable=false,draggable_save=false,in_menu=false},V)H:set_active(true)return H end;local a1,a2,a3;local function a4(a5)local a6={"bottom","unset","top"}local a7={}for O=#T,1,-1 do local H=S[T[O]]if H~=nil then local a8=H.z_index or"unset"if H.z_index_reset then H.z_index=nil;H.z_index_reset=nil end;a7[a8]=a7[a8]or{}if H.first then table.insert(a7[a8],1,H.id)H.first=nil else table.insert(a7[a8],H.id)end end end;T={}for O=1,#a6 do local a9=a7[a6[O]]if a9~=nil then for O=#a9,1,-1 do table.insert(T,a9[O])end end end;local aa=ui.is_menu_open()local ab={}for O=1,#T do local H=S[T[O]]if H~=nil and H.in_menu==a5 then if H.title_bar_in_menu then H.title_bar=aa end;if H.pre_paint_callback~=nil then H:pre_paint_callback()end;if S[H.id]~=nil then table.insert(ab,S[H.id])end end end;if aa then local ac,ad=ui.mouse_position()local ae=client.key_state(0x01)if ae then for O=#ab,1,-1 do local H=ab[O]if H.visible and H:is_in_window(a1,a2)then H.first=true;if a3 then local af,ag=ac-a1,ad-a2;if H.position=="fixed"then local ah=H.left==nil and"right"or"left"local ai=H.top==nil and"bottom"or"top"local aj={{ah,(ah=="right"and-1 or 1)*af},{ai,(ai=="bottom"and-1 or 1)*ag}}for O=1,#aj do local ak,al=unpack(aj[O])local am=type(H[ak])if am=="string"and H[ak]:sub(-1,-1)=="%"then elseif am=="number"then H[ak]=H[ak]+al end end else H.x=H.x+af;H.y=H.y+ag end end;break end end end;a1,a2=ac,ad;a3=ae end;for O=1,#ab do local H=ab[O]if H.visible and H.in_menu==a5 then G(H)if H.paint_callback~=nil then H:paint_callback()end end end end;local a1,a2,a3;client.delay_call(0,client.set_event_callback,"paint",function()a4(false)end)client.delay_call(0,client.set_event_callback,"paint_ui",function()a4(true)end)return a end)()).new("watermark")
window.title = "Watermark"
window.title_bar = false
window.margin_bottom = 2
window.margin_left = 3
window.margin_right = 3
window.border_width = 2
window.top = 15
window.right = 15
window.in_menu = true

local db = database.read("sapphyrus_watermark") or {}

local antiut_reference = ui_reference("MISC", "Settings", "Anti-untrusted")
local is_beta = pcall(ui_reference, "MISC", "Settings", "Crash logs")

local names = {"Logo", "Name lua", "FPS", "Server framerate", "Server IP", "Network lag", "Tickrate", "Time", "Time + seconds"}

local watermark_reference = ui_new_multiselect("VISUALS", "Effects", "Watermark ", names)
local color_reference = ui_new_color_picker("VISUALS", "Effects", "Watermark", 149, 184, 6, 255)
local rainbow_line_reference = ui_new_checkbox("VISUALS", "Effects", "Watermark rainbow line")

local fps_prev = 0
local value_prev = {}
local last_update_time = 0

local offset_x, offset_y = -15, 15

local function clamp(cur_val, min_val, max_val)
	return math_min(math.max(cur_val, min_val), max_val)
end

local function lerp(a, b, percentage)
	return a + (b - a) * percentage
end

local function table_contains(tbl, val)
	for i=1, #tbl do
		if tbl[i] == val then
			return true
		end
	end
	return false
end

local function table_remove_element(tbl, val)
	local tbl_new = {}
	for i=1, #tbl do
		if tbl[i] ~= val then
			table_insert(tbl_new, tbl[i])
		end
	end
	return tbl_new
end

local function table_lerp(a, b, percentage)
	local result = {}
	for i=1, #a do
		result[i] = lerp(a[i], b[i], percentage)
	end
	return result
end

local function on_watermark_changed()
	local value = ui_get(watermark_reference)

	if #value > 0 then
		--Make Time / Time + seconds act as a kind of "switch", only allow one to be selected at a time.
		if table_contains(value, "Time") and table_contains(value, "Time + seconds") then
			local value_new = value
			if not table_contains(value_prev, "Time") then
				value_new = table_remove_element(value_new, "Time + seconds")
			elseif not table_contains(value_prev, "Time + seconds") then
				value_new = table_remove_element(value_new, "Time")
			end

			--this shouldn't happen, but why not add a failsafe
			if table_contains(value_new, "Time") and table_contains(value_new, "Time + seconds") then
				value_new = table_remove_element(value_new, "Time")
			end

			ui_set(watermark_reference, value_new)
			on_watermark_changed()
			return
		end
	end
	ui_set_visible(rainbow_line_reference, #value > 0)

	value_prev = value
end
ui_set_callback(watermark_reference, on_watermark_changed)
on_watermark_changed()

local function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math_floor(num * mult + 0.5) / mult
end

local ft_prev = 0
local function get_fps()
	ft_prev = ft_prev * 0.9 + globals_absoluteframetime() * 0.1
	return round(1 / ft_prev)
end

local function lerp_color_yellow_red(val, max_normal, max_yellow, max_red, default, yellow, red)
	default = default or {255, 255, 255}
	yellow = yellow or {230, 210, 40}
	red = red or {255, 32, 32}
	if val > max_yellow then
		return unpack(table_lerp(yellow, red, clamp((val-max_yellow)/(max_red-max_yellow), 0, 1)))
	else
		return unpack(table_lerp(default, yellow, clamp((val-max_normal)/(max_yellow-max_normal), 0, 1)))
	end
end


local watermark_items = {
    {
        name = "Logo",
        get_width = function(self, frame_data)
            self.game_width = renderer_measure_text(nil, "SHIT")
            self.sense_width = renderer_measure_text(nil, "SENSE")
            self.beta_width = (is_beta and (renderer_measure_text(nil, " [beta]")) or 0)
            return self.game_width + self.sense_width + self.beta_width
        end,
        draw = function(self, x, y, w, h, r, g, b, a)
            local r_sense, g_sense, b_sense = ui_get(color_reference)

            renderer_text(x, y, 255, 32, 32, a, nil, 0, "SHIT")
            renderer_text(x+self.game_width, y, r_sense, g_sense, b_sense, a, nil, 0, "SENSE")
            if is_beta then
                renderer_text(x+self.game_width+self.sense_width, y, 255, 255, 255, a*0.9, nil, 0, " [beta]")
            end
        end
    },
    {
        name = "Name lua",
        text = "Omicron.lua",
        get_width = function(self, frame_data)
            if self.text ~= nil and self.text:gsub(" ", "") ~= "" then
                return renderer_measure_text(nil, self.text)
            else
                return 0
            end
        end,
        draw = function(self, x, y, w, h, r, g, b, a)
            renderer_text(x, y, r, g, b, a, nil, 0, self.text)
        end
    },
	{
		name = "FPS",
		get_width = function(self, frame_data)
			self.fps = get_fps()
			self.text = tostring(self.fps or 0) .. "fps"

			local fps_max, fps_max_menu = cvar_fps_max:get_float(), cvar_fps_max_menu:get_float()
			local fps_max = globals.mapname() == nil and math.min(fps_max == 0 and 999 or fps_max, fps_max_menu == 0 and 999 or fps_max) or fps_max == 0 and 999 or fps_max

			self.width = math.max(renderer_measure_text(nil, self.text), renderer_measure_text(nil, fps_max .. "fps"))
			return self.width
		end,
		draw = function(self, x, y, w, h, r, g, b, a)
			--fps
			local fps_r, fps_g, fps_b = r, g, b
			if self.fps < (1 / globals_tickinterval()) then
				-- fps_r, fps_g, fps_b = 255, 0, 0
			end

			renderer_text(x+self.width, y, fps_r, fps_g, fps_b, a, "r", 0, self.text)
		end
	},
	{
		name = "Server framerate",
		get_width = function(self, frame_data)
			if not allow_unsafe_scripts then return end

			frame_data.local_player = frame_data.local_player or entity.get_local_player()
			if frame_data.local_player == nil then return end

			frame_data.net_channel_info = frame_data.net_channel_info or native_GetNetChannelInfo()
			if frame_data.net_channel_info == nil then return end

			local frame_time, frame_time_std_dev, frame_time_start_time_std_dev = GetRemoteFramerate(frame_data.net_channel_info)
			if frame_time ~= nil then
				self.framerate = frame_time * 1000
				self.var = frame_time_std_dev * 1000

				self.text1 = "sv:"
				self.text2 = string.format("%.1f", self.framerate)
				self.text3 = " +-"
				self.text4 = string.format("%.1f", self.var)

				self.width1 = renderer_measure_text(nil, self.text1)
				self.width2 = math.max(renderer_measure_text(nil, self.text2), renderer_measure_text(nil, "99.9"))
				self.width3 = renderer_measure_text(nil, self.text3)
				self.width4 = math.max(renderer_measure_text(nil, self.text4), renderer_measure_text(nil, "9.9"))

				return self.width1 + self.width2 + self.width3 + self.width4
			end
		end,
		draw = function(self, x, y, w, h, r, g, b, a)
			local fr_r, fr_g, fr_b = lerp_color_yellow_red(self.framerate, 8, 14, 20, {r, g, b})
			local vr_r, vr_g, vr_b = lerp_color_yellow_red(self.var, 5, 10, 18, {r, g, b})

			renderer_text(x, y, r, g, b, a, nil, 0, self.text1)
			renderer_text(x+self.width1+self.width2, y, fr_r, fr_g, fr_b, a, "r", 0, self.text2)
			renderer_text(x+self.width1+self.width2, y, r, g, b, a, nil, 0, self.text3)
			renderer_text(x+self.width1+self.width2+self.width3, y, vr_r, vr_g, vr_b, a, nil, 0, self.text4)
		end
	},
	{
		name = "Network lag",
		get_width = function(self, frame_data)
			if not allow_unsafe_scripts then return end

			frame_data.local_player = frame_data.local_player or entity.get_local_player()
			if frame_data.local_player == nil then return end

			frame_data.net_channel_info = frame_data.net_channel_info or native_GetNetChannelInfo()
			if frame_data.net_channel_info == nil then return end

			local reasons = {}

			-- timeout
			local time_since_last_received = native_GetTimeSinceLastReceived(frame_data.net_channel_info)
			if time_since_last_received ~= nil and time_since_last_received > 0.1 then
				table_insert(reasons, string_format("%.1fs timeout", time_since_last_received))
			end

			-- loss
			local avg_loss = native_GetAvgLoss(frame_data.net_channel_info, FLOW_INCOMING)
			if avg_loss ~= nil and avg_loss > 0 then
				table_insert(reasons, string_format("%d%% loss", math.ceil(avg_loss*100)))
			end

			-- choke
			local avg_choke = native_GetAvgChoke(frame_data.net_channel_info, FLOW_INCOMING)
			if avg_choke > 0 then
				table_insert(reasons, string_format("%d%% choke", math.ceil(avg_choke*100)))
			end

			if #reasons > 0 then
				self.text = table.concat(reasons, ", ")
				return renderer_measure_text(nil, self.text)
			end
		end,
		draw = function(self, x, y, w, h, r, g, b, a)
			renderer_text(x, y, 255, 32, 32, a, nil, 0, self.text)
		end
	},
	{
		name = "Server IP",
		get_width = function(self, frame_data)
			if not allow_unsafe_scripts then return end

			frame_data.net_channel_info = frame_data.net_channel_info or native_GetNetChannelInfo()
			if frame_data.net_channel_info == nil then return end

			frame_data.is_loopback = frame_data.is_loopback == nil and native_IsLoopback(frame_data.net_channel_info) or frame_data.is_loopback
			if frame_data.is_loopback then return end

			frame_data.is_valve_ds = frame_data.is_valve_ds == nil and entity.get_prop(entity.get_game_rules(), "m_bIsValveDS") == 1 or frame_data.is_valve_ds
			if frame_data.is_valve_ds then return end

			frame_data.server_address = frame_data.server_address or GetAddress(frame_data.net_channel_info)
			if frame_data.server_address ~= nil and frame_data.server_address ~= "" then
				self.text = frame_data.server_address
				return renderer_measure_text(nil, self.text)
			end
		end,
		draw = function(self, x, y, w, h, r, g, b, a)
			renderer_text(x, y, 255, 255, 255, a, nil, 0, self.text)
		end
	},
	{
		name = "Tickrate",
		get_width = function(self, frame_data)
			if globals.mapname() == nil then return end

			local tickinterval = globals_tickinterval()
			if tickinterval ~= nil then
				local text = 1/globals_tickinterval() .. " tick"
				self.text = text
				return renderer_measure_text(nil, text)
			end
		end,
		draw = function(self, x, y, w, h, r, g, b, a)
			renderer_text(x, y, 255, 255, 255, a, nil, 0, self.text)
		end
	},
	{
		name = "Time",
		get_width = function(self, frame_data)
			self.time_width = renderer_measure_text(nil, "00")
			self.sep_width = renderer_measure_text(nil, ":")
			return self.time_width + self.sep_width + self.time_width + (self.seconds and (self.sep_width + self.time_width) or 0)
		end,
		draw = function(self, x, y, w, h, r, g, b, a)
			-- local time_center = x + 16

			local hours, minutes, seconds, milliseconds = client_system_time()
			hours, minutes = string_format("%02d", hours), string_format("%02d", minutes)
			-- renderer_text(time_center, y, 255, 255, 255, a, "r", 0, hours)
			-- renderer_text(time_center, y, 255, 255, 255, a, "", 0, ":")
			-- renderer_text(time_center+4, y, 255, 255, 255, a, "", 0, minutes)

			-- time_center = time_center + 18

			-- if self.seconds then
			-- 	seconds = string_format("%02d", seconds)
			-- 	renderer_text(time_center, y, 255, 255, 255, a, "", 0, ":")
			-- 	renderer_text(time_center+4, y, 255, 255, 255, a, "", 0, seconds)
			-- end

			renderer_text(x, y, 255, 255, 255, a, "", 0, hours)
			renderer_text(x+self.time_width, y, 255, 255, 255, a, "", 0, ":")
			renderer_text(x+self.time_width+self.sep_width, y, 255, 255, 255, a, "", 0, minutes)

			if self.seconds then
				seconds = string_format("%02d", seconds)
				renderer_text(x+self.time_width*2+self.sep_width, y, 255, 255, 255, a, "", 0, ":")
				renderer_text(x+self.time_width*2+self.sep_width*2, y, 255, 255, 255, a, "", 0, seconds)
			end

		end,
		seconds = false
	},
}


local items_drawn = {}
window.pre_paint_callback = function()
	table_clear(items_drawn)
	local value = ui_get(watermark_reference)

	if table_contains(value, "Name lua") then
		value = table_remove_element(value, "Name lua")
		if table_contains(value, "Logo") then
			table_insert(value, 2, "Name lua")
		else
			table_insert(value, 1, "Name lua")
		end
	end

	local screen_width, screen_height = client_screen_size()
	local x = offset_x >= 0 and offset_x or screen_width + offset_x
	local y = offset_y >= 0 and offset_y or screen_height + offset_y

	for i=1, #watermark_items do
		local item = watermark_items[i]
		if item.name == "Time" then
			item.seconds = table_contains(value, "Time + seconds")

			if item.seconds then
				table_insert(value, "Time")
			end
		end
	end

	--calculate width and draw container
	local item_margin = 9
	local width = 0

	local frame_data = {}

	for i=1, #watermark_items do
		local item = watermark_items[i]
		if table_contains(value, item.name) then
			local item_width = item:get_width(frame_data)
			if item_width ~= nil and item_width > 0 then
				table.insert(items_drawn, {
					item = item,
					item_width = item_width,
					x = width
				})
				width = width + item_width + item_margin
			end
		end
	end

	local _, height = renderer_measure_text(nil, "A")

	window.gradient_bar = ui_get(rainbow_line_reference)

	window:set_inner_width(width-item_margin)
	window:set_inner_height(height)

	window.visible = #items_drawn > 0
end

window.paint_callback = function()
	local r, g, b = 255, 255, 255
	local a_text = 230
	for i=1, #items_drawn do
		local item = items_drawn[i]

		-- bounding box
		-- renderer_rectangle(x_text+item.x, y_text, item.item_width, 14, 255, 0, 0, 100)

		-- draw item
		item.item:draw(window.i_x+item.x, window.i_y, item.item_width, 30, r, g, b, a_text)

		-- draw seperator
		if #items_drawn > i then
			renderer.rectangle(window.i_x+item.x+item.item_width+4, window.i_y+1, 1, window.i_h-1, 210, 210, 210, 255)
		end
	end
end

client.set_event_callback("shutdown", function()
	database.write("watermark", db)
end)

ui.set_callback(_ui.misc.console_filter.ref, function()
    cvar.con_filter_text:set_string("cool text")
    cvar.con_filter_enable:set_int(1)
end)

client.set_event_callback("paint", function()

    local menuopen = ui.is_menu_open()
    local px, py = ui.menu_position()
    local sx, sy = ui.menu_size()

    local tick_count = globals.tickcount()
    
    local pulse_factor = math.abs(math.sin(tick_count * 0.01)) * 0.5 + 0.5 
    local r = math.floor((127 + 127 * math.sin(tick_count * 0.01)) * pulse_factor)  
    local g = math.floor((127 + 127 * math.sin(tick_count * 0.01 + 2)) * pulse_factor) 
    local b = math.floor((127 + 127 * math.sin(tick_count * 0.01 + 4)) * pulse_factor) 

    if not menuopen then
        return
    end

    for i = 0, 0 do 
        local edge_r = math.floor((127 + 127 * math.sin(tick_count * 0.01 + i * 0.5)) * pulse_factor)
        local edge_g = math.floor((127 + 127 * math.sin(tick_count * 0.01 + 2 + i * 0.5)) * pulse_factor)
        local edge_b = math.floor((127 + 127 * math.sin(tick_count * 0.01 + 4 + i * 0.5)) * pulse_factor)
        
        renderer.rectangle(px - 10 - i, py - 30, sx + 20 + i, 1, edge_r, edge_g, edge_b, 255) 
        renderer.rectangle(px - 10 - i, py + sy + 7, sx + 20 + i, 1, edge_r, edge_g, edge_b, 255) 
        renderer.rectangle(px - 10 - i, py - 30, 1, sy + 37, edge_r, edge_g, edge_b, 255) 
        renderer.rectangle(px + sx + 10, py - 30, 1, sy + 37, edge_r, edge_g, edge_b, 255)  
    end

    renderer.rectangle(px - 10, py - 30, sx + 20, sy + 37, 70, 70, 70, 100)
    renderer.rectangle(px, py - 20, sx, sy, 15, 15, 15, 120)

    local local_player_index = entity.get_local_player()
    local local_player_name = entity.get_player_name(local_player_index)

    local top_text = "O M I C R O N "
    local top_text_x = px + sx / 2 - renderer.measure_text(nil, top_text) / 2
    local top_text_y = py - 18

    renderer.text(top_text_x, top_text_y, r, g, b, 255, "b", 0, top_text)
end)


local function choking(cmd)
    local Choke = false

    if cmd.allow_send_packet == false or globals.chokedcommands() > 1 then
        Choke = true
    else
        Choke = false
    end

    return Choke
end
local tbl = {}
tbl.defensive = 0
tbl.checker = 0
client.set_event_callback("paint_ui", function()

    if not ui.get(ref.doubletap[2]) then
        tbl.defensive = 1
    end
	local local_player = entity.get_local_player()
	if not entity.is_alive(entity.get_local_player()) then return end
    local tickbase = entity.get_prop(entity.get_local_player(), "m_nTickBase")
    tbl.checker = math.max(tickbase, tbl.checker or 0)
    tbl.defensive = math.abs(tickbase - tbl.checker)
end)
local discharge = function(cmd)

    if not _ui.misc.discharge.value or not _ui.lua.enable.value or ui.get(ref.quick_peek[2]) or not ui.get(ref.doubletap[2]) then return end

    local player_weapon = entity.get_player_weapon(entity.get_local_player())
    
    if not player_weapon or entity.get_classname(player_weapon) == "" then return end

    local vel_2 = math.floor(entity.get_prop(entity.get_local_player(), "m_vecVelocity[2]"))

    if is_vulnerable() then
        if _ui.misc.d_mode.value == "Ideal" then 
            if vel_2 > 20 then return end 
        end
        cmd.in_jump = false
        cmd.discharge_pending = true
    end
end

client.set_event_callback("paint_ui", function()
welcomerfunc()
    if ui.is_menu_open() then
        hide_refs(_ui.lua.enable.value)
        ui.set_visible(aa_builder[1].override.ref, false) ui.set(aa_builder[1].override.ref, true)
		client.set_event_callback("paint_ui", function()
end)
    end
end)

client.set_event_callback("setup_command", function(cmd)
    antiaim_features(cmd)
    discharge(cmd)
end )

local anti_aim, vector = require("gamesense/antiaim_funcs"), require("vector")

local keybinds = ui.new_checkbox("Visuals", "Effects", "Enable Keybinds List")
local information = ui.new_checkbox("Visuals", "Effects", "Enable Information List")
local label = ui.new_label("Visuals", "Effects", "Indicator Accent")
local color = ui.new_color_picker("Visuals", "Effects", "Accent Color", 70, 130, 180)
local animation = ui.new_slider("Visuals", "Effects", "Animation Speed", 1, 20, 6)

local references = {
    doubletap = { ui.reference("rage", "aimbot", "double tap") },
    hideshots = { ui.reference("aa", "other", "on shot anti-aim") },

    damage_override = { ui.reference("rage", "aimbot", "minimum damage override") },
    safe_point = { ui.reference("rage", "aimbot", "force safe point") },
    body_aim = { ui.reference("rage", "aimbot", "force body aim") },

    auto_peek = { ui.reference("rage", "other", "quick peek assist") },
    duck_peek = { ui.reference("rage", "other", "duck peek assist") },

    freestand = { ui.reference("aa", "anti-aimbot angles", "freestanding") },
    slow_walk = { ui.reference("aa", "other", "slow motion") }
}

local storage = {
    timer,
    fortcalc,
    timer_max,
    c4_time_frozen,

    information = {
        defensive_shift = 0,
        prev_sim_time = 0,
        defensive_dur = 0
    }
}

local k_a = { }
for i = 1, #references do
    k_a[i] = 0
end

local t_a = { }
for i = 1, #references do
    t_a[i] = 0
end

local window = {
    keybinds = {
        x = database.read("keybinds_x") or 10,
        y = database.read("keybinds_y") or 600,

        w = 170,
        h = 50
    },

    round = {
        x = database.read("round_x") or 10,
        y = database.read("round_y") or 900,

        w = 170,
        h = 50
    },

    dragging = false
}

local visuals = { }
function visuals.outline(x, y, w, h, r, g, b, a, radius, thickness)
    y = y + radius
    local data_circle = {
        {x + radius, y, 180},
        {x + w - radius, y, 270},
        {x + radius, y + h - radius * 2, 90},
        {x + w - radius, y + h - radius * 2, 0},
    }

    local data = {
        {x + radius, y - radius, w - radius * 2, thickness},
        {x + radius, y + h - radius - thickness, w - radius * 2, thickness},
        {x, y, thickness, h - radius * 2},
        {x + w - thickness, y, thickness, h - radius * 2},
    }

    for _, data in next, data_circle do
        renderer.circle_outline(data[1], data[2], r, g, b, a, radius, data[3], 0.25, thickness)
    end


    for _, data in next, data do
        renderer.rectangle(data[1], data[2], data[3], data[4], r, g, b, a)
    end
end

function visuals.rounded_rectangle(x, y, w, h, r, g, b, a, radius)
    y = y + radius
    local data_circle = {
        {x + radius, y, 180},
        {x + w - radius, y, 90},
        {x + radius, y + h - radius * 2, 270},
        {x + w - radius, y + h - radius * 2, 0},
    }

    local data = {
        {x + radius, y, w - radius * 2, h - radius * 2},
        {x + radius, y - radius, w - radius * 2, radius},
        {x + radius, y + h - radius * 2, w - radius * 2, radius},
        {x, y, radius, h - radius * 2},
        {x + w - radius, y, radius, h - radius * 2},
    }

    for _, data in next, data_circle do
        renderer.circle(data[1], data[2], r, g, b, a, radius, data[3], 0.25)
    end

    for _, data in next, data do
        renderer.rectangle(data[1], data[2], data[3], data[4], r, g, b, a)
    end
end

function visuals.outlined_string(x, y, r, g, b, a, flags, max_width, ...)
    local offset = {
        { -1, 1, -1, 1},
        { 1, 1, -1, -1}
    }

    for i = 1, 4 do
        renderer.text(x + offset[1][i], y + offset[2][i], 0, 0, 0, 255, flags, max_width, ...)
    end

    renderer.text(x, y, r, g, b, 255, flags, max_width, ...)
end

function visuals.lerp(start, end_pos, time)
    return start + (end_pos - start) * time
end

function visuals.clamp(value, minimum, maximum)
	if minimum > maximum then
		return math.min(math.max(value, maximum), minimum)
	else
		return math.min(math.max(value, minimum), maximum)
	end
end

function visuals.insert_information_board(x, y, w, h, r, g, b, a, a2, t_1, t_2, l)
    local secondary = { ui.get(color) }

    renderer.gradient(x + 1, y, 149, 17, r, g, b, 10 * a2, r, g, b, 0, true)
    renderer.rectangle(x + 1, y, 1, 17, r, g, b, 255 * a2)

    renderer.text(x + 5, y + 2, 175, 175, 175, 255 * a2, "", nil, t_1)
    renderer.text(x + 140 + l, y + 2, secondary[1], secondary[2], secondary[3], 255 * a2, "r", nil, t_2)
end

function visuals.intersect(x, y, w, h) 
	local cx, cy = ui.mouse_position()
	return cx >= x and cx <= x + w and cy >= y and cy <= y + h
end

function visuals.keybinds()
    if not ui.get(keybinds) then
        return
    end

    -- @docs establish required variables
    local x, y = window.keybinds.x, window.keybinds.y

    local r, g, b, a = ui.get(color)

    local items = { }
    local h = 0

    -- @docs create references and data into tables
    if ui.get(references.doubletap[1]) and ui.get(references.doubletap[2]) then
        h = h + 1
        items[1] = { true, "doubletap", anti_aim.get_double_tap() and "charged" or "recharge", 1 }
    else
        items[1] = { false, "doubletap", "on", 1 }
    end

    if ui.get(references.hideshots[1]) and ui.get(references.hideshots[2]) then
        h = h + 1
        items[2] = { true, "hideshots", items[1][1] and "conflict" or "on", 2 }
    else
        items[2] = { false, "hideshots", "on", 2 }
    end

    if ui.get(references.damage_override[1]) and ui.get(references.damage_override[2]) then
        h = h + 1
        items[3] = { true, "damage override", ui.get(references.damage_override[3]), 3 }
    else
        items[3] = { false, "damage override", ui.get(references.damage_override[3]), 3 }
    end

    if ui.get(references.safe_point[1]) then
        h = h + 1
        items[4] = { true, "force safe point", "on", 4 }
    else
        items[4] = { false, "force safe point", "on", 4 }
    end

    if ui.get(references.body_aim[1]) then
        h = h + 1
        items[5] = { true, "force body aim", "on", 5 }
    else
        items[5] = { false, "force body aim", "on", 5 }
    end

    if ui.get(references.auto_peek[1]) and ui.get(references.auto_peek[2]) then
        h = h + 1
        items[6] = { true, "auto peek", "on", 6 }
    else
        items[6] = { false, "auto peek", "on", 6 }
    end

    if ui.get(references.duck_peek[1]) then
        h = h + 1
        items[7] = { true, "fake duck", "on", 7 }
    else
        items[7] = { false, "fake duck", "on", 7 }
    end

    if ui.get(references.freestand[1]) and ui.get(references.freestand[2]) then
        h = h + 1
        items[8] = { true, "freestand", "on", 8 }
    else
        items[8] = { false, "freestand", "on", 8 }
    end

    if ui.get(references.slow_walk[1]) and ui.get(references.slow_walk[2]) then
        h = h + 1
        items[9] = { true, "slow walk", "on", 9 }
    else
        items[9] = { false, "slow walk", "on", 9 }
    end

    -- @docs handle animation based height
    if m_h == nil then
        m_h = h
    end

    m_h = visuals.lerp(m_h, h, globals.frametime() * ui.get(animation))
    h = visuals.clamp(m_h, 0, m_h - 0.0000000000001)

    -- @docs inner rectangle
    visuals.rounded_rectangle(x + 10, y + 30, 150, 12 + h * 18, 13, 13, 13, 255, 5)

    -- @docs render active binds
    for i = 1, #items do
        local limit = h - 1 * 17.9
        local idx = items[i][4]
        local count = 0

        if h * 18.1 <= limit then
            k_a[idx] = 0
            goto skip
        end

        if k_a[idx] == nil or not items[i][1] then
            k_a[idx] = 0
        elseif k_a[idx] <= 0.95 then
            k_a[idx] = k_a[idx] + 0.01
        else
            k_a[idx] = 1
        end

        for c = 1, i do
            if items[c][1] then
                count = count + 1
            end
        end

        visuals.insert_information_board(x + 13, y + 36 + 18 * (count - 1), 150, 17, r, g, b, 10, k_a[i], items[i][2], items[i][3], 0)
    end

    ::skip::

    -- @docs outer rectangle
    visuals.outline(x, y, 170, 26, 19, 19, 19, 255, 5, 12 + 5)
    visuals.outline(x, y + 20, 170, 32 + h * 18, 19, 19, 19, 255, 5, 12)
    visuals.outline(x + 1, y + 01, 168, 50 + h * 18, 53, 53, 53, 255, 5, 1)
    visuals.outlined_string(x + 10, y + 11, 255, 255, 255, 255, "", nil, "keybinds")

    -- @docs inner outline
    visuals.outline(x + 10, y + 30, 150, 12 + h * 18, 53, 53, 53, 255, 5, 1)
    visuals.outline(x + 11, y + 31, 148, 10 + h * 18, 0, 0, 0, 255, 5, 1)

    -- @docs dragging
    if ui.is_menu_open() then
        local mouse_x, mouse_y = ui.mouse_position()

        if window.keybinds.dragging and not client.key_state(0x01) then
            alpha = 0
            window.keybinds.dragging = false
        end

        if window.keybinds.dragging and client.key_state(0x01) then
            window.keybinds.x = mouse_x - drag_x
            window.keybinds.y = mouse_y - drag_y
        end

        if visuals.intersect(window.keybinds.x, window.keybinds.y, 150, 50 + h * 18) and client.key_state(0x01) then
            window.keybinds.dragging = true
            drag_x = mouse_x - window.keybinds.x
            drag_y = mouse_y - window.keybinds.y

            renderer.rectangle(window.keybinds.x - 2, window.keybinds.y - 2, 174, 50 + h * 18 + 6, 255, 0, 0, 55)
        end
    end
end

bomb_damage = function(ent)
    local local_origin = vector(entity.get_origin(entity.get_local_player()))
    local bomb_origin = vector(entity.get_origin(ent))
    local dist = local_origin:dist(bomb_origin)
    local armor = entity.get_prop(entity.get_local_player(), "m_ArmorValue")
    local damage = 450.7 * math.exp(-((dist - 75.68) / 789.2) ^ 2)

    if armor > 0 then
        local new_damage = damage * 0.5
        local placeholder = (damage - new_damage) * 0.5
        if placeholder > armor then
            placeholder = armor * (1 / 0.5)
            new_damage = damage - armor
        end
        damage = new_damage
    end

    return damage
end

bomb_time = function(ent)
    return math.max(entity.get_prop(ent, "m_flC4Blow") - globals.curtime(), 0)
end

defuseable = function(ent)
    local bomb_time_left = bomb_time(ent)
    local has_defuser = entity.get_prop(ent, "m_hBombDefuser")

    if has_defuser then
        return storage.c4_time_froze < entity.get_prop(ent, "m_flDefureCountDown") - globals.curtime()
    else
        return bomb_time_left > 6
    end
end

function invulnerable()
    local player = entity.get_local_player()
    local sim_time = math.floor(0.5 + (entity.get_prop(player, "m_flSimulationTime") / globals.tickinterval()))
    local prev_sim_time = storage.information.prev_sim_time

    if prev_sim_time == 0 then
        storage.information.prev_sim_time = sim_time
        return
    end

    local sim_delta = sim_time - prev_sim_time
    
    if sim_delta < 0 then
        local shift = math.abs(sim_delta)
        storage.information.defensive_dur = globals.tickcount() + shift
        storage.information.defensive_shift = shift
    end

    storage.information.prev_sim_time = sim_time
end

function visuals.round_info()
    if not ui.get(information) then
        return
    end

    -- @docs initialising required variables
    local x, y = window.round.x, window.round.y

    local r, g, b, a = ui.get(color)

    local test = visuals.clamp(renderer.measure_text("", entity.get_player_name(client.current_threat())) - 40, 0, renderer.measure_text("", entity.get_player_name(client.current_threat())))

    local info = { }
    local j = 0
    local l = (client.current_threat() == nil or not entity.is_alive(entity.get_local_player())) and 0 or test

    local bomb = entity.get_all("CPlantedC4")[1]
    
    if bomb == nil then
        goto next
    end

    defuse_timer = entity.get_prop(bomb, "m_flDefuseCountDown") - globals.curtime()

    storage.timer, storage.fortcalc, storage.timer_max = math.ceil(bomb_time(bomb) * 10 ^ 1 - 0.5) / 10 ^ 1 - 0.5, bomb_time(bomb), client.get_cvar("mp_c4timer")

    if entity.get_prop(bomb, "m_hBombDefuser") then
        storage.timer = math.ceil(defuse_timer * 10 ^ 1 - 0.5)/10 ^ 1 - 0.5
        storage.fortcalc = defuse_timer
        storage.timer_max = 10
    end

    storage.timer = storage.timer > 0 and storage.timer or 0
    
    timer_calc = (math.max(0, math.min(storage.timer_max, storage.fortcalc))) / storage.timer_max

    damage = math.floor(bomb_damage(bomb))
    site = entity.get_prop(bomb, "m_nBombSite")
    site = site == 1 and "b" or "a"

    ::next::

    invulnerable()
    local modifier = entity.get_prop(entity.get_local_player(), "m_flVelocityModifier")
    local overlap = anti_aim.get_overlap(true)

    -- @docs create references and data into tables
    if bomb == nil or entity.get_prop(bomb, "m_bBombDefused") == 1 or storage.timer == 0 then
        info[1] = { false, "x", "recharge", 1 }
    else
        j = j + 1

        info[1] = { true, "bomb planted " .. site, storage.timer .. "s", 1 }
    end

    if bomb == nil or damage == nil or damage < 1 or storage.timer == 0 or not entity.is_alive(entity.get_local_player()) or entity.get_prop(bomb, "m_bBombDefused") == 1 then
        info[2] = { false, "x", "recharge", 2 }
    else
        j = j + 1

        info[2] = { true, "bomb lethality", damage >= entity.get_prop(entity.get_local_player(), "m_iHealth") and "fatal" or damage, 2 }
    end

    if client.current_threat() == nil or not entity.is_alive(entity.get_local_player()) then
        info[3] = { false, "x", "recharge", 3 }
    else
        j = j + 1

        info[3] = { true, "anti-aim target", entity.get_player_name(client.current_threat()), 3 }
    end

    if storage.information.defensive_dur + 20 < globals.tickcount() or not entity.is_alive(entity.get_local_player()) then
        info[4] = { false, "x", "recharge", 4 }
    else
        j = j + 1

        info[4] = { true, "defensive", storage.information.defensive_dur < globals.tickcount() and "switched" or "active", 4 }
    end

    if modifier == 1 or not entity.is_alive(entity.get_local_player()) then
        info[5] = { false, "x", "recharge", 5 }
    else
        j = j + 1

        info[5] = { true, "Velocity", math.floor((255 * modifier) / 255 * 100) .. "%", 5 }
    end

    if not entity.is_alive(entity.get_local_player()) then
        info[6] = { false, "x", "recharge", 6 }
    else
        j = j + 1

        info[6] = { true, "anti-aim overlap", math.floor(overlap * 100) .. "%", 6 }
    end

    -- @docs handle animation based height
    if m_j == nil then
        m_j = j
    end
    
    m_j = visuals.lerp(m_j, j, globals.frametime() * ui.get(animation))
    j = visuals.clamp(m_j, 0, m_j - 0.0000000000001)

    if l_j == nil then
        l_j = l
    end

    l_j = visuals.lerp(l_j, l, globals.frametime() * ui.get(animation))
    l = visuals.clamp(l_j, 0, l_j - 0.0000000000001)


    -- @docs inner rectangle
    visuals.rounded_rectangle(x + 10, y + 30, 150 + l, 12 + j * 18, 13, 13, 13, 255, 5)

    -- @docs render active binds
    for i = 1, #info do
        local limit = j - 1 * 17.9
        local idx = info[i][4]
        local count = 0

        if j * 18.1 <= limit then
            t_a[idx] = 0
            goto skip
        end

        if t_a[idx] == nil or not info[i][1] then
            t_a[idx] = 0
        elseif t_a[idx] <= 0.95 then
            t_a[idx] = t_a[idx] + 0.01
        else
            t_a[idx] = 1
        end

        for c = 1, i do
            if info[c][1] then
                count = count + 1
            end
        end

        visuals.insert_information_board(x + 13, y + 36 + 18 * (count - 1), 150 + l, 17, r, g, b, 10, t_a[i], info[i][2], info[i][3], l)
    end

    ::skip::

    -- @docs outer rectangle
    visuals.outline(x, y, 170 + l, 26, 19, 19, 19, 255, 5, 12 + 5)
    visuals.outline(x, y + 20, 170 + l, 32 + j * 18, 19, 19, 19, 255, 5, 12)
    visuals.outline(x + 1, y + 01, 168 + l, 50 + j * 18, 53, 53, 53, 255, 5, 1)
    visuals.outlined_string(x + 10, y + 11, 255, 255, 255, 255, "", nil, "additional information")

    -- @docs inner outline
    visuals.outline(x + 10, y + 30, 150 + l, 12 + j * 18, 53, 53, 53, 255, 5, 1)
    visuals.outline(x + 11, y + 31, 148 + l, 10 + j * 18, 0, 0, 0, 255, 5, 1)

    if ui.is_menu_open() then
        local mouse_x, mouse_y = ui.mouse_position()

        if window.round.dragging and not client.key_state(0x01) then
            alpha = 0
            window.round.dragging = false
        end

        if window.round.dragging and client.key_state(0x01) then
            window.round.x = mouse_x - drag_x
            window.round.y = mouse_y - drag_y
        end

        if visuals.intersect(window.round.x, window.round.y, 150, 50 + j * 18) and client.key_state(0x01) then
            window.round.dragging = true
            drag_x = mouse_x - window.round.x
            drag_y = mouse_y - window.round.y

            renderer.rectangle(window.round.x - 2, window.round.y - 2, 174, 50 + j * 18 + 6, 255, 0, 0, 55)
        end
    end
end

local function shutdown()
    database.write("keybinds_x", window.keybinds.x)
    database.write("keybinds_y", window.keybinds.y)
    database.write("round_x", window.round.x)
    database.write("round_y", window.round.y)
end

local function paint()
    visuals.keybinds()
    visuals.round_info()
end

client.set_event_callback("bomb_begindefuse", function()
    storage.c4_time_frozen = math.ceil(bomb_time(entity.get_all("CPlantedC4")[1]) * 10 ^ 1 - 0.5)/10 ^ 1 - 0.5
end)

client.set_event_callback("paint", paint)
client.set_event_callback("shutdown", shutdown)

local ui_get = ui.get
local ui_set = ui.set
local client_exec = client.exec
local ui_new_checkbox = ui.new_checkbox
local ui_new_slider = ui.new_slider
local ui_set_callback = ui.set_callback

local tpdistanceslider = ui_new_slider("VISUALS", "EFFECTS", "Thirdperson Distance", 30, 200, 150)

local function tpdistance()
	client_exec("cam_idealdist ", ui_get(tpdistanceslider))
end
ui_set_callback(tpdistanceslider, tpdistance)

local ref = {
    aimbot = ui.reference('RAGE', 'Aimbot', 'Enabled'),
    doubletap = {
        main = { ui.reference('RAGE', 'Aimbot', 'Double tap') },
        fakelag_limit = ui.reference('RAGE', 'Aimbot', 'Double tap fake lag limit')
    }
}

local local_player, callback_reg, dt_charged = nil, false, false

local function check_charge()
    local m_nTickBase = entity.get_prop(local_player, 'm_nTickBase')
    local client_latency = client.latency()
    local shift = math.floor(m_nTickBase - globals.tickcount() - 3 - toticks(client_latency) * .5 + .5 * (client_latency * 10))

    local wanted = -14 + (ui.get(ref.doubletap.fakelag_limit) - 1) + 3 --error margin

    dt_charged = shift <= wanted
end

client.set_event_callback('setup_command', function()
    if not ui.get(ref.doubletap.main[2]) or not ui.get(ref.doubletap.main[1]) then
        ui.set(ref.aimbot, true)

        if callback_reg then
            client.unset_event_callback('run_command', check_charge)
            callback_reg = false
        end
        return
    end

    local_player = entity.get_local_player()

    if not callback_reg then
        client.set_event_callback('run_command', check_charge)
        callback_reg = true
    end

    local threat = client.current_threat()

    if not dt_charged
    and threat
    and bit.band(entity.get_prop(local_player, 'm_fFlags'), 1) == 0
    and bit.band(entity.get_esp_data(threat).flags, bit.lshift(1, 11)) == 2048 then
        ui.set(ref.aimbot, false)
    else
        ui.set(ref.aimbot, true)
    end
end)

client.set_event_callback('shutdown', function()
    ui.set(ref.aimbot, true)
end)

local enable = ui.new_checkbox("VISUALS", "Effects", "Show hit/miss ratio indicator")

local stats = {
    total_shots = 0,
    hits = 0
}

client.set_event_callback("paint", function()
    local lp = entity.get_local_player()
    
    if not ui.get(enable) then return end
    if not lp then return end

    renderer.indicator(200, 200, 200, 255, string.format("%s / %s (%s)", stats.hits, stats.total_shots, string.format("%.1f", stats.total_shots ~= 0 and (stats.hits / stats.total_shots * 100) or 0)))
end)

client.set_event_callback("aim_hit", function()
    stats.total_shots = stats.total_shots + 1
    stats.hits = stats.hits + 1
end)

client.set_event_callback("aim_miss", function(e)
    if e.reason ~= "death" and e.reason ~= "unregistered shot" then
        stats.total_shots = stats.total_shots + 1
    end
end)

client.set_event_callback("player_connect_full", function(e)
    if client.userid_to_entindex(e.userid) == entity.get_local_player() then
        stats = {
            total_shots = 0,
            hits = 0
        }
    end
end)

local enable = ui.new_checkbox("VISUALS", "Effects", "Omicron tag screen")

local pulse_speed = 2 
local pulse_amplitude = 128 
local base_alpha = 220

client.set_event_callback("paint", function()
    local lp = entity.get_local_player()
    if not ui.get(enable) then return end
    if not lp then return end
    local time = globals.realtime()
    local alpha = base_alpha + pulse_amplitude * math.sin(time * pulse_speed)
    alpha = math.max(0, math.min(255, alpha))
    renderer.indicator(255, 32, 32, alpha, "OMICRON")
end)

-- xboxlivegold
local bit_bor, client_eye_position, client_find_signature, client_set_event_callback, client_userid_to_entindex, entity_get_local_player, entity_get_player_weapon, entity_get_prop, entity_hitbox_position, entity_is_enemy, globals_tickcount, math_sqrt, ui_get, ui_new_checkbox, ui_new_color_picker, ui_new_combobox, ui_new_label, ui_new_slider, ui_set, error, pairs = bit.bor, client.eye_position, client.find_signature, client.set_event_callback, client.userid_to_entindex, entity.get_local_player, entity.get_player_weapon, entity.get_prop, entity.hitbox_position, entity.is_enemy, globals.tickcount, math.sqrt, ui.get, ui.new_checkbox, ui.new_color_picker, ui.new_combobox, ui.new_label, ui.new_slider, ui.set, error, pairs
local render_loadpng, render_drawtexture, render_text, renderer_world_to_screen, globals_realtime = renderer.load_png, renderer.texture, renderer.text, renderer.world_to_screen, globals.realtime

local enabled_ref = ui.new_checkbox("VISUALS", "Effects", "hitmarker")

local blue_tex = render_loadpng(readfile("runescape_hitsplats/blue.png"), 24, 22)
local red_tex = render_loadpng(readfile("runescape_hitsplats/red.png"), 24, 22)

local da_splatz = {}

local function draw_splat(damage, x, y, alpha, elapsed_time)
    if damage == 0 then
        render_drawtexture(blue_tex, x - 12, y - 11, 24, 22, 255, 255, 255, alpha, "f")
        render_text(x, y - elapsed_time * 30, 255, 255, 255, alpha, "c", 0, "0") -- Поднимаем текст
    else
        render_drawtexture(red_tex, x - 12, y - 11, 24, 22, 255, 255, 255, alpha, "f")
        render_text(x, y - elapsed_time * 30, 255, 255, 255, alpha, "c", 0, damage) -- Поднимаем текст
    end
end

local function draw_splats()
    local enabled = ui_get(enabled_ref)
    if not enabled then
        return
    end

    local realtime = globals_realtime()
    for i = #da_splatz, 1, -1 do
        local splat = da_splatz[i]
        if splat[1] + 3 > realtime then
            local screen_x, screen_y = renderer_world_to_screen(splat[2], splat[3], splat[4])
            if screen_x ~= nil and screen_y ~= nil then
                -- Уменьшаем альфа-значение в зависимости от времени
                local alpha = 255 * (1 - (realtime - splat[1]) / 2) -- 3 секунды для полного исчезновения
                local elapsed_time = realtime - splat[1] -- Время, прошедшее с момента появления сплата
                draw_splat(splat[6], screen_x, screen_y, math.max(0, alpha), elapsed_time) -- Передаем время
            end
        else
            table.remove(da_splatz, i) -- Удаляем сплат, если время вышло
        end
    end
end

client.set_event_callback("paint_ui", function()
    draw_splats()
end)

local hgroup_to_hbox = {
    [1] = {0, 1},
    [2] = {4, 5, 6},
    [3] = {2, 3},
    [4] = {13, 15, 16},
    [5] = {14, 17, 18},
    [6] = {7, 9, 11},
    [7] = {8, 10, 12}
}

client.set_event_callback("aim_hit", function(e)
    local target = e.target
    local realtime = globals_realtime()
    local x, y, z = entity_hitbox_position(target, hgroup_to_hbox[e.hitgroup][1])
    table.insert(da_splatz, {realtime, x, y, z, target, e.damage})
end)

client.set_event_callback("aim_miss", function(e)
    local screen_x, screen_y = renderer_world_to_screen(e.x, e.y, e.z)
    if screen_x ~= nil and screen_y ~= nil then
        render_text(screen_x, screen_y, 255, 0, 0, 255, "c", 0, "miss")
    end
end)

client.set_event_callback("round_start", function(e)
    da_splatz = {}
end)

client.set_event_callback("player_death", function(e)
    local me = entity_get_local_player()
    if client_userid_to_entindex(e.userid) == me then
        da_splatz = {}
    end
end)

-- Menu
local tracer = ui.new_checkbox("VISUALS", "Effects", "Bullet tracers")
local color = ui.new_color_picker("VISUALS", "Effects", "Color", 255, 255, 255, 255)

-- Variables and constants
queue = {}

-- Game event handling
client.set_event_callback("bullet_impact", function(e)
    if not ui.get(tracer) then
        return
    end
    if client.userid_to_entindex(e.userid) ~= entity.get_local_player() then
        return
    end
    local lx, ly, lz = client.eye_position()
    -- Добавляем данные о трассировке в очередь с временем исчезновения через 2 секунды
    queue[globals.tickcount()] = {lx, ly, lz, e.x, e.y, e.z, globals.curtime() + 2}
end)

client.set_event_callback("paint", function()
    if not ui.get(tracer) then
        return
    end
    -- Проходим по очереди и рисуем трассировки
    for tick, data in pairs(queue) do
        if globals.curtime() <= data[7] then
            local x1, y1 = renderer.world_to_screen(data[1], data[2], data[3])
            local x2, y2 = renderer.world_to_screen(data[4], data[5], data[6])
            if x1 ~= nil and x2 ~= nil and y1 ~= nil and y2 ~= nil then
                renderer.line(x1, y1, x2, y2, ui.get(color))
            end
        else

            queue[tick] = nil
        end
    end
end)

client.set_event_callback("round_prestart", function()
    if not ui.get(tracer) then
        return
    end
    -- Очищаем очередь при начале нового раунда
    queue = {}
end)

--local variables for API
local client_set_clan_tag = client.set_clan_tag 

-- Define the clan tag
local clan_tag = "Omicron.lua"

-- Set up the checkbox in the UI
local clantag_checkbox = ui.new_checkbox("VISUALS", "EFFECTS", "Clantag omicron")

-- Animation parameters
local animation_speed = 0.3 -- скорость анимации (в секундах)
local last_update_time = 0
local current_length = 0
local is_removing = false

-- Function to update the clan tag
local function update_clan_tag()
    local current_time = globals.realtime()

    if current_time - last_update_time >= animation_speed then
        last_update_time = current_time
        
        -- Увеличиваем или уменьшаем длину текста
        current_length = is_removing and current_length - 1 or current_length + 1
        
        -- Меняем направление, если достигли конца или начала
        if current_length >= #clan_tag then
            is_removing = true
        elseif current_length <= 0 then
            is_removing = false
        end

        client_set_clan_tag(clan_tag:sub(1, current_length)) -- Обновляем клан тег
    end
end

-- Function to handle checkbox state change
local function on_checkbox_changed()
    if ui.get(clantag_checkbox) then
        current_length = 0
        is_removing = false
    else
        client_set_clan_tag("") -- Удалить клан тег при выключении
    end
end

-- Set up a paint callback to update the clan tag continuously
client.set_event_callback("paint", function()
    if ui.get(clantag_checkbox) then
        update_clan_tag()
    end
end)

ui.set_callback(clantag_checkbox, on_checkbox_changed) 

-- Сбросить клан тег при инициализации
client_set_clan_tag("")


reason_counter = {}
reason_counter.spread = 0
reason_counter.death = 0
reason_counter.prediction_error = 0
reason_counter.unknown = 0

-- Инициализация переменных
chance, bt, predicted_damage, predicted_hitgroup = nil, nil, nil, nil
hitgroup_names = {"Body", "Head", "Chest", "Stomach", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "Neck", "?", "Gear"}

pi, max = math.pi, math.max

-- Определение динамического класса
dynamic = {}
dynamic.__index = dynamic

function dynamic.new(f, z, r, xi)
   f = max(f, 0.001)
   z = max(z, 0)

   pif = pi * f
   twopif = 2 * pif

   a = z / pif
   b = 1 / (twopif * twopif)
   c = r * z / twopif

   return setmetatable({
      a = a,
      b = b,
      c = c,
      px = xi,
      y = xi,
      dy = 0
   }, dynamic)
end

function dynamic:update(dt, x, dx)
   if dx == nil then
      dx = (x - self.px) / dt
      self.px = x
   end

   self.y = self.y + dt * self.dy
   self.dy = self.dy + dt * (x + self.c * dx - self.y - self.a * self.dy) / self.b
   return self
end

function dynamic:get()
   return self.y
end

logs = {}

aimbot_logs_enabled = ui.new_checkbox("VISUALS", "Effects", "Aimbot Logs")

aimbotlogs = ui.new_multiselect("VISUALS", "Effects", "Aimbot logs type", "Console")

-- Функция для управления видимостью мультиселектора
local function update_multiselect_visibility()
    local is_enabled = ui.get(aimbot_logs_enabled)
    ui.set_visible(aimbotlogs, is_enabled) -- Устанавливаем видимость в зависимости от состояния чекбокса
end

-- Устанавливаем обработчик события для чекбокса
ui.set_callback(aimbot_logs_enabled, update_multiselect_visibility)

-- Инициализация видимости мультиселектора при загрузке
update_multiselect_visibility()

-------------------> FIRE FUNCTION <------------------- 
function aim_fire(e)
    chance = math.floor(e.hit_chance)
    bt = globals.tickcount() - e.tick
    predicted_damage = e.damage
    predicted_hitgroup = e.hitgroup
end

-------------------> HIT FUNCTION <------------------- 
function aim_hit(e)
   group = hitgroup_names[e.hitgroup + 1] or "?"
   name = entity.get_player_name(e.target)
   damage = e.damage
   hp_left = entity.get_prop(e.target, "m_iHealth")
   js = panorama.open()
   persona_api = js.MyPersonaAPI
   username = persona_api.GetName()  
   targetname = name
   hitbox = group
   dmg = damage
   hc = chance
   backtrack = bt
   predicted_group = hitgroup_names[predicted_hitgroup + 1] or "?"


       if table_contains(ui.get(aimbotlogs), "Console") then
           print(string.format("[Omicron] Registered shot at %s's in the %s for %s damage (bt: %s) (hc: %s)", name, string.lower(hitbox), damage, backtrack, hc))
       end
end

-------------------> MISS FUNCTION <------------------- 
function aim_miss(e)
    group = hitgroup_names[e.hitgroup + 1] or "?"
    name = entity.get_player_name(e.target)
    hp_left = entity.get_prop(e.target, "m_iHealth")
    js = panorama.open()
    persona_api = js.MyPersonaAPI
    username = persona_api.GetName()  
    targetname = name
    hitbox = group
    hc = chance
    backtrack = bt
    reason = e.reason

    predicted_group = hitgroup_names[predicted_hitgroup + 1] or "?"

    if reason == "?" then 
        reason = "resolver" 
        reason_counter.unknown = reason_counter.unknown + 1
    elseif reason == "spread" then
        reason_counter.spread = reason_counter.spread + 1
    elseif reason == "death" then
        reason_counter.death = reason_counter.death + 1
    elseif reason == "prediction error" then
        reason_counter.prediction_error = reason_counter.prediction_error + 1
    end


        if table_contains(ui.get(aimbotlogs), "Console") then
            print(string.format("[Omicron] Missed to %s's %s due to %s (hc: %s)", string.lower(entity.get_player_name(e.target)), string.lower(predicted_group), reason, hc))
        end
    end

logging = function()
    screen = {client.screen_size()}
    for i = 1, #logs do
        if not logs[i] then return end
        if not logs[i].init then
            logs[i].y = dynamic.new(2, 1, 1, -30)
            logs[i].time = globals.tickcount() + 180
            logs[i].init = true
        end

        string_size = renderer.measure_text("c", logs[i].text)
        hitcolor2 = {ui.get(menu.aimbotlogscolor)}
        miscolor2 = {ui.get(menu.aimbotlogscolor2)}
        renderstring = " " .. logs[i].text .. " "
        if ui.get(aimbot_logs_enabled) then
            if string.sub(logs[i].text, 1, 1) == "H" then
                notification(screen[1] / 2 + 5, screen[2] / 2 + 400 - logs[i].y:get() + 39, hitcolor2[1], hitcolor2[2], hitcolor2[3], 25, 25, 25, hitcolor2[4], "nil", renderstring, 255, 255, 255, 255)
            elseif string.sub(logs[i].text, 1, 1) == "M" then
                notification(screen[1] / 2 + 5, screen[2] / 2 + 400 - logs[i].y:get() + 39, miscolor2[1], miscolor2[2], miscolor2[3], 25, 25, 25, miscolor2[4], "nil", renderstring, 255, 255, 255, 255)
            end
        end

        get_max = (logs[i].time - globals.tickcount()) * string_size / 252
        if #logs > 5 then
            table.remove(logs, 1)
        end
        if tonumber(logs[i].time) < globals.tickcount() then
            if logs[i].y:get() < -10 then
                table.remove(logs, i)
            else
                logs[i].y:update(globals.frametime(), -50, nil)
            end
        else
            logs[i].y:update(globals.frametime(), 5 + (i * 30), nil)
        end
    end
end

client.set_event_callback("aim_fire", aim_fire)
client.set_event_callback("aim_hit", aim_hit)
client.set_event_callback("aim_miss", aim_miss)


client.set_event_callback("shutdown", function()
    hide_refs(false)
end)