local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game.CoreGui

local startup = Instance.new("Frame")
startup.Name = "startup"
startup.Size = UDim2.new(0.00, 399.00, 0.00, 255.00)
startup.BorderColor3 = Color3.new(0.00, 0.00, 0.00)
startup.Position = UDim2.new(0.30, 0.00, 0.28, 0.00)
startup.BorderSizePixel = 0
startup.BackgroundColor3 = Color3.new(0.00, 0.65, 1.00)
startup.Parent = ScreenGui

local startupSound = Instance.new("Sound")
startupSound.Name = "startupSound"
startupSound.Volume = 0.41600000858306885
startupSound.SoundId = "rbxassetid://6234792983"
startupSound.Parent = startup

local TextLabel = Instance.new("TextLabel")
TextLabel.TextWrapped = true
TextLabel.ZIndex = 2
TextLabel.BorderSizePixel = 0
TextLabel.TextScaled = true
TextLabel.BackgroundColor3 = Color3.new(1.00, 1.00, 1.00)
TextLabel.FontFace = Font.new("rbxassetid://12187607722", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel.TextSize = 14
TextLabel.Size = UDim2.new(0.00, 114.00, 0.00, 51.00)
TextLabel.BorderColor3 = Color3.new(0.00, 0.00, 0.00)
TextLabel.Text = "ReSpy"
TextLabel.TextColor3 = Color3.new(1.00, 1.00, 1.00)
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(0.08, 0.00, 0.10, 0.00)
TextLabel.Parent = startup

local TextLabel_1 = Instance.new("TextLabel")
TextLabel_1.TextWrapped = true
TextLabel_1.ZIndex = 2
TextLabel_1.BorderSizePixel = 0
TextLabel_1.TextScaled = true
TextLabel_1.BackgroundColor3 = Color3.new(1.00, 1.00, 1.00)
TextLabel_1.FontFace = Font.new("rbxassetid://12187607722", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel_1.TextSize = 14
TextLabel_1.Size = UDim2.new(0.00, 112.00, 0.00, 27.00)
TextLabel_1.BorderColor3 = Color3.new(0.00, 0.00, 0.00)
TextLabel_1.Text = "Made by blocky"
TextLabel_1.TextColor3 = Color3.new(1.00, 1.00, 1.00)
TextLabel_1.BackgroundTransparency = 1
TextLabel_1.Position = UDim2.new(0.70, 0.00, -0.00, 0.00)
TextLabel_1.Parent = startup

local TextBox = Instance.new("TextBox")
TextBox.TextWrapped = true
TextBox.BorderSizePixel = 0
TextBox.TextScaled = true
TextBox.BackgroundColor3 = Color3.new(1.00, 1.00, 1.00)
TextBox.FontFace = Font.new("rbxassetid://12187607722", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextBox.TextSize = 14
TextBox.Size = UDim2.new(0.00, 112.00, 0.00, 22.00)
TextBox.TextColor3 = Color3.new(1.00, 1.00, 1.00)
TextBox.BorderColor3 = Color3.new(0.00, 0.00, 0.00)
TextBox.Text = "@LenkaToJaMarcel"
TextBox.BackgroundTransparency = 1
TextBox.Position = UDim2.new(0.70, 0.00, 0.11, 0.00)
TextBox.Parent = startup

local FetchingLabel = Instance.new("TextLabel")
FetchingLabel.Name = "FetchingLabel"
FetchingLabel.TextWrapped = true
FetchingLabel.ZIndex = 2
FetchingLabel.BorderSizePixel = 0
FetchingLabel.TextScaled = true
FetchingLabel.BackgroundColor3 = Color3.new(1.00, 1.00, 1.00)
FetchingLabel.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
FetchingLabel.TextSize = 14
FetchingLabel.Size = UDim2.new(0.00, 246.00, 0.00, 26.00)
FetchingLabel.BorderColor3 = Color3.new(0.00, 0.00, 0.00)
FetchingLabel.Text = "Fetching ui..."
FetchingLabel.TextColor3 = Color3.new(1.00, 1.00, 1.00)
FetchingLabel.BackgroundTransparency = 1
FetchingLabel.Position = UDim2.new(0.16, 0.00, 0.66, 0.00)
FetchingLabel.Parent = startup

local Triangle = Instance.new("ImageLabel")
Triangle.Name = "Triangle"
Triangle.BorderSizePixel = 0
Triangle.BackgroundColor3 = Color3.new(1.00, 1.00, 1.00)
Triangle.ResampleMode = Enum.ResamplerMode.Pixelated
Triangle.Image = "rbxassetid://72347631060943"
Triangle.Size = UDim2.new(0.00, 166.00, 0.00, 255.00)
Triangle.BorderColor3 = Color3.new(0.00, 0.00, 0.00)
Triangle.BackgroundTransparency = 1
Triangle.Parent = startup

local function run()
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local TextChatService = game:GetService("TextChatService")
	local UserInputService = game:GetService("UserInputService")
	local player = Players.LocalPlayer
	local playerGui = game.CoreGui
	local function trim(s) return s:match("^%s*(.-)%s*$") end
	local function pretty(v, depth)
		depth = depth or 0
		local t = typeof(v)
		if t == "string" then return '"' .. v .. '"' end
		if t == "number" or t == "boolean" or v == nil then return tostring(v) end
		if t == "table" then
			if depth > 4 then return "{...}" end
			local parts = {}
			for k,val in pairs(v) do
				table.insert(parts, string.rep("  ", depth+1) .. "["..pretty(k,depth+1).."] = "..pretty(val,depth+1))
			end
			return "{\n"..table.concat(parts,",\n").."\n"..string.rep("  ",depth).."}"
		end
		return "<"..t..">"
	end
	local function resolvePath(path)
		local parts = {}
		for part in path:gmatch("[^%.]+") do
			table.insert(parts, part)
		end
		local current = game
		for _, part in ipairs(parts) do
			if typeof(current) == "Instance" and current:FindFirstChild(part) then
				current = current[part]
			elseif current[part] ~= nil then
				current = current[part]
			else
				return nil
			end
		end
		return current
	end
	local function parseSpecial(tok)
		tok = trim(tok)
		if tok:match("^Enum%.") then
			local success, result = pcall(function()
				local parts = {}
				for part in tok:gmatch("[^%.]+") do
					table.insert(parts, part)
				end
				local e = Enum[parts[2]]
				return e[parts[3]]
			end)
			if success then return result end
		end
		local vx, vy, vz = tok:match("^Vector3%.new%(([^,]+),([^,]+),([^,]+)%)$")
		if vx and vy and vz then
			return Vector3.new(tonumber(vx), tonumber(vy), tonumber(vz))
		end
		local cx, cy, cz = tok:match("^CFrame%.new%(([^,]+),([^,]+),([^,]+)%)$")
		if cx and cy and cz then
			return CFrame.new(tonumber(cx), tonumber(cy), tonumber(cz))
		end
		local r, g, b = tok:match("^Color3%.fromRGB%(([^,]+),([^,]+),([^,]+)%)$")
		if r and g and b then
			return Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
		end
		local xscale, xoffset, yscale, yoffset = tok:match("^UDim2%.new%(([^,]+),([^,]+),([^,]+),([^,]+)%)$")
		if xscale and xoffset and yscale and yoffset then
			return UDim2.new(tonumber(xscale), tonumber(xoffset), tonumber(yscale), tonumber(yoffset))
		end
		return nil
	end
	local function parseToken(tok)
		tok = trim(tok)
		if tok == "" then return nil end
		local s = tok:match('^"(.*)"$') or tok:match("^'(.*)'$")
		if s then return s end
		if tok == "true" then return true end
		if tok == "false" then return false end
		if tok == "nil" then return nil end
		local n = tonumber(tok)
		if n then return n end
		local special = parseSpecial(tok)
		if special then return special end
		local inst = resolvePath(tok)
		if inst then return inst end
		return tok
	end
	local function parseArgs(csv)
		csv = tostring(csv or "")
		if csv == "" then return {} end
		local out, cur, inQuotes, quoteChar = {}, "", false, nil
		for i = 1, #csv do
			local c = csv:sub(i,i)
			if (c == '"' or c == "'") and not inQuotes then
				inQuotes = true
				quoteChar = c
				cur ..= c
			elseif c == quoteChar and inQuotes then
				inQuotes = false
				quoteChar = nil
				cur ..= c
			elseif c == "," and not inQuotes then
				table.insert(out, parseToken(cur))
				cur = ""
			else
				cur ..= c
			end
		end
		if cur ~= "" then
			table.insert(out, parseToken(cur))
		end
		return out
	end
	local function safeGetDescendants(parent)
		local ok, descendants = pcall(function() return parent:GetDescendants() end)
		return ok and descendants or {}
	end
	local function collectRemotes()
		local remotes = {}
		local services = {ReplicatedStorage, Players, playerGui, TextChatService}
		for _, svc in ipairs(services) do
			for _, inst in ipairs(safeGetDescendants(svc)) do
				if inst:IsA("RemoteEvent") or inst:IsA("RemoteFunction") then
					table.insert(remotes, inst)
				end
			end
		end
		table.sort(remotes, function(a,b) return a:GetFullName() < b:GetFullName() end)
		return remotes
	end
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "ReSpyUI"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = game.CoreGui
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	_G.ReSpyUI = screenGui
	local main = Instance.new("Frame")
	main.Size = UDim2.new(0.45,0,0.6,0)
	main.Position = UDim2.new(0.5,-260,0.15,0)
	main.AnchorPoint = Vector2.new(0.5,0)
	main.BackgroundColor3 = Color3.fromRGB(34,34,34)
	main.BorderSizePixel = 0
	main.Parent = screenGui

	local uiScale = Instance.new("UIScale")
	uiScale.Scale = 1
	uiScale.Parent = main
	local titlebar = Instance.new("Frame")
	titlebar.Size = UDim2.new(1,0,0,34)
	titlebar.BackgroundColor3 = Color3.fromRGB(24,24,24)
	titlebar.BorderSizePixel = 0
	titlebar.Parent = main
	local title = Instance.new("TextLabel")
	title.Size = UDim2.new(0.7,0,1,0)
	title.Position = UDim2.new(0,8,0,0)
	title.BackgroundTransparency = 1
	title.Text = "ReSpy (Ultimate Debugging Suite)"
	title.TextColor3 = Color3.fromRGB(230,230,230)
	title.Font = Enum.Font.SourceSansSemibold
	title.TextSize = 14
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.Parent = titlebar
	local btnClose = Instance.new("TextButton")
	btnClose.Size = UDim2.new(0,36,0,22)
	btnClose.Position = UDim2.new(1,-44,0,6)
	btnClose.Text = "X"
	btnClose.Parent = titlebar
	local btnMin = Instance.new("TextButton")
	btnMin.Size = UDim2.new(0,36,0,22)
	btnMin.Position = UDim2.new(1,-88,0,6)
	btnMin.Text = "_"
	btnMin.Parent = titlebar
	local content = Instance.new("Frame")
	content.Size = UDim2.new(1,-16,1,-50)
	content.Position = UDim2.new(0,8,0,40)
	content.BackgroundTransparency = 1
	content.Parent = main
	local leftPanel = Instance.new("Frame")
	leftPanel.Size = UDim2.new(0.55,0,1,0)
	leftPanel.Position = UDim2.new(0,0,0,0)
	leftPanel.BackgroundColor3 = Color3.fromRGB(28,28,28)
	leftPanel.BorderSizePixel = 0
	leftPanel.Parent = content
	local rightPanel = Instance.new("Frame")
	rightPanel.Size = UDim2.new(0.43,0,1,0)
	rightPanel.Position = UDim2.new(0.57,0,0,0)
	rightPanel.BackgroundColor3 = Color3.fromRGB(30,30,30)
	rightPanel.BorderSizePixel = 0
	rightPanel.Parent = content
	local consoleFrame = Instance.new("Frame")
	consoleFrame.Size = UDim2.new(1,0,0.25,0)
	consoleFrame.Position = UDim2.new(0,0,0.75,0)
	consoleFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
	consoleFrame.BorderSizePixel = 0
	consoleFrame.Parent = main
	local consoleScroll = Instance.new("ScrollingFrame")
	consoleScroll.Size = UDim2.new(1,-8,1,-8)
	consoleScroll.Position = UDim2.new(0,4,0,4)
	consoleScroll.BackgroundTransparency = 1
	consoleScroll.CanvasSize = UDim2.new(0,0,0,0)
	consoleScroll.ScrollBarThickness = 6
	consoleScroll.Parent = consoleFrame
	local consoleLayout = Instance.new("UIListLayout")
	consoleLayout.Padding = UDim.new(0,2)
	consoleLayout.Parent = consoleScroll
	local function logConsole(msg,isError)
		msg = tostring(msg)
		local lines = msg:split("\n")
		for _,line in ipairs(lines) do
			local label = Instance.new("TextLabel")
			label.Size = UDim2.new(1,0,0,16)
			label.BackgroundTransparency = 1
			label.Font = Enum.Font.Code
			label.TextSize = 12
			label.TextXAlignment = Enum.TextXAlignment.Left
			label.Text = os.date("[%H:%M:%S] ")..line
			label.TextColor3 = isError and Color3.fromRGB(255,80,80) or Color3.fromRGB(0,255,0)
			label.Parent = consoleScroll
			label.RichText = true
		end
		_G.ReSpyLogConsole = logConsole
		consoleScroll.CanvasSize = UDim2.new(0,0,0,consoleLayout.AbsoluteContentSize.Y + 4)
		consoleScroll.CanvasPosition = Vector2.new(0, consoleScroll.CanvasSize.Y.Offset)
	end
	local remotesLabel = Instance.new("TextLabel")
	remotesLabel.Size = UDim2.new(1,0,0,26)
	remotesLabel.Position = UDim2.new(0,8,0,6)
	remotesLabel.BackgroundTransparency = 1
	remotesLabel.Text = "Remotes in accessible services"
	remotesLabel.TextColor3 = Color3.fromRGB(220,220,220)
	remotesLabel.Font = Enum.Font.SourceSansSemibold
	remotesLabel.TextSize = 14
	remotesLabel.TextXAlignment = Enum.TextXAlignment.Left
	remotesLabel.Parent = leftPanel
	local refreshBtn = Instance.new("TextButton")
	refreshBtn.Size = UDim2.new(0,80,0,24)
	refreshBtn.Position = UDim2.new(1,-88,0,6)
	refreshBtn.Text = "Refresh"
	refreshBtn.Parent = leftPanel
	local remotesList = Instance.new("ScrollingFrame")
	remotesList.Size = UDim2.new(1,-16,1,-50)
	remotesList.Position = UDim2.new(0,8,0,38)
	remotesList.ScrollBarThickness = 6
	remotesList.BackgroundTransparency = 1
	remotesList.Active = true
	remotesList.Parent = leftPanel
	local uiListLayout = Instance.new("UIListLayout")
	uiListLayout.Padding = UDim.new(0,6)
	uiListLayout.Parent = remotesList
	uiListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		remotesList.CanvasSize = UDim2.new(0,0,0,uiListLayout.AbsoluteContentSize.Y + 8)
	end)
	local selectedLabel = Instance.new("TextLabel")
	selectedLabel.Size = UDim2.new(1,-16,0,24)
	selectedLabel.Position = UDim2.new(0,8,0,8)
	selectedLabel.BackgroundTransparency = 1
	selectedLabel.Text = "Selected: (none)"
	selectedLabel.TextColor3 = Color3.fromRGB(230,230,230)
	selectedLabel.Font = Enum.Font.SourceSans
	selectedLabel.TextSize = 14
	selectedLabel.TextXAlignment = Enum.TextXAlignment.Left
	selectedLabel.Parent = rightPanel
	local argsLabel = Instance.new("TextLabel")
	argsLabel.Size = UDim2.new(1,-16,0,18)
	argsLabel.Position = UDim2.new(0,8,0,36)
	argsLabel.BackgroundTransparency = 1
	argsLabel.Text = "Arguments (comma separated)"
	argsLabel.TextColor3 = Color3.fromRGB(200,200,200)
	argsLabel.Font = Enum.Font.SourceSans
	argsLabel.TextSize = 12
	argsLabel.TextXAlignment = Enum.TextXAlignment.Left
	argsLabel.Parent = rightPanel
	local argsBox = Instance.new("TextBox")
	argsBox.Size = UDim2.new(1,-16,0,36)
	argsBox.Position = UDim2.new(0,8,0,56)
	argsBox.ClearTextOnFocus = false
	argsBox.PlaceholderText = [["hello",5,true, game.Workspace]]
	argsBox.Text = ""
	argsBox.Parent = rightPanel
	local fireButton = Instance.new("TextButton")
	fireButton.Size = UDim2.new(0,200,0,36)
	fireButton.Position = UDim2.new(0,8,0,100)
	fireButton.Text = "Fire / Invoke Selected Remote"
	fireButton.Parent = rightPanel
	local selectedRemote
	local function clearList()
		for _,v in ipairs(remotesList:GetChildren()) do
			if v:IsA("TextButton") then v:Destroy() end
		end
	end
	local function populate()
		clearList()
		local remotes = collectRemotes()
		logConsole("Loading "..#remotes.." remotes...")

		spawn(function()
			for _,inst in ipairs(remotes) do
				local btn = Instance.new("TextButton")
				btn.Size = UDim2.new(1,-8,0,28)
				btn.BackgroundColor3 = Color3.fromRGB(38,38,38)
				btn.BorderSizePixel = 0
				btn.Text = inst:GetFullName()
				btn.Font = Enum.Font.SourceSans
				btn.TextSize = 13
				btn.TextColor3 = Color3.fromRGB(230,230,230)
				btn.Parent = remotesList
				btn.MouseButton1Click:Connect(function()
					for _,b in ipairs(remotesList:GetChildren()) do
						if b:IsA("TextButton") then
							b.BackgroundColor3 = Color3.fromRGB(38,38,38)
						end
					end
					btn.BackgroundColor3 = Color3.fromRGB(60,60,60)
					selectedRemote = inst
					selectedLabel.Text = "Selected: " .. inst:GetFullName()
				end)
				task.wait(0.05)
			end
			logConsole("Finished loading "..#remotes.." remotes.")
		end)
	end

	refreshBtn.MouseButton1Click:Connect(function()
		populate()
		logConsole("Manual refresh triggered.")
	end)
	fireButton.MouseButton1Click:Connect(function()
		if not selectedRemote then
			logConsole("No remote selected.",true)
			return
		end
		local args = parseArgs(argsBox.Text)
		local ok, res = pcall(function()
			if selectedRemote:IsA("RemoteEvent") then
				selectedRemote:FireServer(table.unpack(args))
				return "Fired RemoteEvent."
			else
				local result = selectedRemote:InvokeServer(table.unpack(args))
				return "InvokeServer returned: " .. pretty(result)
			end
		end)
		if ok then logConsole(res) else logConsole("Error: "..tostring(res),true) end
	end)
	local dragging, dragStartPos, guiStartPos
	local resizing, resizeDir, resizeStartPos, resizeStartSize
	local edgeThreshold = 8

	local function getResizeDirection(mousePos)
		local absPos, absSize = main.AbsolutePosition, main.AbsoluteSize
		local rightEdge, bottomEdge = absPos.X + absSize.X, absPos.Y + absSize.Y
		local nearLeft = math.abs(mousePos.X - absPos.X) <= edgeThreshold
		local nearRight = math.abs(mousePos.X - rightEdge) <= edgeThreshold
		local nearTop = math.abs(mousePos.Y - absPos.Y) <= edgeThreshold
		local nearBottom = math.abs(mousePos.Y - bottomEdge) <= edgeThreshold
		if nearLeft and nearTop then return "TopLeft"
		elseif nearRight and nearTop then return "TopRight"
		elseif nearLeft and nearBottom then return "BottomLeft"
		elseif nearRight and nearBottom then return "BottomRight"
		elseif nearLeft then return "Left"
		elseif nearRight then return "Right"
		elseif nearTop then return "Top"
		elseif nearBottom then return "Bottom"
		end
		return nil
	end
	titlebar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			if resizing then return end
			dragging = true
			dragStartPos = input.Position
			guiStartPos = main.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then dragging = false end
			end)
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			if resizing then return end
			local delta = input.Position - dragStartPos
			main.Position = UDim2.new(guiStartPos.X.Scale, guiStartPos.X.Offset + delta.X,
				guiStartPos.Y.Scale, guiStartPos.Y.Offset + delta.Y)
		end
		if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - resizeStartPos
			local newSize, newPos = resizeStartSize, main.Position
			if resizeDir:find("Right") then newSize = UDim2.new(0, math.max(240, resizeStartSize.X.Offset + delta.X), 0, newSize.Y.Offset)
			elseif resizeDir:find("Left") then
				local newWidth = math.max(240, resizeStartSize.X.Offset - delta.X)
				newSize = UDim2.new(0, newWidth, 0, newSize.Y.Offset)
				newPos = UDim2.new(newPos.X.Scale, newPos.X.Offset + delta.X, newPos.Y.Scale, newPos.Y.Offset)
			end
			if resizeDir:find("Bottom") then newSize = UDim2.new(0, newSize.X.Offset, 0, math.max(180, resizeStartSize.Y.Offset + delta.Y))
			elseif resizeDir:find("Top") then
				local newHeight = math.max(180, resizeStartSize.Y.Offset - delta.Y)
				newSize = UDim2.new(0, newSize.X.Offset, 0, newHeight)
				newPos = UDim2.new(newPos.X.Scale, newPos.X.Offset, newPos.Y.Scale, newPos.Y.Offset + delta.Y)
			end
			main.Size, main.Position = newSize, newPos
		end
	end)
	main.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			local dir = getResizeDirection(input.Position)
			if dir then
				resizing = true
				resizeDir = dir
				resizeStartPos = input.Position
				resizeStartSize = main.Size
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then resizing=false resizeDir=nil end
				end)
			end
		end
	end)
	local minimized = false
	btnClose.MouseButton1Click:Connect(function() screenGui:Destroy() end)
	btnMin.MouseButton1Click:Connect(function()
		minimized = not minimized
		content.Visible = not minimized
		consoleFrame.Visible = not minimized
		main.Size = minimized and UDim2.new(0,240,0,34) or UDim2.new(0.45,0,0.6,0)
	end)
	populate()
	logConsole("Ready.")
	logConsole("ReSpy Was made by <b>@LenkaToJaMarcel</b>. Do not use From anywhere else, since it can be <i>obfuscated</i> and have <b>malicious code</b> that \n Could be used to <b><i>steal your data</i></b>.\n <b>Be Safe and have fun</b>!")
	logConsole("\n\nNote For Devs:\n This script supports additions. to make them, use: \n _G.ReSpyLogConsole(msg: string, isError: boolean)\n_G.ReSpyUI (ScreenGui)")
	logConsole("Note: The LogConsole funcion with the message DOES support <i><b>Rich Text</b></i>.")
    logConsole("\n\n\n\n hey, its me. the dev of this script. if you would kindly \n push that like button on \n scriptblox.com, you would motivate me more to make more \n awesome scripts, so please, push it!")
end
wait(1)
run()
wait(0.1)
FetchingLabel.Text = "Fetched."
wait(.75)
ScreenGui:Destroy()
