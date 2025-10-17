local var_0_0 = "admin"

ref = {
	enabled = ui.reference("AA", "Anti-Aimbot angles", "Enabled"),
	pitch = {
		ui.reference("AA", "Anti-Aimbot angles", "Pitch")
	},
	yaw_base = ui.reference("AA", "Anti-Aimbot angles", "Yaw base"),
	yaw = {
		ui.reference("AA", "Anti-Aimbot angles", "Yaw")
	},
	yaw_jitter = {
		ui.reference("AA", "Anti-Aimbot angles", "Yaw jitter")
	},
	body_yaw = {
		ui.reference("AA", "Anti-Aimbot angles", "Body yaw")
	},
	freestanding_body_yaw = ui.reference("AA", "Anti-Aimbot angles", "Freestanding body yaw"),
	edge_yaw = ui.reference("AA", "Anti-Aimbot angles", "Edge yaw"),
	freestand = {
		ui.reference("AA", "Anti-Aimbot angles", "Freestanding")
	},
	roll = ui.reference("AA", "Anti-Aimbot angles", "Roll"),
	slow_walk = {
		ui.reference("AA", "Other", "Slow motion")
	},
	dt = {
		ui.reference("RAGE", "Aimbot", "Double Tap")
	},
	hs = {
		ui.reference("AA", "Other", "On shot anti-aim")
	},
	fd = ui.reference("RAGE", "Other", "Duck peek assist"),
	min_damage = ui.reference("RAGE", "Aimbot", "Minimum damage"),
	min_damage_override = {
		ui.reference("RAGE", "Aimbot", "Minimum damage override")
	},
	rage_cb = {
		ui.reference("RAGE", "Aimbot", "Enabled")
	},
	menu_color = ui.reference("MISC", "Settings", "Menu color"),
	falelag_enabled = {
		ui.reference("AA", "Fake lag", "Enabled")
	},
	fakelag_limit = ui.reference("AA", "Fake lag", "Limit"),
	variability = ui.reference("AA", "Fake lag", "Variance"),
	fakelag_amount = ui.reference("AA", "Fake lag", "Amount"),
	aimbot = ui.reference("RAGE", "Aimbot", "Enabled"),
	scope_overlay = ui.reference("VISUALS", "Effects", "Remove scope overlay"),
	body = ui.reference("RAGE", "Aimbot", "Force Body aim"),
	dt_fakelag = ui.reference("RAGE", "Aimbot", "Double tap fake lag limit")
}

local var_0_1 = require("vector")
local var_0_2 = require("ffi")
local var_0_3 = require("gamesense/csgo_weapons")
local var_0_4 = require("gamesense/clipboard")
local var_0_5 = require("json")
local var_0_6 = require("gamesense/base64")

