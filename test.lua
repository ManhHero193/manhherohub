-- Module to convert shorthand numbers to full numbers
local module_upvr = {}
local tbl_upvr = {"", 'K', 'M', 'B', 'T', "Qa", "Qi", "Sx", "Sp", "Oc", "No", "Dc", "Ud", "Dd", "Td", "Qad", "Qid", "Sxd", "Spd", "Ocd", "Nod", "Vg", "Uvg", "Dvg", "Tvg", "Qavg", "Qivg", "Sxvg", "Spvg", "Ocvg", "Nov", "Tt", "Unt", "Dtt", "Ttt", "Qut", "Qat", "Sst", "Spt", "Oct", "Nvt", "Qdt", "Qqt", "Sxt", "Sgt", "Oi", "Noi", 'C', "Uc", "Dc", "Udc", "Vc", "Uvc", "Tc", "Qac", "Qic", "Sxc", "Spc", "Oc", "Nc", "Duc", "Trc", "Qat", "Qit", "Ssc", "Stt", "Ott", "Ngt", "Mn"}

function module_upvr.ToLuaNumber(arg1)
	return arg1.val * math.max(1000 ^ arg1.e, 1)
end

function module_upvr.FromString(input)
	local number = tonumber(string.match(input, "[%d%.]+")) or 0
	local suffix = string.match(input, "[%a]+") or ""
	local e = 0
	for i, v in ipairs(tbl_upvr) do
		if v == suffix then
			e = i - 1
			break
		end
	end
	return module_upvr.ToLuaNumber({ val = number, e = e })
end

function module_upvr.Equals(a, b)
	return math.floor(module_upvr.ToLuaNumber(a)) == math.floor(module_upvr.ToLuaNumber(b))
end

function module_upvr.FromName(name)
	local num = tonumber(name:match("[.%d]+")) or 0
	local suf = name:match("%a+") or ""
	local e = 0
	for i, v in ipairs(tbl_upvr) do
		if v == suf then
			e = i - 1
			break
		end
	end
	return { val = num, e = e }
end

return module_upvr
