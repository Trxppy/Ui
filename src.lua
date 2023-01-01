local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local uis = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local coreGui = game:GetService("CoreGui")
local HTTPService = game:GetService("HttpService")

--vars
local viewport = workspace.CurrentCamera.ViewportSize
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

local Library = {}

function Library:validate(defaults, options)
	for i, v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function Library:tween(object, goal, callback)
	local tween = tweenService:Create(object, tweenInfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

function Library:new(options)
	local options = options or {}
	options = Library:validate({
		name = "Exotic Hub"
	}, options or {})

	local GUI = {
		CurrentTab = nil
	}

	-- Main Frame
	do
		GUI["1"] = Instance.new("ScreenGui", runService:IsStudio() and players.LocalPlayer:WaitForChild("PlayerGui") or coreGui);
		GUI["1"]["Name"] = [[ExoticHub]]
		GUI["1"]["IgnoreGuiInset"] = true

		GUI["2"] = Instance.new("Frame", GUI["1"]);
		GUI["2"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
		GUI["2"]["AnchorPoint"] = Vector2.new(0, 0);
		GUI["2"]["Size"] = UDim2.new(0, 400, 0, 300);
		GUI["2"]["Position"] = UDim2.fromOffset((viewport.X/2) - (GUI["2"].Position.X.Offset + GUI["2"].Size.Y.Offset / 2), (viewport.Y/2) - (GUI["2"].Position.X.Offset + GUI["2"].Size.Y.Offset / 2));
		GUI["2"]["Name"] = [[Main]];

		GUI["3"] = Instance.new("UICorner", GUI["2"])
		GUI["3"]["CornerRadius"] =  UDim.new(0, 6);

		GUI["b"] = Instance.new("Frame", GUI["2"]);
		GUI["b"]["ZIndex"] = 0;
		GUI["b"]["BorderSizePixel"] = 0;
		GUI["b"]["BackgroundTransparency"] = 1;
		GUI["b"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["b"]["Name"] = [[DropShadowHolder]];

		GUI["c"] = Instance.new("ImageLabel", GUI["b"]);
		GUI["c"]["ZIndex"] = 0;
		GUI["c"]["BorderSizePixel"] = 0;
		GUI["c"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
		GUI["c"]["ScaleType"] = Enum.ScaleType.Slice;
		GUI["c"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["c"]["ImageTransparency"] = 0.5;
		GUI["c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["c"]["Image"] = [[rbxassetid://6015897843]];
		GUI["c"]["Size"] = UDim2.new(1, 44, 1, 44);
		GUI["c"]["Name"] = [[DropShadow]];
		GUI["c"]["BackgroundTransparency"] = 1;
		GUI["c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

		GUI["4"] = Instance.new("Frame", GUI["2"]);
		GUI["4"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
		GUI["4"]["Size"] = UDim2.new(1, 0, 0, 30);
		GUI["4"]["Name"] = [[Topbar]];

		GUI["5"] = Instance.new("UICorner", GUI["4"]);
		GUI["5"]["CornerRadius"] = UDim.new(0, 6);

		GUI["6"] = Instance.new("Frame", GUI["4"]);
		GUI["6"]["BorderSizePixel"] = 0;
		GUI["6"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
		GUI["6"]["AnchorPoint"] = Vector2.new(0, 1)
		GUI["6"]["Size"] = UDim2.new(1, 0, 0.5, 0);
		GUI["6"]["Position"] = UDim2.new(0, 0, 1, 0)
		GUI["6"]["Name"] = [[Extension]];

		GUI["7"] = Instance.new("TextLabel", GUI["4"]);
		GUI["7"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		GUI["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["7"]["TextSize"] = 14;
		GUI["7"]["TextColor3"] = Color3.new(255, 255, 255);
		GUI["7"]["Size"] = UDim2.new(0.5, 0, 1, 0);
		GUI["7"]["Text"] = options["name"];
		GUI["7"]["Name"] = [[Title]];
		GUI["7"]["Font"] = Enum.Font.GothamBold
		GUI["7"]["BackgroundTransparency"] = 1;

		GUI["8"] = Instance.new("UIPadding", GUI["7"]);
		GUI["8"]["PaddingTop"] = UDim.new(0, 1);
		GUI["8"]["PaddingLeft"] = UDim.new(0, 8);

		GUI["9"] = Instance.new("ImageLabel", GUI["4"]);
		GUI["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["9"]["AnchorPoint"] = Vector2.new(1, 0.5);
		GUI["9"]["Image"] = [[rbxassetid://11980597739]];
		GUI["9"]["Size"] = UDim2.new(0, 14, 0 , 14);
		GUI["9"]["Name"] = [[Close]];
		GUI["9"]["BackgroundTransparency"] = 1;
		GUI["9"]["Position"] = UDim2.new(1, -8, 0.5, 0);

		GUI["a"] = Instance.new("Frame", GUI["4"]);
		GUI["a"]["BorderSizePixel"] = 0;
		GUI["a"]["BackgroundColor3"] = Color3.fromRGB(82, 82, 82);
		GUI["a"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["a"]["Size"] = UDim2.new(1, 0, 0, 1);
		GUI["a"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["a"]["Name"] = [[Line]];

		GUI["1b"] = Instance.new("Frame", GUI["2"])
		GUI["1b"]["BackgroundColor3"] = Color3.fromRGB(55, 55, 55);
		GUI["1b"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["1b"]["BackgroundTransparency"] = 1;
		GUI["1b"]["Size"] = UDim2.new(1, -133, 1, -42);
		GUI["1b"]["Position"] = UDim2.new(1, -6, 0, 36);
		GUI["1b"]["Name"] = [[ContentContainer]]
	end

	-- Navigation 
	do
		GUI["d"] = Instance.new("Frame", GUI["2"]);
		GUI["d"]["BorderSizePixel"] = 0;
		GUI["d"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
		GUI["d"]["Size"] = UDim2.new(0, 120, 1, -30);
		GUI["d"]["Position"] = UDim2.new(0, 0, 0, 30);
		GUI["d"]["Name"] = [[Navigation]];

		GUI["e"] = Instance.new("UICorner", GUI["d"]);
		GUI["e"]["CornerRadius"] = UDim.new(0, 6)

		GUI["f"] = Instance.new("Frame", GUI["d"])
		GUI["f"]["BorderSizePixel"] = 0;
		GUI["f"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
		GUI["f"]["Size"] = UDim2.new(1,0,0,20);
		GUI["f"]["Name"] = [[Hide]];

		GUI["10"] = Instance.new("Frame", GUI["d"])
		GUI["10"]["BorderSizePixel"] = 0;
		GUI["10"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
		GUI["10"]["AnchorPoint"] = Vector2.new(1, 0)
		GUI["10"]["Size"] = UDim2.new(0, 20, 1, 0);
		GUI["10"]["Position"] = UDim2.new(1, 0, 0, 0)
		GUI["10"]["Name"] = [[Hide2]];

		GUI["11"] = Instance.new("Frame", GUI["d"])
		GUI["11"]["BorderSizePixel"] = 0;
		GUI["11"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
		GUI["11"]["Size"] = UDim2.new(1,0,1,0);
		GUI["11"]["Name"] = [[ButtonHolder]];

		GUI["12"] = Instance.new("UIPadding", GUI["11"]);
		GUI["12"]["PaddingTop"] = UDim.new(0, 4);
		GUI["12"]["PaddingBottom"] = UDim.new(0, 4);
		GUI["12"]["PaddingLeft"] = UDim.new(0, 4);
		GUI["12"]["PaddingRight"] = UDim.new(0, 4);

		GUI["13"] = Instance.new("UIListLayout", GUI["11"]);
		GUI["13"]["Padding"] = UDim.new(0, 1);
		GUI["13"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

		GUI["1a"] = Instance.new("Frame", GUI["d"]);
		GUI["1a"]["BorderSizePixel"] = 0;
		GUI["1a"]["BackgroundColor3"] = Color3.fromRGB(82, 82, 82);
		GUI["1a"]["Size"] = UDim2.new(0, 1, 1, 0);
		GUI["1a"]["Position"] = UDim2.new(1, 0, 0, 0);
		GUI["1a"]["Name"] = [[Line]];

	end

	function GUI:CreateTab(options)
		options = Library:validate({
			name = "Preview Tab",
			icon = "rbxassetid://10888331510"
		}, options or {})

		local Tab = {
			Hover = false,
			Active = false
		}



		-- Render

		do
			Tab["17"] = Instance.new("TextLabel", GUI["11"]);
			Tab["17"]["BorderSizePixel"] = 0;
			Tab["17"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Tab["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["17"]["TextSize"] = 12;
			Tab["17"]["TextColor3"] = Color3.fromRGB(200, 200, 200);
			Tab["17"]["Size"] = UDim2.new(1, 0, 0, 24);
			Tab["17"]["Text"] = options.name;
			Tab["17"]["Name"] = [[Inactive]];
			Tab["17"]["Font"] = Enum.Font.Ubuntu;
			Tab["17"]["BackgroundTransparency"] = 1;

			Tab["18"] = Instance.new("UIPadding", Tab["17"]);
			Tab["18"]["PaddingLeft"] = UDim.new(0, 28);

			Tab["19"] = Instance.new("ImageLabel", Tab["17"]);
			Tab["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["19"]["ImageColor3"] = Color3.fromRGB(200, 200, 200);
			Tab["19"]["AnchorPoint"] = Vector2.new(0, 0.5);
			Tab["19"]["Image"] = options.icon;
			Tab["19"]["Size"] = UDim2.new(0, 20, 0, 20);
			Tab["19"]["Name"] = [[Icon]];
			Tab["19"]["BackgroundTransparency"] = 1;
			Tab["19"]["Position"] = UDim2.new(0, -24, 0.5, 0);

			Tab["1c"] = Instance.new("ScrollingFrame", GUI["1b"]);
			Tab["1c"]["BorderSizePixel"] = 0;
			Tab["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["1c"]["BackgroundTransparency"] = 1;
			Tab["1c"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["1c"]["Selectable"] = false;
			Tab["1c"]["ScrollBarThickness"] = 0;
			Tab["1c"]["Name"] = [[HomeTab]];
			Tab["1c"]["SelectionGroup"] = false;
			Tab["1c"]["Visible"] = false;
			
			Tab["23"] = Instance.new("UIPadding", Tab["1c"]);
			Tab["23"]["PaddingBottom"] = UDim.new(0, 1)
			Tab["23"]["PaddingLeft"] = UDim.new(0, 1)
			Tab["23"]["PaddingTop"] = UDim.new(0, 1)
			Tab["23"]["PaddingRight"] = UDim.new(0, 1)
			
			Tab["2b"] = Instance.new("UIListLayout", Tab["1c"]);
			Tab["2b"]["Padding"] = UDim.new(0, 6);
			Tab["2b"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

		end

		-- Methods

		function Tab:Activate()
			if not Tab.Active then

				if GUI.CurrentTab ~= nil then
					GUI.CurrentTab:Deactive()
				end

				Tab.Active = true
				Library:tween(Tab["17"], {BackgroundTransparency = 0.9})
				Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
				Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(255, 255, 255)})
				Tab["1c"].Visible = true

				GUI.CurrentTab = Tab
			end
		end

		function Tab:Deactive()
			if Tab.Active then
				Tab.Active = false
				Tab.Hover = false
				Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(200, 200, 200)})
				Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(200, 200, 200)})
				Library:tween(Tab["17"], {BackgroundTransparency = 1})
				Tab["1c"].Visible = false

			end
		end


		-- Logic
		do
			Tab["17"].MouseEnter:Connect(function()
				Tab.Hover = true

				if not Tab.Active then
					Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
					Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(255, 255, 255)})
				end
			end)

			Tab["17"].MouseLeave:Connect(function()
				Tab.Hover = false

				if not Tab.Active then
					Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(200, 200, 200)})
					Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(200, 200, 200)})
				end
			end)

			uis.InputBegan:Connect(function(input, gpe)
				if gpe then return end

				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if Tab.Hover then
						Tab:Activate()
					end
				end
			end)

			if GUI.CurrentTab == nil then
				Tab:Activate()
			end
		end

		function Tab:Button(options)
			options = Library:validate({
				name = "Preview Button",
				callback = function() end
			}, options or {})

			local Button = {
				Hover = false,
				MouseDown = false
			}

			-- Render

			do
				Button["1d"] = Instance.new("Frame", Tab["1c"]);
				Button["1d"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
				Button["1d"]["Size"] = UDim2.new(1, 0, 0, 32);
				Button["1d"]["Name"] = [[Button]]

				Button["1e"] = Instance.new("UICorner", Button["1d"]);
				Button["1e"]["CornerRadius"] = UDim.new(0, 4);

				Button["1f"] = Instance.new("UIStroke", Button["1d"]);
				Button["1f"]["Color"] = Color3.fromRGB(82, 82, 82)
				Button["1f"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				Button["20"] = Instance.new("TextLabel", Button["1d"]);
				Button["20"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Button["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["20"]["TextSize"] = 14;
				Button["20"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Button["20"]["Size"] = UDim2.new(1, -20, 1, 0);
				Button["20"]["Text"] = options.name;
				Button["20"]["Name"] = [[Title]];
				Button["20"]["Font"] = Enum.Font.Ubuntu;
				Button["20"]["BackgroundTransparency"] = 1;

				Button["21"] = Instance.new("UIPadding", Button["1d"]);
				Button["21"]["PaddingTop"] = UDim.new(0, 6);
				Button["21"]["PaddingLeft"] = UDim.new(0, 6);
				Button["21"]["PaddingRight"] = UDim.new(0, 6);
				Button["21"]["PaddingBottom"] = UDim.new(0, 6);

				Button["22"] = Instance.new("ImageLabel", Button["1d"]);
				Button["22"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["22"]["AnchorPoint"] = Vector2.new(1, 0);
				Button["22"]["Image"] = [[rbxassetid://1088847558]];
				Button["22"]["Size"] = UDim2.new(0, 20, 0, 20);
				Button["22"]["Name"] = [[Icon]];
				Button["22"]["BackgroundTransparency"] = 1;
				Button["22"]["Position"] = UDim2.new(1, 0, 0, 0)
				
				
			end
			
			-- Method
			
			do
				function Button:SetText(text)
					Button["20"].Text = text
					options.name = text
				end
				
				function Button:SetCallback(fn)
					options.callback = fn
				end
			end
			
			-- Logic
			
			do
				Button["1d"].MouseEnter:Connect(function()
					Button.Hover = true
					Library:tween(Button["1f"], {Color = Color3.fromRGB(102, 102, 102)})
					
				end)
				
				Button["1d"].MouseLeave:Connect(function()
					Button.Hover = false
					
					if not Button.MouseDown then
						Library:tween(Button["1f"], {Color = Color3.fromRGB(82, 82, 82)})
					end
				end)
				
				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end
					
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
						Button.MouseDown = true
						Library:tween(Button["1d"], {BackgroundColor3 = Color3.fromRGB(57, 57, 57)})
						Library:tween(Button["1f"], {Color = Color3.fromRGB(200, 200, 200)})
						options.callback()
					end
				end)
				
				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Button.MouseDown = false
						
						if Button.Hover then
							Library:tween(Button["1d"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
							Library:tween(Button["1f"], {Color = Color3.fromRGB(102, 102, 102)}) 
						else
							Library:tween(Button["1d"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
							Library:tween(Button["1f"], {Color = Color3.fromRGB(82, 82, 82)})
						end
					end
				end)
				
			end
			
			return Button

		end
		
		function Tab:Warning(options)
			options = Library:validate({
				message = "Preview Warning"
			}, options or {})
			
			local Warning = {}
			
			-- Render
			
			do
				Warning["24"] = Instance.new("Frame", Tab["1c"]);
				Warning["24"]["BackgroundColor3"] = Color3.fromRGB(44, 37, 4);
				Warning["24"]["Size"] = UDim2.new(1, 0, 0, 26);
				Warning["24"]["Name"] = [[Warning]];
				
				Warning["25"] = Instance.new("UICorner", Warning["24"]);
				Warning["25"]["CornerRadius"] = UDim.new(0, 4);
				
				Warning["26"] = Instance.new("UIStroke", Warning["24"]);
				Warning["26"]["Color"] = Color3.fromRGB(166, 138, 12);
				Warning["26"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				
				Warning["27"] = Instance.new("TextLabel", Warning["24"]);
				Warning["27"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Warning["27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Warning["27"]["TextSize"] = 14;
				Warning["27"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Warning["27"]["Size"] = UDim2.new(1, 0, 1, 0);
				Warning["27"]["Text"] = options.message;
				Warning["27"]["Name"] = [[Title]];
				Warning["27"]["Font"] = Enum.Font.Ubuntu;
				Warning["27"]["BackgroundTransparency"] = 1;
				Warning["27"]["TextWrapped"] = true;
				Warning["27"]["TextYAlignment"] = Enum.TextYAlignment.Top;
				
				Warning["28"] = Instance.new("UIPadding", Warning["27"]);
				Warning["28"]["PaddingLeft"] = UDim.new(0, 20)
				
				Warning["29"] = Instance.new("ImageLabel", Warning["27"]);
				Warning["29"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Warning["29"]["Image"] = [[rbxassetid://10889384842]];
				Warning["29"]["ImageColor3"] = Color3.fromRGB(215, 179, 15)
				Warning["29"]["Size"] = UDim2.new(0, 14, 0, 14);
				Warning["29"]["Name"] = [[Icon]];
				Warning["29"]["BackgroundTransparency"] = 1;
				Warning["29"]["Position"] = UDim2.new(0, -20, 0, 0)
				
				Warning["2a"] = Instance.new("UIPadding", Warning["24"]);
				Warning["2a"]["PaddingTop"] = UDim.new(0, 6);
				Warning["2a"]["PaddingLeft"] = UDim.new(0, 6);
				Warning["2a"]["PaddingRight"] = UDim.new(0, 6);
				Warning["2a"]["PaddingBottom"] = UDim.new(0, 6);
				
			end
			
			-- Methods
			
			do
				function Warning:SetText(text)
					options.message = text
					Warning:_update()
				end
			end
			
			function Warning:_update()
				Warning["27"].Text = options.message
				
				Warning["27"].Size = UDim2.new(Warning["27"].Size.X.Scale, Warning["27"].Size.Y.Offset, 0, math.huge)
				Warning["27"].Size = UDim2.new(Warning["27"].Size.X.Scale, Warning["27"].Size.X.Offset, 0, Warning["27"].TextBounds.Y)
				Library:tween(Warning["24"], {Size = UDim2.new(Warning["24"].Size.X.Scale, Warning["24"].Size.X.Offset, 0, Warning["27"].TextBounds.Y + 12)})
			end
			
			Warning:_update()
			
			return Warning
			
		end
		
		function Tab:Info(options)
			options = Library:validate({
				message = "Preview Info"
			}, options or {})

			local Info = {}

			-- Render

			do
				Info["24"] = Instance.new("Frame", Tab["1c"]);
				Info["24"]["BackgroundColor3"] = Color3.fromRGB(3, 32, 43);
				Info["24"]["Size"] = UDim2.new(1, 0, 0, 26);
				Info["24"]["Name"] = [[Info]];

				Info["25"] = Instance.new("UICorner", Info["24"]);
				Info["25"]["CornerRadius"] = UDim.new(0, 4);

				Info["26"] = Instance.new("UIStroke", Info["24"]);
				Info["26"]["Color"] = Color3.fromRGB(41, 91, 106);
				Info["26"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				Info["27"] = Instance.new("TextLabel", Info["24"]);
				Info["27"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Info["27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Info["27"]["TextSize"] = 14;
				Info["27"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Info["27"]["Size"] = UDim2.new(1, 0, 1, 0);
				Info["27"]["Text"] = options.message;
				Info["27"]["Name"] = [[Title]];
				Info["27"]["Font"] = Enum.Font.Ubuntu;
				Info["27"]["BackgroundTransparency"] = 1;
				Info["27"]["TextWrapped"] = true;
				Info["27"]["TextYAlignment"] = Enum.TextYAlignment.Top;

				Info["28"] = Instance.new("UIPadding", Info["27"]);
				Info["28"]["PaddingLeft"] = UDim.new(0, 20)

				Info["29"] = Instance.new("ImageLabel", Info["27"]);
				Info["29"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Info["29"]["Image"] = [[rbxassetid://11982110003]];
				Info["29"]["ImageColor3"] = Color3.fromRGB(255, 255, 255)
				Info["29"]["Size"] = UDim2.new(0, 14, 0, 14);
				Info["29"]["Name"] = [[Icon]];
				Info["29"]["BackgroundTransparency"] = 1;
				Info["29"]["Position"] = UDim2.new(0, -20, 0, 0)

				Info["2a"] = Instance.new("UIPadding", Info["24"]);
				Info["2a"]["PaddingTop"] = UDim.new(0, 6);
				Info["2a"]["PaddingLeft"] = UDim.new(0, 6);
				Info["2a"]["PaddingRight"] = UDim.new(0, 6);
				Info["2a"]["PaddingBottom"] = UDim.new(0, 6);

			end

			-- Methods

			do
				function Info:SetText(text)
					options.message = text
					Info:_update()
				end
			end

			function Info:_update()
				Info["27"].Text = options.message

				Info["27"].Size = UDim2.new(Info["27"].Size.X.Scale, Info["27"].Size.Y.Offset, 0, math.huge)
				Info["27"].Size = UDim2.new(Info["27"].Size.X.Scale, Info["27"].Size.X.Offset, 0, Info["27"].TextBounds.Y)
				Library:tween(Info["24"], {Size = UDim2.new(Info["24"].Size.X.Scale, Info["24"].Size.X.Offset, 0, Info["27"].TextBounds.Y + 12)})
			end

			Info:_update()

			return Info

		end
		
		function Tab:Label(options)
			options = Library:validate({
				message = "Preview Info"
			}, options or {})

			local Label = {}

			-- Render

			do
				Label["24"] = Instance.new("Frame", Tab["1c"]);
				Label["24"]["BackgroundColor3"] = Color3.fromRGB(24, 24, 24);
				Label["24"]["Size"] = UDim2.new(1, 0, 0, 26);
				Label["24"]["Name"] = [[Info]];

				Label["25"] = Instance.new("UICorner", Label["24"]);
				Label["25"]["CornerRadius"] = UDim.new(0, 4);

				Label["26"] = Instance.new("UIStroke", Label["24"]);
				Label["26"]["Color"] = Color3.fromRGB(41, 91, 106);
				Label["26"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				Label["27"] = Instance.new("TextLabel", Label["24"]);
				Label["27"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Label["27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Label["27"]["TextSize"] = 14;
				Label["27"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Label["27"]["Size"] = UDim2.new(1, 0, 1, 0);
				Label["27"]["Text"] = options.message;
				Label["27"]["Name"] = [[Title]];
				Label["27"]["Font"] = Enum.Font.Ubuntu;
				Label["27"]["BackgroundTransparency"] = 1;
				Label["27"]["TextWrapped"] = true;
				Label["27"]["TextYAlignment"] = Enum.TextYAlignment.Top;

				Label["28"] = Instance.new("UIPadding", Label["27"]);
				Label["28"]["PaddingLeft"] = UDim.new(0, 20)

				Label["29"] = Instance.new("ImageLabel", Label["27"]);
				Label["29"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Label["29"]["Image"] = [[rbxassetid://11982104462]];
				Label["29"]["ImageColor3"] = Color3.fromRGB(24, 24, 24)
				Label["29"]["Size"] = UDim2.new(0, 14, 0, 14);
				Label["29"]["Name"] = [[Icon]];
				Label["29"]["BackgroundTransparency"] = 1;
				Label["29"]["Position"] = UDim2.new(0, -20, 0, 0)

				Label["2a"] = Instance.new("UIPadding", Label["24"]);
				Label["2a"]["PaddingTop"] = UDim.new(0, 6);
				Label["2a"]["PaddingLeft"] = UDim.new(0, 6);
				Label["2a"]["PaddingRight"] = UDim.new(0, 6);
				Label["2a"]["PaddingBottom"] = UDim.new(0, 6);

			end

			-- Methods

			do
				function Label:SetText(text)
					options.message = text
					Label:_update()
				end
			end

			function Label:_update()
				Label["27"].Text = options.message

				Label["27"].Size = UDim2.new(Label["27"].Size.X.Scale, Label["27"].Size.Y.Offset, 0, math.huge)
				Label["27"].Size = UDim2.new(Label["27"].Size.X.Scale, Label["27"].Size.X.Offset, 0, Label["27"].TextBounds.Y)
				Library:tween(Label["24"], {Size = UDim2.new(Label["24"].Size.X.Scale, Label["24"].Size.X.Offset, 0, Label["27"].TextBounds.Y + 12)})
			end

			Label:_update()

			return Label

		end
		
		function Tab:Slider(options)
			options = Library:validate({
				message = "Preview Info"
			}, options or {})
			
			local Slider = {}
			
			
			
			return Slider
		end
		
		return Tab

	end

	return GUI
end