local function var_0_7(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = 10000
	local var_1_1, var_1_2 = client.screen_size()
	local var_1_3 = ui.new_slider("LUA", "A", arg_1_0 .. " pos x", 0, var_1_0, arg_1_1 / var_1_1 * var_1_0)
	local var_1_4 = ui.new_slider("LUA", "A", arg_1_0 .. " pos y", 0, var_1_0, arg_1_2 / var_1_2 * var_1_0)

	ui.set_visible(var_1_3, false)
	ui.set_visible(var_1_4, false)

	local var_1_5 = {
		dragging = false,
		ox = 0,
		oy = 0
	}

	return {
		get = function()
			local var_2_0, var_2_1 = client.screen_size()

			return ui.get(var_1_3) / var_1_0 * var_2_0, ui.get(var_1_4) / var_1_0 * var_2_1
		end,
		drag = function(arg_3_0, arg_3_1)
			if ui.is_menu_open() then
				local var_3_0, var_3_1 = ui.mouse_position()
				local var_3_2 = client.key_state(1)
				local var_3_3, var_3_4 = client.screen_size()
				local var_3_5 = ui.get(var_1_3) / var_1_0 * var_3_3
				local var_3_6 = ui.get(var_1_4) / var_1_0 * var_3_4

				if var_3_2 and not var_1_5.dragging and var_3_5 <= var_3_0 and var_3_6 <= var_3_1 and var_3_0 <= var_3_5 + arg_3_0 and var_3_1 <= var_3_6 + arg_3_1 then
					var_1_5.dragging = true
					var_1_5.ox = var_3_0 - var_3_5
					var_1_5.oy = var_3_1 - var_3_6
				elseif not var_3_2 then
					var_1_5.dragging = false
				end

				if var_1_5.dragging then
					local var_3_7 = var_3_0 - var_1_5.ox
					local var_3_8 = var_3_1 - var_1_5.oy

					if var_3_7 < 0 then
						var_3_7 = 0
					elseif var_3_3 < var_3_7 + arg_3_0 then
						var_3_7 = var_3_3 - arg_3_0
					end

					if var_3_8 < 0 then
						var_3_8 = 0
					elseif var_3_4 < var_3_8 + arg_3_1 then
						var_3_8 = var_3_4 - arg_3_1
					end

					ui.set(var_1_3, var_3_7 / var_3_3 * var_1_0)
					ui.set(var_1_4, var_3_8 / var_3_4 * var_1_0)
				end
			else
				var_1_5.dragging = false
			end
		end
	}
end

local var_0_8 = {
	get_lp = function()
		return entity.get_local_player()
	end,
	is_alive = function(arg_5_0)
		return entity.is_alive(arg_5_0)
	end,
	get_velocity = function(arg_6_0)
		return math.max(0, math.floor(var_0_1(entity.get_prop(arg_6_0, "m_vecAbsVelocity")):length2d()) - 1)
	end,
	isScoped = function(arg_7_0)
		return entity.get_prop(arg_7_0, "m_bIsScoped") == 1
	end
}
local var_0_9 = {}

function var_0_9.get_dt()
	return var_0_9._shifting_enough
end

function var_0_9.run_command(arg_9_0)
	local var_9_0 = var_0_8.get_lp()

	if var_9_0 then
		local var_9_1 = entity.get_prop(var_9_0, "m_nTickBase")
		local var_9_2 = client.latency()
		local var_9_3 = math.floor(var_9_1 - globals.tickcount() - 3 - toticks(var_9_2) * 0.5 + 0.5 * (var_9_2 * 10))
		local var_9_4 = -14 + (ui.get(ref.dt_fakelag) - 1) + 3

		var_0_9._shifting_enough = var_9_3 <= var_9_4
	end
end

local function var_0_10(arg_10_0, arg_10_1, arg_10_2)
	return math.max(arg_10_1, math.min(arg_10_2, arg_10_0))
end

local function var_0_11(...)
	return ...
end

local function var_0_12(arg_12_0, arg_12_1, arg_12_2)
	return arg_12_0 + (arg_12_1 - arg_12_0) * arg_12_2
end

local function var_0_13(arg_13_0, arg_13_1, arg_13_2)
	return arg_13_0 + (arg_13_1 - arg_13_0) * globals.absoluteframetime() * arg_13_2
end

local function var_0_14(arg_14_0, arg_14_1)
	for iter_14_0 = 1, #arg_14_0 do
		if arg_14_0[iter_14_0] == arg_14_1 then
			return true
		end
	end

	return false
end

local function var_0_15(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_2 * arg_15_1
	local var_15_1 = arg_15_2 * arg_15_1 * (1 - math.abs(arg_15_0 * 6 % 2 - 1))
	local var_15_2 = arg_15_2 - var_15_0
	local var_15_3 = 0
	local var_15_4 = 0
	local var_15_5 = 0

	if arg_15_0 < 0.16666666666666666 then
		var_15_3, var_15_4, var_15_5 = var_15_0, var_15_1, 0
	elseif arg_15_0 < 0.3333333333333333 then
		var_15_3, var_15_4, var_15_5 = var_15_1, var_15_0, 0
	elseif arg_15_0 < 0.5 then
		var_15_3, var_15_4, var_15_5 = 0, var_15_0, var_15_1
	elseif arg_15_0 < 0.6666666666666666 then
		var_15_3, var_15_4, var_15_5 = 0, var_15_1, var_15_0
	elseif arg_15_0 < 0.8333333333333334 then
		var_15_3, var_15_4, var_15_5 = var_15_1, 0, var_15_0
	else
		var_15_3, var_15_4, var_15_5 = var_15_0, 0, var_15_1
	end

	return math.floor((var_15_3 + var_15_2) * 255), math.floor((var_15_4 + var_15_2) * 255), math.floor((var_15_5 + var_15_2) * 255)
end

local function var_0_16(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0 = globals.realtime() * arg_16_3
	local var_16_1 = ""
	local var_16_2 = #arg_16_2
	local var_16_3 = -0.5 * (1 - math.cos(var_16_0))

	for iter_16_0 = 1, var_16_2 do
		local var_16_4 = iter_16_0
		local var_16_5 = arg_16_2:sub(iter_16_0, iter_16_0)
		local var_16_6 = (math.sin(var_16_0 + var_16_4 / var_16_2 * math.pi) + 1) / 2
		local var_16_7 = math.floor(arg_16_0[1] * var_16_6 + arg_16_1[1] * (1 - var_16_6))
		local var_16_8 = math.floor(arg_16_0[2] * var_16_6 + arg_16_1[2] * (1 - var_16_6))
		local var_16_9 = math.floor(arg_16_0[3] * var_16_6 + arg_16_1[3] * (1 - var_16_6))

		var_16_1 = var_16_1 .. string.format("\a%02X%02X%02XFF%s", var_16_7, var_16_8, var_16_9, var_16_5)
	end

	return var_16_1
end

local var_0_17 = {}
local var_0_18, var_0_19 = client.screen_size()

local function var_0_20(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	table.insert(var_0_17, {
		state = "appearing",
		fade_delay = 1,
		text = arg_17_0,
		duration = arg_17_1,
		start = globals.curtime(),
		color = {
			arg_17_2,
			arg_17_3,
			arg_17_4
		},
		y = var_0_19 + 100
	})
end

local function var_0_21(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4, arg_18_5, arg_18_6, arg_18_7, arg_18_8)
	renderer.line(arg_18_0 + arg_18_4, arg_18_1, arg_18_0 + arg_18_2 - arg_18_4, arg_18_1, arg_18_5, arg_18_6, arg_18_7, arg_18_8)
	renderer.line(arg_18_0 + arg_18_4, arg_18_1 + arg_18_3, arg_18_0 + arg_18_2 - arg_18_4, arg_18_1 + arg_18_3, arg_18_5, arg_18_6, arg_18_7, arg_18_8)
	renderer.line(arg_18_0, arg_18_1 + arg_18_4, arg_18_0, arg_18_1 + arg_18_3 - arg_18_4, arg_18_5, arg_18_6, arg_18_7, arg_18_8)
	renderer.line(arg_18_0 + arg_18_2, arg_18_1 + arg_18_4, arg_18_0 + arg_18_2, arg_18_1 + arg_18_3 - arg_18_4, arg_18_5, arg_18_6, arg_18_7, arg_18_8)
	renderer.circle_outline(arg_18_0 + arg_18_4, arg_18_1 + arg_18_4, arg_18_5, arg_18_6, arg_18_7, arg_18_8, arg_18_4, 180, 0.25, 1)
	renderer.circle_outline(arg_18_0 + arg_18_2 - arg_18_4, arg_18_1 + arg_18_4, arg_18_5, arg_18_6, arg_18_7, arg_18_8, arg_18_4, 270, 0.25, 1)
	renderer.circle_outline(arg_18_0 + arg_18_4, arg_18_1 + arg_18_3 - arg_18_4, arg_18_5, arg_18_6, arg_18_7, arg_18_8, arg_18_4, 90, 0.25, 1)
	renderer.circle_outline(arg_18_0 + arg_18_2 - arg_18_4, arg_18_1 + arg_18_3 - arg_18_4, arg_18_5, arg_18_6, arg_18_7, arg_18_8, arg_18_4, 0, 0.25, 1)
end

local function var_0_22(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4, arg_19_5, arg_19_6, arg_19_7, arg_19_8, arg_19_9)
	local var_19_0 = arg_19_2 - 2 * arg_19_4
	local var_19_1 = arg_19_3 - 2 * arg_19_4
	local var_19_2 = math.pi * arg_19_4 / 2
	local var_19_3 = (var_19_0 * 2 + var_19_1 * 2 + var_19_2 * 4) * arg_19_9
	local var_19_4 = 0

	local function var_19_5(arg_20_0, arg_20_1)
		if var_19_4 >= var_19_3 then
			return false
		end

		local var_20_0 = var_19_3 - var_19_4
		local var_20_1 = math.min(var_20_0, arg_20_0)

		arg_20_1(var_20_1 / arg_20_0)

		var_19_4 = var_19_4 + var_20_1

		return true
	end

	var_19_5(var_19_0, function(arg_21_0)
		renderer.line(arg_19_0 + arg_19_4, arg_19_1, arg_19_0 + arg_19_4 + arg_21_0 * var_19_0, arg_19_1, arg_19_5, arg_19_6, arg_19_7, arg_19_8)
	end)
	var_19_5(var_19_2, function(arg_22_0)
		renderer.circle_outline(arg_19_0 + arg_19_2 - arg_19_4, arg_19_1 + arg_19_4, arg_19_5, arg_19_6, arg_19_7, arg_19_8, arg_19_4, 270, arg_22_0 * 0.25, 1)
	end)
	var_19_5(var_19_1, function(arg_23_0)
		renderer.line(arg_19_0 + arg_19_2, arg_19_1 + arg_19_4, arg_19_0 + arg_19_2, arg_19_1 + arg_19_4 + arg_23_0 * var_19_1, arg_19_5, arg_19_6, arg_19_7, arg_19_8)
	end)
	var_19_5(var_19_2, function(arg_24_0)
		renderer.circle_outline(arg_19_0 + arg_19_2 - arg_19_4, arg_19_1 + arg_19_3 - arg_19_4, arg_19_5, arg_19_6, arg_19_7, arg_19_8, arg_19_4, 0, arg_24_0 * 0.25, 1)
	end)
	var_19_5(var_19_0, function(arg_25_0)
		renderer.line(arg_19_0 + arg_19_2 - arg_19_4, arg_19_1 + arg_19_3, arg_19_0 + arg_19_2 - arg_19_4 - arg_25_0 * var_19_0, arg_19_1 + arg_19_3, arg_19_5, arg_19_6, arg_19_7, arg_19_8)
	end)
	var_19_5(var_19_2, function(arg_26_0)
		renderer.circle_outline(arg_19_0 + arg_19_4, arg_19_1 + arg_19_3 - arg_19_4, arg_19_5, arg_19_6, arg_19_7, arg_19_8, arg_19_4, 90, arg_26_0 * 0.25, 1)
	end)
	var_19_5(var_19_1, function(arg_27_0)
		renderer.line(arg_19_0, arg_19_1 + arg_19_3 - arg_19_4, arg_19_0, arg_19_1 + arg_19_3 - arg_19_4 - arg_27_0 * var_19_1, arg_19_5, arg_19_6, arg_19_7, arg_19_8)
	end)
	var_19_5(var_19_2, function(arg_28_0)
		renderer.circle_outline(arg_19_0 + arg_19_4, arg_19_1 + arg_19_4, arg_19_5, arg_19_6, arg_19_7, arg_19_8, arg_19_4, 180, arg_28_0 * 0.25, 1)
	end)
end

function render_logs()
	local var_29_0 = globals.curtime()
	local var_29_1 = globals.frametime()
	local var_29_2 = "cb"
	local var_29_3 = 12
	local var_29_4 = 12
	local var_29_5 = var_0_19 - 100
	local var_29_6 = 11
	local var_29_7 = 6

	for iter_29_0, iter_29_1 in ipairs(var_0_17) do
		local var_29_8 = var_29_0 - iter_29_1.start

		if iter_29_1.state == "disappearing" and iter_29_1.y > var_0_19 + 50 then
			table.remove(var_0_17, iter_29_0)
		elseif var_29_8 >= iter_29_1.duration * iter_29_1.fade_delay and iter_29_1.state ~= "disappearing" then
			iter_29_1.state = "disappearing"
		end
	end

	for iter_29_2, iter_29_3 in ipairs(var_0_17) do
		local var_29_9 = var_29_0 - iter_29_3.start
		local var_29_10 = math.min(var_29_9 / iter_29_3.duration, 1)
		local var_29_11, var_29_12 = renderer.measure_text(var_29_2, iter_29_3.text)
		local var_29_13 = var_29_11 + var_29_4 * 2 + 4
		local var_29_14 = var_29_12 + var_29_6
		local var_29_15 = (var_0_18 - var_29_13) / 2
		local var_29_16 = var_29_5 - (var_29_14 + var_29_3) * (#var_0_17 - iter_29_2)

		if iter_29_3.state == "appearing" then
			iter_29_3.y = var_0_12(iter_29_3.y, var_29_16, var_29_1 * 15)

			if math.abs(iter_29_3.y - var_29_16) < 1 then
				iter_29_3.state = "visible"
			end
		elseif iter_29_3.state == "visible" then
			iter_29_3.y = var_0_12(iter_29_3.y, var_29_16, var_29_1 * 5)
		elseif iter_29_3.state == "disappearing" then
			iter_29_3.y = var_0_12(iter_29_3.y, var_0_19 + 100, var_29_1 * 5)
		end

		var_0_21(var_29_15, iter_29_3.y, var_29_13, var_29_14, var_29_7, 20, 20, 20, 255)
		var_0_22(var_29_15, iter_29_3.y, var_29_13, var_29_14, var_29_7, iter_29_3.color[1], iter_29_3.color[2], iter_29_3.color[3], 255, var_29_10)

		local var_29_17 = var_29_15 + var_29_13 / 2
		local var_29_18 = iter_29_3.y + (var_29_14 - var_29_12) / 2 + 5

		renderer.text(var_29_17, var_29_18, 255, 255, 255, 255, var_29_2, 0, iter_29_3.text)
	end
end

local var_0_23 = 0
local var_0_24 = 0

local function var_0_25(arg_30_0)
	local var_30_0 = arg_30_0.chokedcommands

	if var_30_0 <= var_0_23 or var_30_0 == 0 then
		var_0_24 = var_0_23
	end

	var_0_23 = var_30_0
end

local var_0_26 = 0
local var_0_27 = 0
local var_0_28 = 0
local var_0_29 = 0
local var_0_30

local function var_0_31(arg_31_0)
	local var_31_0 = var_0_24 or 0

	var_0_26 = var_0_27
	var_0_27 = var_0_28
	var_0_28 = var_0_29
	var_0_29 = var_31_0
	var_0_30 = var_0_26 .. "-" .. var_0_27 .. "-" .. var_0_28 .. "-" .. var_0_29
end

function to_hex(arg_32_0, arg_32_1, arg_32_2, arg_32_3)
	return string.format("%02x%02x%02x%02x", arg_32_0, arg_32_1, arg_32_2, arg_32_3)
end

function to_hex_a(arg_33_0, arg_33_1, arg_33_2)
	return string.format("%02x%02x%02xff", arg_33_0, arg_33_1, arg_33_2)
end

local function var_0_32()
	local var_34_0 = var_0_8.get_lp()

	if not var_34_0 or not var_0_8.is_alive(var_34_0) then
		return 0
	end

	local var_34_1 = entity.get_prop(var_34_0, "m_flPoseParameter", 11) * 120 - 60

	return math.floor(var_34_1)
end

local var_0_33 = 1
local var_0_34 = ui.new_button("AA", "Anti-Aimbot angles", "Back", function()
	var_0_33 = 1
end)
local var_0_35 = ui.new_button("AA", "Anti-Aimbot angles", "Anti - Aim", function()
	var_0_33 = 2
end)
local var_0_36 = ui.new_button("AA", "Anti-Aimbot angles", "Visuals", function()
	var_0_33 = 3
end)
local var_0_37 = ui.new_button("AA", "Anti-Aimbot angles", "Misc", function()
	var_0_33 = 4
end)
local var_0_38 = ui.new_button("AA", "Anti-Aimbot angles", "Config", function()
	var_0_33 = 5
end)
local var_0_39 = ui.new_checkbox("AA", "Anti-Aimbot angles", "Crosshair Indicators")
local var_0_40 = ui.new_color_picker("AA", "Anti-Aimbot angles", "Crosshair Indicators", 0, 125, 255, 255)
local var_0_41 = ui.new_checkbox("AA", "Anti-Aimbot angles", "Aimbot Logs")
local var_0_42 = ui.new_color_picker("AA", "Anti-Aimbot angles", "Aimot Logs", 255, 255, 255, 255)
local var_0_43 = ui.new_multiselect("AA", "Anti-Aimbot angles", "UI", "Watermark", "Keybinds", "Spectators")
local var_0_44 = ui.new_combobox("AA", "Anti-Aimbot angles", "Watermark Position", "Right upper", "Left upper", "Down centered")
local var_0_45 = ui.new_checkbox("AA", "Anti-Aimbot angles", "Custom Scope")
local var_0_46 = ui.new_color_picker("AA", "Anti-Aimbot angles", "Custom Scope", 255, 255, 255, 255)
local var_0_47 = ui.new_slider("AA", "Anti-Aimbot angles", "Custom Scope Size", 0, 320, 10)
local var_0_48 = ui.new_checkbox("AA", "Anti-Aimbot angles", "Disable Scope Animation")
local var_0_49 = ui.new_checkbox("AA", "Anti-Aimbot angles", "Recharge Fix")
local var_0_50 = ui.new_checkbox("AA", "Anti-Aimbot angles", "Console Filter")
local var_0_51 = ui.new_checkbox("AA", "Anti-Aimbot angles", "Force Team Aimbot")
local var_0_52 = {
	"Global",
	"Stand",
	"Running",
	"Air",
	"Air-Duck",
	"Slow-walk",
	"Duck",
	"Duck-Running"
}
local var_0_53 = {}
local var_0_54 = ui.new_slider("AA", "Anti-Aimbot angles", "Tab", 1, 3, 1, true, "", 1, {
	"Builder",
	"Defensive",
	"Tweaks"
})
local var_0_55 = ui.new_combobox("AA", "Anti-Aimbot angles", "State selector", var_0_52)
local var_0_56 = to_hex(ui.get(ref.menu_color))

for iter_0_0, iter_0_1 in ipairs(var_0_52) do
	local var_0_57 = string.format("\a%s", var_0_56) .. iter_0_1 .. " \aC0C0C0FF"

	if iter_0_1 ~= "Global" then
		var_0_53[iter_0_1] = {
			allow = ui.new_checkbox("AA", "Anti-Aimbot angles", "Allow " .. var_0_57),
			yaw_select = ui.new_combobox("AA", "Anti-Aimbot angles", var_0_57 .. "yaw type", "Static", "L/R"),
			static_yaw = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "yaw value", -180, 180, 0, true, "°"),
			l_yaw = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "yaw left", -180, 180, 0, true, "°"),
			r_yaw = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "yaw right", -180, 180, 0, true, "°"),
			yaw_jitter = ui.new_combobox("AA", "Anti-Aimbot angles", var_0_57 .. "yaw jitter", "Off", "Offset", "Center", "Random", "Skitter"),
			yaw_jitter_value = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "yaw jitter value", -180, 180, 0, true, "°"),
			body_yaw = ui.new_combobox("AA", "Anti-Aimbot angles", var_0_57 .. "body yaw", "Off", "Static", "Jitter"),
			body_yaw_value = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "body yaw value", -60, 60, 0, true, "°"),
			delay = ui.new_combobox("AA", "Anti-Aimbot angles", var_0_57 .. "delay type", "Off", "Tickbased", "Chance"),
			delay_t = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "delay ticks", 1, 14, 1, true, "t"),
			delay_c = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "switch chance", 1, 100, 1, true, "%"),
			break_lc = ui.new_checkbox("AA", "Anti-Aimbot angles", var_0_57 .. "break lc"),
			defensive_aa = ui.new_checkbox("AA", "Anti-Aimbot angles", var_0_57 .. "defensive anti-aim"),
			defensive_pitch = ui.new_combobox("AA", "Anti-Aimbot angles", var_0_57 .. "defensive pitch", "Off", "Static", "Jitter", "Random", "Sway"),
			defensive_pitch_static = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "pitch value", -89, 89, 0, true, "°"),
			defensive_pitch_2 = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "second pitch value", -89, 89, 0, true, "°"),
			defensive_pitch_delay = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "delay value", 1, 14, 1, true, "t"),
			defensive_yaw = ui.new_combobox("AA", "Anti-Aimbot angles", var_0_57 .. "defensive yaw", "Off", "Static", "Jitter", "Random", "Spin"),
			defensive_yaw_static = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "yaw offset", -180, 180, 0, true, "°"),
			defensive_yaw_spin = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "spin speed", 1, 100, 1, true, "°/s"),
			defensive_yaw_2 = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "second yaw offset", -180, 180, 0, true, "°"),
			defensive_yaw_delay = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "yaw delay", 1, 14, 1, true, "t")
		}
	else
		var_0_53[iter_0_1] = {
			yaw_select = ui.new_combobox("AA", "Anti-Aimbot angles", var_0_57 .. "yaw type", "Static", "L/R"),
			static_yaw = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "yaw value", -180, 180, 0, true, "°"),
			l_yaw = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "yaw left", -180, 180, 0, true, "°"),
			r_yaw = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "yaw right", -180, 180, 0, true, "°"),
			yaw_jitter = ui.new_combobox("AA", "Anti-Aimbot angles", var_0_57 .. "yaw jitter", "Off", "Offset", "Center", "Random", "Skitter"),
			yaw_jitter_value = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "yaw jitter value", -180, 180, 0, true, "°"),
			body_yaw = ui.new_combobox("AA", "Anti-Aimbot angles", var_0_57 .. "body yaw", "Off", "Static", "Jitter"),
			body_yaw_value = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "body yaw value", -60, 60, 0, true, "°"),
			delay = ui.new_combobox("AA", "Anti-Aimbot angles", var_0_57 .. "delay type", "Off", "Tickbased", "Chance"),
			delay_t = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "delay ticks", 1, 14, 1, true, "t"),
			delay_c = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "switch chance", 1, 100, 1, true, "%"),
			break_lc = ui.new_checkbox("AA", "Anti-Aimbot angles", var_0_57 .. "break lc"),
			defensive_aa = ui.new_checkbox("AA", "Anti-Aimbot angles", var_0_57 .. "defensive anti-aim"),
			defensive_pitch = ui.new_combobox("AA", "Anti-Aimbot angles", var_0_57 .. "defensive pitch", "Off", "Static", "Jitter", "Random", "Sway"),
			defensive_pitch_static = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "pitch value", -89, 89, 0, true, "°"),
			defensive_pitch_2 = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "second pitch value", -89, 89, 0, true, "°"),
			defensive_pitch_delay = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "delay value", 1, 14, 1, true, "t"),
			defensive_yaw = ui.new_combobox("AA", "Anti-Aimbot angles", var_0_57 .. "defensive yaw", "Off", "Static", "Jitter", "Random", "Spin"),
			defensive_yaw_static = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "yaw offset", -180, 180, 0, true, "°"),
			defensive_yaw_spin = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "spin speed", 1, 100, 1, true, "°s"),
			defensive_yaw_2 = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "second yaw offset", -180, 180, 0, true, "°"),
			defensive_yaw_delay = ui.new_slider("AA", "Anti-Aimbot angles", var_0_57 .. "yaw delay", 1, 14, 1, true, "t")
		}
	end
end

local function var_0_58()
	local var_40_0 = ui.get(var_0_55)

	for iter_40_0, iter_40_1 in ipairs(var_0_52) do
		local var_40_1 = var_0_53[iter_40_1]
		local var_40_2 = iter_40_1 == var_40_0 and var_0_33 == 2 and ui.get(var_0_54) == 1
		local var_40_3 = iter_40_1 == var_40_0 and var_0_33 == 2 and ui.get(var_0_54) == 2
		local var_40_4 = iter_40_1 == "Global" or var_40_1.allow and ui.get(var_40_1.allow)

		if var_40_1.allow then
			ui.set_visible(var_40_1.allow, var_40_2 or var_40_3)
		end

		if var_40_1.yaw_select then
			ui.set_visible(var_40_1.yaw_select, var_40_2 and var_40_4)
		end

		if var_40_1.static_yaw then
			ui.set_visible(var_40_1.static_yaw, var_40_2 and var_40_4 and ui.get(var_40_1.yaw_select) == "Static")
		end

		if var_40_1.l_yaw then
			ui.set_visible(var_40_1.l_yaw, var_40_2 and var_40_4 and ui.get(var_40_1.yaw_select) == "L/R")
		end

		if var_40_1.r_yaw then
			ui.set_visible(var_40_1.r_yaw, var_40_2 and var_40_4 and ui.get(var_40_1.yaw_select) == "L/R")
		end

		if var_40_1.yaw_jitter then
			ui.set_visible(var_40_1.yaw_jitter, var_40_2 and var_40_4)
		end

		if var_40_1.yaw_jitter_value then
			ui.set_visible(var_40_1.yaw_jitter_value, var_40_2 and var_40_4 and ui.get(var_40_1.yaw_jitter) ~= "Off")
		end

		if var_40_1.body_yaw then
			ui.set_visible(var_40_1.body_yaw, var_40_2 and var_40_4)
		end

		if var_40_1.body_yaw_value then
			ui.set_visible(var_40_1.body_yaw_value, var_40_2 and var_40_4 and ui.get(var_40_1.body_yaw) ~= "Off")
		end

		if var_40_1.delay then
			ui.set_visible(var_40_1.delay, var_40_2 and var_40_4 and ui.get(var_40_1.body_yaw) == "Jitter")
		end

		if var_40_1.delay_t then
			ui.set_visible(var_40_1.delay_t, var_40_2 and var_40_4 and ui.get(var_40_1.delay) == "Tickbased" and ui.get(var_40_1.body_yaw) == "Jitter")
		end

		if var_40_1.delay_c then
			ui.set_visible(var_40_1.delay_c, var_40_2 and var_40_4 and ui.get(var_40_1.delay) == "Chance" and ui.get(var_40_1.body_yaw) == "Jitter")
		end

		if var_40_1.break_lc then
			ui.set_visible(var_40_1.break_lc, var_40_2 and var_40_4)
		end

		if var_40_1.defensive_aa then
			ui.set_visible(var_40_1.defensive_aa, var_40_3 and var_40_4)
		end

		if var_40_1.defensive_pitch then
			ui.set_visible(var_40_1.defensive_pitch, var_40_3 and var_40_4 and ui.get(var_40_1.defensive_aa))
		end

		if var_40_1.defensive_pitch_static then
			ui.set_visible(var_40_1.defensive_pitch_static, var_40_3 and var_40_4 and ui.get(var_40_1.defensive_aa) and ui.get(var_40_1.defensive_pitch) ~= "Off")
		end

		if var_40_1.defensive_pitch_2 then
			ui.set_visible(var_40_1.defensive_pitch_2, var_40_3 and var_40_4 and ui.get(var_40_1.defensive_aa) and (ui.get(var_40_1.defensive_pitch) == "Jitter" or ui.get(var_40_1.defensive_pitch) == "Random" or ui.get(var_40_1.defensive_pitch) == "Sway"))
		end

		if var_40_1.defensive_pitch_delay then
			ui.set_visible(var_40_1.defensive_pitch_delay, var_40_3 and var_40_4 and ui.get(var_40_1.defensive_aa) and ui.get(var_40_1.defensive_pitch) == "Jitter")
		end

		if var_40_1.defensive_yaw then
			ui.set_visible(var_40_1.defensive_yaw, var_40_3 and var_40_4 and ui.get(var_40_1.defensive_aa))
		end

		if var_40_1.defensive_yaw_static then
			ui.set_visible(var_40_1.defensive_yaw_static, var_40_3 and var_40_4 and ui.get(var_40_1.defensive_aa) and ui.get(var_40_1.defensive_yaw) ~= "Off" and ui.get(var_40_1.defensive_yaw) ~= "Spin")
		end

		if var_40_1.defensive_yaw_2 then
			ui.set_visible(var_40_1.defensive_yaw_2, var_40_3 and var_40_4 and ui.get(var_40_1.defensive_aa) and (ui.get(var_40_1.defensive_yaw) == "Jitter" or ui.get(var_40_1.defensive_yaw) == "Random"))
		end

		if var_40_1.defensive_yaw_delay then
			ui.set_visible(var_40_1.defensive_yaw_delay, var_40_3 and var_40_4 and ui.get(var_40_1.defensive_aa) and ui.get(var_40_1.defensive_yaw) == "Jitter")
		end

		if var_40_1.defensive_yaw_spin then
			ui.set_visible(var_40_1.defensive_yaw_spin, var_40_3 and var_40_4 and ui.get(var_40_1.defensive_aa) and ui.get(var_40_1.defensive_yaw) == "Spin")
		end
	end
end

var_0_58()

local var_0_59 = ui.new_checkbox("AA", "Anti-Aimbot angles", "Avoid Backstab")
local var_0_60 = ui.new_multiselect("AA", "Anti-Aimbot angles", "Safe Head", "Knife", "Zeus")
local var_0_61 = ui.new_hotkey("AA", "Anti-Aimbot angles", "Freestanding")
local var_0_62 = ui.new_hotkey("AA", "Anti-Aimbot angles", "Manual Left")
local var_0_63 = ui.new_hotkey("AA", "Anti-Aimbot angles", "Manual Right")
local var_0_64 = ui.new_hotkey("AA", "Anti-Aimbot angles", "Edge Yaw")
local var_0_65 = ui.new_label("AA", "Fake Lag", "\a" .. var_0_56 .. "Vandal\aC0C0C0FF • Private")
local var_0_66 = ui.new_label("AA", "Fake Lag", "\a" .. var_0_56 .. "Username\aC0C0C0FF - " .. var_0_0)
local var_0_67 = ui.new_label("AA", "Fake Lag", "\a" .. var_0_56 .. "Last Update\aC0C0C0FF - 21.04.25")

local function var_0_68()
	ui.set_visible(var_0_34, var_0_33 ~= 1)
	ui.set_visible(var_0_35, var_0_33 == 1)
	ui.set_visible(var_0_36, var_0_33 == 1)
	ui.set_visible(var_0_37, var_0_33 == 1)
	ui.set_visible(var_0_38, var_0_33 == 1)
	ui.set_visible(var_0_65, var_0_33 == 1)
	ui.set_visible(var_0_66, var_0_33 == 1)
	ui.set_visible(var_0_67, var_0_33 == 1)
	ui.set_visible(var_0_55, var_0_33 == 2 and (ui.get(var_0_54) == 1 or ui.get(var_0_54) == 2))
	ui.set_visible(var_0_54, var_0_33 == 2)
	ui.set_visible(var_0_59, var_0_33 == 2 and ui.get(var_0_54) == 3)
	ui.set_visible(var_0_60, var_0_33 == 2 and ui.get(var_0_54) == 3)
	ui.set_visible(var_0_61, var_0_33 == 2 and ui.get(var_0_54) == 3)
	ui.set_visible(var_0_62, var_0_33 == 2 and ui.get(var_0_54) == 3)
	ui.set_visible(var_0_63, var_0_33 == 2 and ui.get(var_0_54) == 3)
	ui.set_visible(var_0_64, var_0_33 == 2 and ui.get(var_0_54) == 3)
	ui.set_visible(var_0_39, var_0_33 == 3)
	ui.set_visible(var_0_40, var_0_33 == 3 and ui.get(var_0_39))
	ui.set_visible(var_0_41, var_0_33 == 3)
	ui.set_visible(var_0_42, var_0_33 == 3 and ui.get(var_0_41))
	ui.set_visible(var_0_43, var_0_33 == 3)
	ui.set_visible(var_0_44, var_0_33 == 3 and var_0_14(ui.get(var_0_43), "Watermark"))
	ui.set_visible(var_0_45, var_0_33 == 3)
	ui.set_visible(var_0_46, var_0_33 == 3 and ui.get(var_0_45))
	ui.set_visible(var_0_47, var_0_33 == 3 and ui.get(var_0_45))
	ui.set_visible(var_0_48, var_0_33 == 3 and ui.get(var_0_45))
	ui.set_visible(var_0_49, var_0_33 == 4)
	ui.set_visible(var_0_50, var_0_33 == 4)
	ui.set_visible(var_0_51, var_0_33 == 4)
end

var_0_68()

is_on_ground = false

local function var_0_69(arg_42_0)
	local var_42_0 = var_0_8.get_lp()

	if not var_42_0 or not var_0_8.is_alive(var_42_0) then
		return "Unknown"
	end

	local var_42_1 = entity.get_prop(var_42_0, "m_fFlags")
	local var_42_2 = var_0_8.get_velocity(var_42_0)
	local var_42_3 = bit.band(var_42_1, 1) == 1
	local var_42_4 = bit.band(var_42_1, 1) == 0 or arg_42_0.in_jump == 1
	local var_42_5 = entity.get_prop(var_42_0, "m_flDuckAmount") > 0.7
	local var_42_6 = ui.get(ref.slow_walk[1]) and ui.get(ref.slow_walk[2])

	is_on_ground = var_42_3

	if var_42_4 and var_42_5 then
		return "Air-Duck"
	elseif var_42_4 then
		return "Air"
	elseif var_42_5 and var_42_2 > 10 then
		return "Duck-Running"
	elseif var_42_5 and var_42_2 < 10 then
		return "Duck"
	elseif var_42_3 and var_42_6 and var_42_2 > 10 then
		return "Slow-walk"
	elseif var_42_3 and var_42_2 > 5 then
		return "Running"
	elseif var_42_3 and var_42_2 < 5 then
		return "Stand"
	else
		return "Unknown"
	end
end

local var_0_70

local function var_0_71(arg_43_0)
	var_0_70 = var_0_69(arg_43_0)
end

local var_0_72 = 0
local var_0_73 = 1
local var_0_74 = 0.04

function smooth_exploit()
	var_0_73 = var_0_9.get_dt() and 1 or 0
	var_0_72 = var_0_72 + (var_0_73 - var_0_72) * var_0_74

	if math.abs(var_0_72 - var_0_73) < 0.01 then
		var_0_72 = var_0_73
	end

	return var_0_72
end

local function var_0_75(arg_45_0, arg_45_1, arg_45_2, arg_45_3, arg_45_4, arg_45_5, arg_45_6, arg_45_7, arg_45_8)
	arg_45_4 = math.min(arg_45_0 / 2, arg_45_1 / 2, arg_45_4)

	renderer.rectangle(arg_45_0, arg_45_1 + arg_45_4, arg_45_2, arg_45_3 - arg_45_4 * 2, arg_45_5, arg_45_6, arg_45_7, arg_45_8)
	renderer.rectangle(arg_45_0 + arg_45_4, arg_45_1, arg_45_2 - arg_45_4 * 2, arg_45_4, arg_45_5, arg_45_6, arg_45_7, arg_45_8)
	renderer.rectangle(arg_45_0 + arg_45_4, arg_45_1 + arg_45_3 - arg_45_4, arg_45_2 - arg_45_4 * 2, arg_45_4, arg_45_5, arg_45_6, arg_45_7, arg_45_8)
	renderer.circle(arg_45_0 + arg_45_4, arg_45_1 + arg_45_4, arg_45_5, arg_45_6, arg_45_7, arg_45_8, arg_45_4, 180, 0.25)
	renderer.circle(arg_45_0 - arg_45_4 + arg_45_2, arg_45_1 + arg_45_4, arg_45_5, arg_45_6, arg_45_7, arg_45_8, arg_45_4, 90, 0.25)
	renderer.circle(arg_45_0 - arg_45_4 + arg_45_2, arg_45_1 - arg_45_4 + arg_45_3, arg_45_5, arg_45_6, arg_45_7, arg_45_8, arg_45_4, 0, 0.25)
	renderer.circle(arg_45_0 + arg_45_4, arg_45_1 - arg_45_4 + arg_45_3, arg_45_5, arg_45_6, arg_45_7, arg_45_8, arg_45_4, -90, 0.25)
	renderer.rectangle(arg_45_0, arg_45_1, arg_45_2, 1, 0, 0, 0, 255)
	renderer.rectangle(arg_45_0, arg_45_1 + arg_45_3 - 1, arg_45_2, 1, 0, 0, 0, 255)
	renderer.rectangle(arg_45_0, arg_45_1, 1, arg_45_3, 0, 0, 0, 255)
	renderer.rectangle(arg_45_0 + arg_45_2 - 1, arg_45_1, 1, arg_45_3, 0, 0, 0, 255)
end

local var_0_76 = 0
local var_0_77 = 0
local var_0_78 = 0
local var_0_79 = 0
local var_0_80 = 0
local var_0_81 = 0
local var_0_82 = 0

local function var_0_83()
	if not ui.get(var_0_39) then
		return
	end

	local var_46_0 = var_0_8.get_lp()

	if not var_46_0 or not var_0_8.is_alive(var_46_0) then
		return
	end

	local var_46_1, var_46_2 = client.screen_size()
	local var_46_3 = var_46_1 / 2
	local var_46_4 = var_46_2 / 2
	local var_46_5 = var_0_8.get_velocity(var_46_0)
	local var_46_6 = math.min(var_46_5 / 450, 1)
	local var_46_7 = var_0_12(1, 64, var_46_6)
	local var_46_8 = var_0_32() < 0 and "left" or "right"
	local var_46_9 = var_0_70 and string.upper(var_0_70) or "UNKNOWN"
	local var_46_10 = var_0_8.isScoped(var_46_0)

	if var_46_9 == "AIR-DUCK" then
		var_0_76 = var_0_13(var_0_76, var_46_10 and 22 or 0, 15)
	elseif var_46_9 == "RUNNING" then
		var_0_76 = var_0_13(var_0_76, var_46_10 and 21 or 0, 15)
	elseif var_46_9 == "DUCK-RUNNING" then
		var_0_76 = var_0_13(var_0_76, var_46_10 and 32 or 0, 15)
	elseif var_46_9 == "AIR" then
		var_0_76 = var_0_13(var_0_76, var_46_10 and 11 or 0, 15)
	elseif var_46_9 == "DUCK" then
		var_0_76 = var_0_13(var_0_76, var_46_10 and 15 or 0, 15)
	elseif var_46_9 == "STAND" then
		var_0_76 = var_0_13(var_0_76, var_46_10 and 17 or 0, 15)
	else
		var_0_76 = var_0_13(var_0_76, var_46_10 and 26 or 0, 15)
	end

	var_0_79 = var_0_13(var_0_79, var_46_10 and 24 or 0, 15)
	var_0_77 = var_0_13(var_0_77, var_46_10 and 10 or 0, 15)
	var_0_81 = var_0_13(var_0_81, var_46_10 and 11 or 0, 15)
	var_0_78 = var_0_13(var_0_78, var_46_10 and 14 or 0, 15)
	var_0_80 = var_0_13(var_0_80, var_46_10 and 10 or 0, 15)

	local var_46_11 = var_0_32()
	local var_46_12 = globals.curtime()
	local var_46_13 = var_46_11 < 0 and "left" or "right"

	if var_46_13 ~= var_46_8 and var_46_12 - var_0_82 >= 0.058 then
		var_46_8 = var_46_13
		var_0_82 = var_46_12
	end

	local var_46_14 = to_hex_a(ui.get(var_0_40))
	local var_46_15 = var_46_8 == "left" and "\a" .. var_46_14 or "\aFFFFFFFF"
	local var_46_16 = var_46_8 == "right" and "\a" .. var_46_14 or "\aFFFFFFFF"
	local var_46_17 = var_46_15 .. "van" .. var_46_16 .. "dal°"

	renderer.text(var_46_3 + var_0_79, var_46_4 + 27, 255, 255, 255, 255, "cb", nil, var_46_17)
	renderer.text(var_46_3 + var_0_76, var_46_4 + 40, 255, 255, 255, 255, "c-", nil, var_46_9)

	local var_46_18 = 9.33

	if ui.get(ref.dt[2]) and ui.get(ref.dt[1]) then
		renderer.text(var_46_3 - 1 + var_0_80, var_46_4 + 44 + var_46_18, 255, 255, 255, 255, "c-", nil, "DT")
		renderer.circle_outline(var_46_3 + 11 + var_0_80, var_46_4 + 44.95 + var_46_18, 255, 255, 255, 255, 3, 90, smooth_exploit(), 1)

		var_46_18 = var_46_18 + 10
	elseif ui.get(ref.hs[1]) and ui.get(ref.hs[2]) then
		renderer.text(var_46_3 - 1 + var_0_81, var_46_4 + 44 + var_46_18, 255, 255, 255, 255, "c-", nil, "HS")

		var_46_18 = var_46_18 + 10
	end

	if ui.get(ref.min_damage_override[1]) and ui.get(ref.min_damage_override[2]) then
		renderer.text(var_46_3 + var_0_77, var_46_4 + 44 + var_46_18, 255, 255, 255, 255, "c-", nil, "MD")

		var_46_18 = var_46_18 + 10
	end

	if ui.get(ref.body) then
		renderer.text(var_46_3 + var_0_78, var_46_4 + 44 + var_46_18, 255, 255, 255, 255, "c-", nil, "BODY")

		local var_46_19 = var_46_18 + 10
	end
end

local var_0_84 = false
local var_0_85 = 0
local var_0_86 = 0

local function var_0_87(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4)
	if not entity.get_local_player() then
		return
	end

	local var_47_0 = math.random(0, arg_47_0 * arg_47_3 / 100)
	local var_47_1 = math.random(0, arg_47_1 * arg_47_3 / 100)

	if arg_47_4.chokedcommands == 0 and globals.tickcount() > var_0_85 + arg_47_2 then
		var_0_84 = not var_0_84
		var_0_85 = globals.tickcount()
	end

	if globals.tickcount() < var_0_85 then
		var_0_85 = globals.tickcount()
	end

	local var_47_2 = var_0_84 and arg_47_0 + var_47_0 or arg_47_1 - var_47_1

	var_0_86 = var_0_10(var_47_2, -180, 180)

	return var_0_10(var_47_2, -180, 180)
end

local var_0_88 = 0

local function var_0_89(arg_48_0, arg_48_1, arg_48_2, arg_48_3, arg_48_4)
	local var_48_0 = var_0_8.get_lp()

	if not var_48_0 or not var_0_8.is_alive(var_48_0) then
		return
	end

	if entity.get_prop(var_48_0, "m_MoveType") == 8 then
		return
	end

	if not arg_48_1 or not arg_48_2 then
		arg_48_0.allow_send_packet = true

		return
	end

	local var_48_1 = globals.chokedcommands()

	if arg_48_2 == 1 then
		if var_48_1 > 0 then
			arg_48_0.allow_send_packet = true
		else
			arg_48_0.allow_send_packet = false

			ui.set(ref.yaw[2], var_0_87(-arg_48_1 + arg_48_4, arg_48_1 - arg_48_4, arg_48_3, 0, arg_48_0))

			var_0_88 = globals.realtime()
		end
	elseif arg_48_2 == 2 then
		if var_48_1 > 0 then
			arg_48_0.allow_send_packet = true
		else
			arg_48_0.allow_send_packet = false

			ui.set(ref.yaw[2], var_0_10(arg_48_1 + arg_48_4, -180, 180))

			var_0_88 = globals.realtime()
		end
	elseif arg_48_2 == 3 then
		if var_48_1 > 0 then
			arg_48_0.allow_send_packet = true
		else
			arg_48_0.allow_send_packet = false

			ui.set(ref.yaw[2], var_0_87(-arg_48_1 + arg_48_4, arg_48_1 - arg_48_4, arg_48_3, 0, arg_48_0))

			var_0_88 = globals.realtime()
		end
	end
end

local var_0_90 = {
	max_tick_base = 0,
	is_defensive = false,
	last_valid_tick = 0,
	record_count = 0,
	smoothing_window = 3,
	ticks_count = 0,
	invalidated_ticks = {},
	tick_history = {}
}

local function var_0_91(arg_49_0)
	local var_49_0 = 0

	for iter_49_0, iter_49_1 in ipairs(arg_49_0) do
		var_49_0 = var_49_0 + iter_49_1
	end

	return #arg_49_0 > 0 and var_49_0 / #arg_49_0 or 0
end

local function var_0_92()
	var_0_90.ticks_count = 0
	var_0_90.max_tick_base = 0
	var_0_90.is_defensive = false
	var_0_90.last_valid_tick = 0
	var_0_90.record_count = 0
	var_0_90.invalidated_ticks = {}
	var_0_90.tick_history = {}
end

local function var_0_93(arg_51_0)
	local var_51_0 = entity.get_local_player()

	if not var_51_0 or not entity.is_alive(var_51_0) then
		var_0_92()

		return
	end

	local var_51_1 = globals.tickcount()
	local var_51_2 = entity.get_prop(var_51_0, "m_nTickBase") or 0
	local var_51_3 = var_51_2 < var_51_1

	if math.abs(var_51_2 - var_0_90.max_tick_base) > 64 and var_51_3 then
		var_0_92()
	end

	if var_51_2 > var_0_90.max_tick_base then
		var_0_90.max_tick_base = var_51_2

		if not var_0_90.invalidated_ticks[var_51_2] then
			var_0_90.record_count = var_0_90.record_count + 1
			var_0_90.last_valid_tick = var_51_2
		end
	elseif var_51_2 < var_0_90.max_tick_base then
		local var_51_4 = var_0_90.max_tick_base - var_51_2

		if var_51_3 and var_51_4 >= 1 and var_51_4 <= 14 then
			table.insert(var_0_90.tick_history, var_51_4)

			if #var_0_90.tick_history > var_0_90.smoothing_window then
				table.remove(var_0_90.tick_history, 1)
			end
		else
			var_0_90.tick_history = {}
		end

		var_0_90.ticks_count = var_0_91(var_0_90.tick_history)
	end

	var_0_90.is_defensive = var_0_90.ticks_count > 2 and var_0_90.ticks_count < 12

	if var_0_90.record_count >= 2 then
		var_0_90.invalidated_ticks[var_0_90.last_valid_tick] = true
		var_0_90.record_count = 0
		var_0_90.last_valid_tick = 0
		var_0_90.tick_history = {}
	end
end

local var_0_94 = {
	current_value = 0,
	increasing = true
}

local function var_0_95(arg_52_0, arg_52_1)
	if var_0_94.increasing then
		var_0_94.current_value = var_0_94.current_value + 3.33

		if arg_52_1 <= var_0_94.current_value then
			var_0_94.current_value = arg_52_1
			var_0_94.increasing = false
		end
	else
		var_0_94.current_value = var_0_94.current_value - 3.33

		if arg_52_0 >= var_0_94.current_value then
			var_0_94.current_value = arg_52_0
			var_0_94.increasing = true
		end
	end

	return var_0_94.current_value
end

local function var_0_96(arg_53_0)
	arg_53_0 = (arg_53_0 + 180) % 360

	if arg_53_0 < 0 then
		arg_53_0 = arg_53_0 + 360
	end

	return arg_53_0 - 180
end

local var_0_97 = 0
local var_0_98 = false

local function var_0_99(arg_54_0)
	var_0_25(arg_54_0)

	arg_54_0.allow_send_packet = true

	ui.set(ref.enabled, true)
	ui.set(ref.yaw_base, "At Targets")
	ui.set(ref.pitch[1], "Minimal")
	ui.set(ref.yaw[1], "180")
	ui.set(ref.yaw_jitter[1], "Off")
	ui.set(ref.freestanding_body_yaw, false)
	ui.set(ref.roll, 0)

	local var_54_0 = var_0_69(arg_54_0)
	local var_54_1 = var_0_53[var_54_0]

	if not var_54_1 or var_54_0 ~= "Global" and not ui.get(var_54_1.allow) then
		var_54_1 = var_0_53.Global
	end

	if not var_0_8.is_alive(var_0_8.get_lp()) then
		return
	end

	if globals.chokedcommands() == 0 then
		local var_54_2 = globals.tickcount()

		if var_54_2 - var_0_97 >= 2 and math.random(1, 100) <= ui.get(var_54_1.delay_c) then
			var_0_98 = not var_0_98
			var_0_97 = var_54_2
		end
	end

	if ui.get(var_54_1.yaw_select) == "Static" then
		ui.set(ref.yaw[2], ui.get(var_54_1.static_yaw))
	elseif ui.get(var_54_1.yaw_select) == "L/R" and ui.get(var_54_1.delay) == "Off" then
		ui.set(ref.yaw[2], var_0_87(ui.get(var_54_1.l_yaw), ui.get(var_54_1.r_yaw), 0, 0, arg_54_0))
	elseif ui.get(var_54_1.yaw_select) == "L/R" and ui.get(var_54_1.delay) == "Tickbased" then
		ui.set(ref.yaw[2], var_0_87(ui.get(var_54_1.l_yaw), ui.get(var_54_1.r_yaw), ui.get(var_54_1.delay_t), 0, arg_54_0))
	elseif ui.get(var_54_1.yaw_select) == "L/R" and ui.get(var_54_1.delay) == "Chance" then
		ui.set(ref.yaw[2], var_0_98 == true and ui.get(var_54_1.l_yaw) or ui.get(var_54_1.r_yaw))
	end

	ui.set(ref.yaw_jitter[1], ui.get(var_54_1.yaw_jitter))
	ui.set(ref.yaw_jitter[2], ui.get(var_54_1.yaw_jitter_value))
	ui.set(ref.body_yaw[1], "Static")

	local var_54_3 = ui.get(var_54_1.body_yaw)
	local var_54_4 = ui.get(var_54_1.delay)
	local var_54_5 = ui.get(var_54_1.body_yaw_value)

	ui.set(ref.body_yaw[1], "Static")

	local var_54_6 = ui.get(var_54_1.body_yaw)
	local var_54_7 = ui.get(var_54_1.delay)
	local var_54_8 = ui.get(var_54_1.body_yaw_value)

	if math.max(1, var_0_24) <= 1 then
		ui.set(ref.body_yaw[2], 0)

		if var_54_6 == "Static" then
			var_0_89(arg_54_0, -var_54_8, 2, 1, 0)
		elseif var_54_6 == "Jitter" then
			if var_54_7 == "Off" then
				var_0_89(arg_54_0, -var_54_8, 1, 0, var_0_86)
			elseif var_54_7 == "Tickbased" then
				var_0_89(arg_54_0, -var_54_8, 1, ui.get(var_54_1.delay_t), var_0_86)
			elseif var_54_7 == "Chance" then
				local var_54_9 = var_0_98 and var_54_8 or -var_54_8

				var_0_89(arg_54_0, var_54_9, 2, 1, var_0_86)
			end
		end
	elseif var_54_6 == "Static" then
		ui.set(ref.body_yaw[2], var_54_8)
	elseif var_54_6 == "Jitter" then
		if var_54_7 == "Tickbased" then
			ui.set(ref.body_yaw[2], var_0_87(-var_54_8, var_54_8, ui.get(var_54_1.delay_t), 0, arg_54_0))
		elseif var_54_7 == "Chance" then
			local var_54_10 = var_0_98 and -var_54_8 or var_54_8

			ui.set(ref.body_yaw[2], var_54_10)
		elseif var_54_7 == "Off" then
			ui.set(ref.body_yaw[2], var_0_87(-var_54_8, var_54_8, 0, 0, arg_54_0))
		end
	end

	if ui.get(var_54_1.break_lc) then
		arg_54_0.force_defensive = true
	else
		arg_54_0.force_defensive = false
	end

	if var_0_90.is_defensive and ui.get(var_54_1.defensive_aa) then
		ui.set(ref.yaw_jitter[1], "Off")

		if ui.get(var_54_1.defensive_pitch) == "Static" then
			ui.set(ref.pitch[1], "Custom")
			ui.set(ref.pitch[2], ui.get(var_54_1.defensive_pitch_static))
		elseif ui.get(var_54_1.defensive_pitch) == "Jitter" then
			ui.set(ref.pitch[1], "Custom")
			ui.set(ref.pitch[2], var_0_87(ui.get(var_54_1.defensive_pitch_static), ui.get(var_54_1.defensive_pitch_2), ui.get(var_54_1.defensive_pitch_delay), 0, arg_54_0))
		elseif ui.get(var_54_1.defensive_pitch) == "Random" then
			ui.set(ref.pitch[1], "Custom")
			ui.set(ref.pitch[2], math.random(ui.get(var_54_1.defensive_pitch_static), ui.get(var_54_1.defensive_pitch_2)))
		elseif ui.get(var_54_1.defensive_pitch) == "Sway" then
			ui.set(ref.pitch[1], "Custom")
			ui.set(ref.pitch[2], var_0_95(ui.get(var_54_1.defensive_pitch_static), ui.get(var_54_1.defensive_pitch_2)))
		end

		if ui.get(var_54_1.defensive_yaw) == "Static" then
			ui.set(ref.yaw[2], ui.get(var_54_1.defensive_yaw_static))
		elseif ui.get(var_54_1.defensive_yaw) == "Jitter" then
			ui.set(ref.yaw[2], var_0_87(ui.get(var_54_1.defensive_yaw_static), ui.get(var_54_1.defensive_yaw_2), ui.get(var_54_1.defensive_yaw_delay), 0, arg_54_0))
		elseif ui.get(var_54_1.defensive_yaw) == "Random" then
			ui.set(ref.yaw[2], math.random(ui.get(var_54_1.defensive_yaw_static), ui.get(var_54_1.defensive_yaw_2)))
		elseif ui.get(var_54_1.defensive_yaw) == "Spin" then
			ui.set(ref.yaw[2], -var_0_96(globals.curtime() * (ui.get(var_54_1.defensive_yaw_spin) * 10)))
		end
	end

	if var_0_90.is_defensive and ui.get(var_54_1.defensive_aa) then
		var_0_89(arg_54_0, math.random(-60, 60), 1, 1, 0)
		ui.set(ref.body_yaw[1], "Static")
	end

	if ui.get(var_0_64) then
		ui.set(ref.edge_yaw, true)
	else
		ui.set(ref.edge_yaw, false)
	end
end

local function var_0_100(arg_55_0)
	local var_55_0 = var_0_8.get_lp()

	if not var_55_0 or not var_0_8.is_alive(var_55_0) then
		return
	end

	if var_0_69(arg_55_0) ~= "Air-Duck" then
		return
	end

	local var_55_1 = entity.get_prop(var_55_0, "m_hActiveWeapon")

	if not var_55_1 or entity.get_classname(var_55_1) ~= "CKnife" then
		return
	end

	if not var_0_14(ui.get(var_0_60), "Knife") then
		return
	end

	ui.set(ref.yaw[1], "180")
	ui.set(ref.yaw[2], 0)
	ui.set(ref.body_yaw[2], -60)
	ui.set(ref.pitch[2], 89)
	ui.set(ref.yaw_jitter[1], "Off")
end

local function var_0_101(arg_56_0)
	local var_56_0 = var_0_8.get_lp()

	if not var_56_0 or not var_0_8.is_alive(var_56_0) then
		return
	end

	if var_0_69(arg_56_0) ~= "Air-Duck" then
		return
	end

	local var_56_1 = entity.get_prop(var_56_0, "m_hActiveWeapon")

	if not var_56_1 or entity.get_classname(var_56_1) ~= "CWeaponTaser" then
		return
	end

	if not var_0_14(ui.get(var_0_60), "Zeus") then
		return
	end

	ui.set(ref.yaw[1], "180")
	ui.set(ref.yaw[2], 0)
	ui.set(ref.body_yaw[2], -60)
	ui.set(ref.pitch[2], 89)
	ui.set(ref.yaw_jitter[1], "Off")
end

local var_0_102 = 0
local var_0_103 = 0
local var_0_104 = {
	{
		value = -90,
		keyFunc = function()
			return ui.get(var_0_62)
		end
	},
	{
		value = 90,
		keyFunc = function()
			return ui.get(var_0_63)
		end
	}
}

local function var_0_105(arg_59_0)
	local var_59_0 = globals.curtime()

	for iter_59_0, iter_59_1 in ipairs(var_0_104) do
		if iter_59_1.keyFunc() and var_59_0 > var_0_103 + 0.13 then
			var_0_102 = var_0_102 == iter_59_1.value and 0 or iter_59_1.value
			var_0_103 = var_59_0

			break
		end
	end

	if var_59_0 < var_0_103 then
		var_0_103 = var_59_0
	end

	if var_0_102 == 90 then
		ui.set(ref.pitch[1], "Down")
		ui.set(ref.yaw_base, "Local view")
		ui.set(ref.yaw[1], "180")
		ui.set(ref.yaw[2], 90)
		var_0_89(arg_59_0, math.abs(var_0_102 * 2), 2, 1, 0)
		ui.set(ref.yaw_jitter[1], "Off")

		arg_59_0.force_defensive = false
	elseif var_0_102 == -90 then
		ui.set(ref.pitch[1], "Down")
		ui.set(ref.yaw_base, "Local view")
		ui.set(ref.yaw[1], "180")
		ui.set(ref.yaw[2], -90)
		var_0_89(arg_59_0, 0, 2, 1, 1)
		ui.set(ref.yaw_jitter[1], "Off")

		arg_59_0.force_defensive = false
	end
end

local function var_0_106()
	if var_0_102 ~= 0 then
		return
	end

	if ui.get(var_0_61) then
		ui.set(ref.freestand[1], true)
		ui.set(ref.freestand[2], "Always On")
	else
		ui.set(ref.freestand[1], false)
		ui.set(ref.freestand[2], "On Hotkey")
	end
end

local function var_0_107()
	if not ui.get(var_0_59) then
		return
	end

	local var_61_0 = var_0_8.get_lp()

	if not var_61_0 or not var_0_8.is_alive(var_61_0) then
		return
	end

	local var_61_1 = var_0_1(entity.get_origin(var_61_0))
	local var_61_2 = entity.get_players(true)

	for iter_61_0 = 1, #var_61_2 do
		local var_61_3 = var_61_2[iter_61_0]
		local var_61_4 = entity.get_player_weapon(var_61_3)

		if var_61_4 and entity.get_classname(var_61_4) == "CKnife" and var_0_1(entity.get_origin(var_61_3)):dist2d(var_61_1) < 250 then
			ui.set(ref.yaw[1], "180")
			ui.set(ref.yaw[2], 180)

			return
		end
	end
end

local var_0_108 = globals.tickcount()
local var_0_109 = 11

local function var_0_110()
	if not ui.get(var_0_49) then
		return
	end

	local var_62_0 = var_0_8.get_lp()

	if not var_0_8.is_alive(var_62_0) then
		return
	end

	local var_62_1 = entity.get_player_weapon(var_62_0)

	if not var_62_1 then
		return
	end

	var_0_109 = var_0_3(var_62_1).is_revolver and 18 or 6

	if ui.get(ref.dt[2]) or ui.get(ref.hs[2]) then
		if globals.tickcount() >= var_0_108 + var_0_109 then
			ui.set(ref.aimbot, true)
		else
			ui.set(ref.aimbot, false)
		end
	else
		var_0_108 = globals.tickcount()

		ui.set(ref.aimbot, true)
	end
end

local function var_0_111()
	local var_63_0 = {
		center_indicators = ui.get(var_0_39),
		color = {
			ui.get(var_0_40)
		},
		hit_logs = ui.get(var_0_41),
		hit_logs_color = {
			ui.get(var_0_42)
		},
		recharge_fix = ui.get(var_0_49),
		console_filter = ui.get(var_0_50),
		state = ui.get(var_0_55),
		aa = {}
	}

	for iter_63_0, iter_63_1 in pairs(var_0_53) do
		var_63_0.aa[iter_63_0] = {}

		for iter_63_2, iter_63_3 in pairs(iter_63_1) do
			var_63_0.aa[iter_63_0][iter_63_2] = ui.get(iter_63_3)
		end
	end

	var_63_0.backstab = ui.get(var_0_59)
	var_63_0.safehead = ui.get(var_0_60)
	var_63_0.freestand = ui.get(var_0_61)
	var_63_0.manual_l = ui.get(var_0_62)
	var_63_0.manual_r = ui.get(var_0_63)

	local var_63_1 = var_0_6.encode(var_0_5.stringify(var_63_0))

	var_0_4.set(var_63_1)
	print("exported")
end

local function var_0_112(arg_64_0)
	local var_64_0, var_64_1 = pcall(var_0_6.decode, arg_64_0 or var_0_4.get())

	if not var_64_0 then
		print("decode error")

		return
	end

	local var_64_2, var_64_3 = pcall(var_0_5.parse, var_64_1)

	if not var_64_2 or type(var_64_3) ~= "table" then
		print("json parse error")

		return
	end

	if var_64_3.center_indicators ~= nil then
		ui.set(var_0_39, var_64_3.center_indicators)
	end

	if var_64_3.color ~= nil then
		ui.set(var_0_40, unpack(var_64_3.color))
	end

	if var_64_3.hit_logs ~= nil then
		ui.set(var_0_41, var_64_3.hit_logs)
	end

	if var_64_3.hit_logs_color ~= nil then
		ui.set(var_0_42, unpack(var_64_3.hit_logs_color))
	end

	if var_64_3.recharge_fix ~= nil then
		ui.set(var_0_49, var_64_3.recharge_fix)
	end

	if var_64_3.console_filter ~= nil then
		ui.set(var_0_50, var_64_3.console_filter)
	end

	if var_64_3.state ~= nil then
		ui.set(var_0_55, var_64_3.state)
	end

	if var_64_3.aa ~= nil then
		for iter_64_0, iter_64_1 in pairs(var_0_53) do
			if var_64_3.aa[iter_64_0] ~= nil then
				for iter_64_2, iter_64_3 in pairs(iter_64_1) do
					local var_64_4 = var_64_3.aa[iter_64_0][iter_64_2]

					if var_64_4 ~= nil then
						ui.set(iter_64_3, var_64_4)
					end
				end
			end
		end
	end

	if var_64_3.backstab ~= nil then
		ui.set(var_0_59, var_64_3.backstab)
	end

	if var_64_3.safehead ~= nil then
		ui.set(var_0_60, var_64_3.safehead)
	end

	if var_64_3.freestand ~= nil then
		ui.set(var_0_61, var_64_3.freestand)
	end

	if var_64_3.manual_l ~= nil then
		ui.set(var_0_62, var_64_3.manual_l)
	end

	if var_64_3.manual_r ~= nil then
		ui.set(var_0_63, var_64_3.manual_r)
	end

	print("imported")
end

local var_0_113 = ui.new_button("AA", "Anti-Aimbot angles", "Export Config", function()
	var_0_111()
end)
local var_0_114 = ui.new_button("AA", "Anti-Aimbot angles", "Import Config", function()
	var_0_112()
end)

local function var_0_115()
	ui.set_visible(var_0_113, var_0_33 == 5)
	ui.set_visible(var_0_114, var_0_33 == 5)
end

local function var_0_116()
	local var_68_0 = {
		ref.enabled,
		ref.pitch[1],
		ref.pitch[2],
		ref.yaw_base,
		ref.yaw[1],
		ref.yaw[2],
		ref.yaw_jitter[1],
		ref.yaw_jitter[2],
		ref.body_yaw[1],
		ref.body_yaw[2],
		ref.freestanding_body_yaw,
		ref.edge_yaw,
		ref.freestand[1],
		ref.freestand[2],
		ref.roll
	}

	for iter_68_0, iter_68_1 in ipairs(var_68_0) do
		ui.set_visible(iter_68_1, false)
	end
end

local function var_0_117()
	local var_69_0 = {
		ref.enabled,
		ref.pitch[1],
		ref.pitch[2],
		ref.yaw_base,
		ref.yaw[1],
		ref.yaw[2],
		ref.yaw_jitter[1],
		ref.yaw_jitter[2],
		ref.body_yaw[1],
		ref.body_yaw[2],
		ref.freestanding_body_yaw,
		ref.edge_yaw,
		ref.freestand[1],
		ref.freestand[2],
		ref.roll,
		ref.fakelag_limit,
		ref.variability,
		ref.falelag_enabled[1],
		ref.falelag_enabled[2],
		ref.fakelag_amount
	}

	for iter_69_0, iter_69_1 in ipairs(var_69_0) do
		ui.set_visible(iter_69_1, true)
	end
end

local function var_0_118()
	local var_70_0 = {
		ref.fakelag_limit,
		ref.variability,
		ref.falelag_enabled[1],
		ref.falelag_enabled[2],
		ref.fakelag_amount
	}

	for iter_70_0, iter_70_1 in ipairs(var_70_0) do
		ui.set_visible(iter_70_1, var_0_33 == 2)
	end
end

local var_0_119 = 0
local var_0_120 = {
	"generic",
	"head",
	"chest",
	"stomach",
	"left arm",
	"right arm",
	"left leg",
	"right leg",
	"neck",
	"?",
	"gear"
}
local var_0_121 = {}

local function var_0_122(arg_71_0)
	local var_71_0 = {}

	if arg_71_0.teleported then
		table.insert(var_71_0, "LC")
	end

	if arg_71_0.interpolated then
		table.insert(var_71_0, "I")
	end

	if arg_71_0.extrapolated then
		table.insert(var_71_0, "EX")
	end

	if arg_71_0.high_priority then
		table.insert(var_71_0, "HP")
	end

	var_0_121[arg_71_0.id] = {
		tick = arg_71_0.tick,
		predicted_damage = arg_71_0.damage,
		hit_chance = arg_71_0.hit_chance,
		backtrack_ticks = globals.tickcount() - arg_71_0.tick,
		flags = #var_71_0 > 0 and table.concat(var_71_0) or nil
	}
end

local function var_0_123(arg_72_0)
	if arg_72_0.hitgroup == 1 and entity.get_prop(arg_72_0.target, "m_iHealth") <= 0 then
		var_0_119 = var_0_119 + 1
	end

	if not ui.get(var_0_41) then
		return
	end

	local var_72_0 = var_0_120[arg_72_0.hitgroup + 1] or "?"
	local var_72_1 = var_0_121[arg_72_0.id]
	local var_72_2 = var_72_1 and var_72_1.backtrack_ticks or 0
	local var_72_3 = var_72_1 and var_72_1.predicted_damage or arg_72_0.damage
	local var_72_4 = var_72_3 ~= arg_72_0.damage and string.format("%d (%d)", arg_72_0.damage, var_72_3) or tostring(arg_72_0.damage)
	local var_72_5 = var_72_1 and var_72_1.hit_chance or "?"
	local var_72_6 = var_72_1 and var_72_1.flags and string.format(", Flags: [%s]", var_72_1.flags) or ""

	var_0_20(string.format("Registered shot in %s's %s for %s dmg (hc: %d%%, bt: %d%s)", entity.get_player_name(arg_72_0.target), var_72_0, var_72_4, var_72_5, var_72_2, var_72_6), 3, ui.get(var_0_42))
	print(string.format("Registered shot in %s's %s for %s dmg (hc: %d%%, bt: %d%s)", entity.get_player_name(arg_72_0.target), var_72_0, var_72_4, var_72_5, var_72_2, var_72_6))

	var_0_121[arg_72_0.id] = nil
end

local function var_0_124(arg_73_0)
	if not ui.get(var_0_41) then
		return
	end

	local var_73_0 = var_0_120[arg_73_0.hitgroup + 1] or "?"
	local var_73_1 = var_0_121[arg_73_0.id]
	local var_73_2 = var_73_1 and var_73_1.backtrack_ticks or 0
	local var_73_3 = var_73_1 and var_73_1.hit_chance or "?"
	local var_73_4 = var_73_1 and var_73_1.predicted_damage or "?"
	local var_73_5 = var_73_1 and var_73_1.flags and string.format(", Flags: [%s]", var_73_1.flags) or ""

	var_0_20(string.format("Missed shot in %s's %s due to %s (%s dmg, hc: %d%%, bt: %d%s)", entity.get_player_name(arg_73_0.target), var_73_0, arg_73_0.reason, var_73_4, var_73_3, var_73_2, var_73_5), 3, ui.get(var_0_42))
	print(string.format("Missed shot in %s's %s due to %s (%s dmg, hc: %d%%, bt: %d%s)", entity.get_player_name(arg_73_0.target), var_73_0, arg_73_0.reason, var_73_4, var_73_3, var_73_2, var_73_5))

	var_0_121[arg_73_0.id] = nil
end

local function var_0_125()
	if ui.get(var_0_50) then
		cvar.con_filter_enable:set_int(1)
		cvar.con_filter_text:set_string("IrWL5106TZZKNFPz4P4Gl3pSN?J370f5hi373ZjPg%VOVh6lN")
	else
		cvar.con_filter_enable:set_int(0)
		cvar.con_filter_text:set_string("")
	end
end

ui.set_callback(var_0_50, var_0_125)

local function var_0_126()
	if not var_0_14(ui.get(var_0_43), "Watermark") then
		return
	end

	local var_75_0 = ui.get(var_0_44)
	local var_75_1, var_75_2 = client.screen_size()
	local var_75_3 = math.floor(client.latency() * 1000 + 0.5)
	local var_75_4 = string.format("VandalHook | rtt: %dms | VandalTaps: %d", var_75_3, var_0_119)
	local var_75_5 = 18
	local var_75_6 = 4
	local var_75_7
	local var_75_8, var_75_9 = renderer.measure_text(var_75_7, var_75_4)
	local var_75_10
	local var_75_11

	if var_75_0 == "Right upper" then
		var_75_10 = var_75_1 - var_75_8 - var_75_5
		var_75_11 = var_75_5
	elseif var_75_0 == "Left upper" then
		var_75_10 = var_75_5
		var_75_11 = var_75_5
	elseif var_75_0 == "Down centered" then
		var_75_10 = (var_75_1 - var_75_8) / 2
		var_75_11 = var_75_2 - var_75_9 - var_75_5
	else
		var_75_10 = var_75_1 - var_75_8 - var_75_5
		var_75_11 = var_75_5
	end

	renderer.rectangle(var_75_10 - var_75_6, var_75_11 - var_75_6, var_75_8 + var_75_6 * 2, var_75_9 + var_75_6 * 2, 240, 110, 140, 130)
	renderer.text(var_75_10, var_75_11, 244, 188, 203, 255, var_75_7, 0, var_75_4)
end

local var_0_127 = 0

local function var_0_128()
	local var_76_0 = var_0_8.get_lp()

	if not var_76_0 or not var_0_8.is_alive(var_76_0) then
		return
	end

	if not ui.get(var_0_45) then
		return
	end

	ui.set(ref.scope_overlay, false)

	local var_76_1 = entity.get_local_player()

	if var_76_1 == nil then
		return
	end

	local var_76_2, var_76_3 = client.screen_size()
	local var_76_4 = ui.get(var_0_47) * var_76_3 / 1080
	local var_76_5 = 5 * var_76_3 / 1080
	local var_76_6 = entity.get_prop(var_76_1, "m_bIsScoped") == 1 and entity.get_prop(var_76_1, "m_bResumeZoom") == 0

	if ui.get(var_0_48) then
		var_0_127 = 1
	else
		var_0_127 = var_0_12(var_0_127, var_76_6 and 1 or 0, 10 * globals.frametime())
	end

	if var_0_127 < 0.01 then
		return
	end

	if ui.get(var_0_48) and not var_76_6 then
		return
	end

	local var_76_7 = var_76_4 * var_0_127
	local var_76_8 = 10 * var_0_127
	local var_76_9 = {
		ui.get(var_0_46)
	}
	local var_76_10 = {
		var_76_9[1],
		var_76_9[2],
		var_76_9[3],
		0
	}
	local var_76_11 = {
		var_76_9[1],
		var_76_9[2],
		var_76_9[3],
		var_76_9[4] * var_0_127
	}

	renderer.gradient(var_76_2 / 2, var_76_3 / 2 - var_76_8 - var_76_7, 1, var_76_7, var_76_10[1], var_76_10[2], var_76_10[3], var_76_10[4], var_76_11[1], var_76_11[2], var_76_11[3], var_76_11[4], false)
	renderer.gradient(var_76_2 / 2, var_76_3 / 2 + var_76_8, 1, var_76_7, var_76_11[1], var_76_11[2], var_76_11[3], var_76_11[4], var_76_10[1], var_76_10[2], var_76_10[3], var_76_10[4], false)
	renderer.gradient(var_76_2 / 2 - var_76_8 - var_76_7, var_76_3 / 2, var_76_7, 1, var_76_10[1], var_76_10[2], var_76_10[3], var_76_10[4], var_76_11[1], var_76_11[2], var_76_11[3], var_76_11[4], true)
	renderer.gradient(var_76_2 / 2 + var_76_8, var_76_3 / 2, var_76_7, 1, var_76_11[1], var_76_11[2], var_76_11[3], var_76_11[4], var_76_10[1], var_76_10[2], var_76_10[3], var_76_10[4], true)
	ui.set_visible(ref.scope_overlay, true)
end

local var_0_129 = 0

local function var_0_130()
	local var_77_0 = var_0_8.get_lp()

	if not var_77_0 or not var_0_8.is_alive(var_77_0) then
		return
	end

	local var_77_1, var_77_2 = client.screen_size()

	if var_0_102 == 0 then
		return
	end

	local var_77_3 = var_0_8.isScoped(var_77_0)

	var_0_129 = var_0_13(var_0_129, var_77_3 and 22 or 0, 15)

	if var_0_102 == -90 then
		renderer.text(var_77_1 / 2 - 40, var_77_2 / 2 - 2 - var_0_129, 255, 255, 255, 255, "cb+", 0, "<")
	elseif var_0_102 == 90 then
		renderer.text(var_77_1 / 2 + 40, var_77_2 / 2 - 2 - var_0_129, 255, 255, 255, 255, "cb+", 0, ">")
	end
end

local function var_0_131()
	cvar.mp_teammates_are_enemies:set_int(ui.get(var_0_51) and 1 or 0)
end

var_0_131()
ui.set_callback(var_0_51, function()
	var_0_131()
end)
client.set_event_callback("shutdown", function()
	var_0_117()
	cvar.con_filter_enable:set_int(0)
	cvar.con_filter_text:set_string("")
	cvar.mp_teammates_are_enemies:set_int(0)
end)
client.set_event_callback("aim_miss", var_0_124)
client.set_event_callback("aim_hit", var_0_123)
client.set_event_callback("aim_fire", var_0_122)
client.set_event_callback("pre_render", function()
	var_0_116()
	var_0_68()
	var_0_58()
	var_0_115()
	var_0_118()
end)
client.set_event_callback("setup_command", function(arg_82_0)
	var_0_71(arg_82_0)
	var_0_99(arg_82_0)
	var_0_100(arg_82_0)
	var_0_101(arg_82_0)
	var_0_106()
	var_0_105(arg_82_0)
	var_0_107()
	var_0_110()
end)
client.set_event_callback("paint", function()
	var_0_83()
	var_0_126()
	var_0_128()
	var_0_130()

	local var_83_0 = entity.get_local_player()

	if not entity.is_alive(var_83_0) then
		var_0_102 = 0

		return
	end
end)
client.set_event_callback("level_init", function()
	var_0_108 = globals.tickcount()
end)
client.set_event_callback("paint_ui", function()
	render_logs()
	ui.set(ui.reference("VISUALS", "Effects", "Remove scope overlay"), true)
end)
client.set_event_callback("run_command", function(arg_86_0)
	var_0_9.run_command(arg_86_0)
end)
client.set_event_callback("predict_command", function(arg_87_0)
	var_0_93(arg_87_0)
end)


