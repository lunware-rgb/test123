local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Loader = {}

function Loader.new(OnLoadCallback)
	local LoaderUI = {}
	local LoadCallback = OnLoadCallback
	
	LoaderUI["1"] = Instance.new("ScreenGui", game.CoreGui)
	LoaderUI["1"]["Name"] = "LoaderUI"
	LoaderUI["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
	
	LoaderUI["2"] = Instance.new("Frame", LoaderUI["1"])
	LoaderUI["2"]["BorderSizePixel"] = 0
	LoaderUI["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	LoaderUI["2"]["Size"] = UDim2.new(0, 500, 0, 300)
	LoaderUI["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)
	LoaderUI["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
	LoaderUI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	LoaderUI["2"]["Name"] = "Window"
	LoaderUI["2"]["BackgroundTransparency"] = 1
	
	LoaderUI["3"] = Instance.new("UICorner", LoaderUI["2"])
	LoaderUI["3"]["CornerRadius"] = UDim.new(0, 4)
	
	LoaderUI["4"] = Instance.new("UIStroke", LoaderUI["2"])
	LoaderUI["4"]["Color"] = Color3.fromRGB(47, 57, 60)
	LoaderUI["4"]["Transparency"] = 1
	
	LoaderUI["5"] = Instance.new("UIGradient", LoaderUI["2"])
	LoaderUI["5"]["Rotation"] = 90
	LoaderUI["5"]["Color"] = ColorSequence.new{
		ColorSequenceKeypoint.new(0.000, Color3.fromRGB(34, 40, 43)),
		ColorSequenceKeypoint.new(0.100, Color3.fromRGB(18, 21, 22)),
		ColorSequenceKeypoint.new(1.000, Color3.fromRGB(18, 21, 22))
	}
	
	LoaderUI.Top = {}
	LoaderUI.Top["1"] = Instance.new("Frame", LoaderUI["2"])
	LoaderUI.Top["1"]["BorderSizePixel"] = 0
	LoaderUI.Top["1"]["BackgroundColor3"] = Color3.fromRGB(29, 34, 36)
	LoaderUI.Top["1"]["Size"] = UDim2.new(1, 0, 0, 40)
	LoaderUI.Top["1"]["Position"] = UDim2.new(0, 0, 0, 0)
	LoaderUI.Top["1"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	LoaderUI.Top["1"]["Name"] = "Top"
	LoaderUI.Top["1"]["BackgroundTransparency"] = 1
	
	LoaderUI.Top["2"] = Instance.new("UICorner", LoaderUI.Top["1"])
	LoaderUI.Top["2"]["CornerRadius"] = UDim.new(0, 4)
	
	LoaderUI.Top["Stroke"] = Instance.new("UIStroke", LoaderUI.Top["1"])
	LoaderUI.Top["Stroke"]["Color"] = Color3.fromRGB(47, 57, 60)
	LoaderUI.Top["Stroke"]["Transparency"] = 1
	
	LoaderUI.Top["Layout"] = Instance.new("UIListLayout", LoaderUI.Top["1"])
	LoaderUI.Top["Layout"]["Padding"] = UDim.new(0, 8)
	LoaderUI.Top["Layout"]["VerticalAlignment"] = Enum.VerticalAlignment.Center
	LoaderUI.Top["Layout"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
	LoaderUI.Top["Layout"]["SortOrder"] = Enum.SortOrder.LayoutOrder
	LoaderUI.Top["Layout"]["FillDirection"] = Enum.FillDirection.Horizontal
	
	LoaderUI.Top["Logo"] = Instance.new("ImageLabel", LoaderUI.Top["1"])
	LoaderUI.Top["Logo"]["BorderSizePixel"] = 0
	LoaderUI.Top["Logo"]["ScaleType"] = Enum.ScaleType.Fit
	LoaderUI.Top["Logo"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	LoaderUI.Top["Logo"]["Image"] = "rbxassetid://127134291132189"
	LoaderUI.Top["Logo"]["Size"] = UDim2.new(0, 20, 0, 20)
	LoaderUI.Top["Logo"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	LoaderUI.Top["Logo"]["BackgroundTransparency"] = 1
	LoaderUI.Top["Logo"]["Name"] = "Logo"
	LoaderUI.Top["Logo"]["ImageTransparency"] = 1
	LoaderUI.Top["Logo"]["LayoutOrder"] = 1
	
	LoaderUI.Top["3"] = Instance.new("TextLabel", LoaderUI.Top["1"])
	LoaderUI.Top["3"]["BorderSizePixel"] = 0
	LoaderUI.Top["3"]["TextSize"] = 18
	LoaderUI.Top["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	LoaderUI.Top["3"]["FontFace"] = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	LoaderUI.Top["3"]["TextColor3"] = Color3.fromRGB(230, 230, 230)
	LoaderUI.Top["3"]["BackgroundTransparency"] = 1
	LoaderUI.Top["3"]["Size"] = UDim2.new(0, 0, 0, 36)
	LoaderUI.Top["3"]["AutomaticSize"] = Enum.AutomaticSize.X
	LoaderUI.Top["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	LoaderUI.Top["3"]["Text"] = "Script Loader"
	LoaderUI.Top["3"]["Name"] = "Label"
	LoaderUI.Top["3"]["TextTransparency"] = 1
	LoaderUI.Top["3"]["LayoutOrder"] = 2
	
	LoaderUI.Content = {}
	LoaderUI.Content["1"] = Instance.new("Frame", LoaderUI["2"])
	LoaderUI.Content["1"]["BorderSizePixel"] = 0
	LoaderUI.Content["1"]["BackgroundColor3"] = Color3.fromRGB(18, 21, 22)
	LoaderUI.Content["1"]["Size"] = UDim2.new(1, 0, 1, -40)
	LoaderUI.Content["1"]["Position"] = UDim2.new(0, 0, 0, 40)
	LoaderUI.Content["1"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	LoaderUI.Content["1"]["Name"] = "Content"
	LoaderUI.Content["1"]["BackgroundTransparency"] = 1
	
	LoaderUI.Content["2"] = Instance.new("UIPadding", LoaderUI.Content["1"])
	LoaderUI.Content["2"]["PaddingTop"] = UDim.new(0, 20)
	LoaderUI.Content["2"]["PaddingBottom"] = UDim.new(0, 20)
	LoaderUI.Content["2"]["PaddingLeft"] = UDim.new(0, 20)
	LoaderUI.Content["2"]["PaddingRight"] = UDim.new(0, 20)
	
	LoaderUI.Content["3"] = Instance.new("UIListLayout", LoaderUI.Content["1"])
	LoaderUI.Content["3"]["Padding"] = UDim.new(0, 16)
	LoaderUI.Content["3"]["SortOrder"] = Enum.SortOrder.LayoutOrder
	LoaderUI.Content["3"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
	LoaderUI.Content["3"]["VerticalAlignment"] = Enum.VerticalAlignment.Center
	
	LoaderUI.Description = Instance.new("TextLabel", LoaderUI.Content["1"])
	LoaderUI.Description["BorderSizePixel"] = 0
	LoaderUI.Description["TextSize"] = 14
	LoaderUI.Description["TextXAlignment"] = Enum.TextXAlignment.Center
	LoaderUI.Description["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	LoaderUI.Description["FontFace"] = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	LoaderUI.Description["TextColor3"] = Color3.fromRGB(168, 168, 168)
	LoaderUI.Description["BackgroundTransparency"] = 1
	LoaderUI.Description["Size"] = UDim2.new(1, 0, 0, 20)
	LoaderUI.Description["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	LoaderUI.Description["Text"] = "Click the button below to load your scripts"
	LoaderUI.Description["Name"] = "Description"
	LoaderUI.Description["TextTransparency"] = 1
	LoaderUI.Description["TextWrapped"] = true
	
	LoaderUI.LoadButton = Instance.new("TextButton", LoaderUI.Content["1"])
	LoaderUI.LoadButton["BorderSizePixel"] = 0
	LoaderUI.LoadButton["TextSize"] = 16
	LoaderUI.LoadButton["AutoButtonColor"] = false
	LoaderUI.LoadButton["FontFace"] = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	LoaderUI.LoadButton["TextColor3"] = Color3.fromRGB(230, 230, 230)
	LoaderUI.LoadButton["BackgroundColor3"] = Color3.fromRGB(29, 34, 36)
	LoaderUI.LoadButton["Size"] = UDim2.new(0, 200, 0, 40)
	LoaderUI.LoadButton["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	LoaderUI.LoadButton["Text"] = "Load Scripts"
	LoaderUI.LoadButton["Name"] = "LoadButton"
	LoaderUI.LoadButton["BackgroundTransparency"] = 1
	LoaderUI.LoadButton["TextTransparency"] = 1
	
	local ButtonCorner = Instance.new("UICorner", LoaderUI.LoadButton)
	ButtonCorner["CornerRadius"] = UDim.new(0, 4)
	
	local ButtonStroke = Instance.new("UIStroke", LoaderUI.LoadButton)
	ButtonStroke["Color"] = Color3.fromRGB(47, 57, 60)
	ButtonStroke["Transparency"] = 1
	
	local ButtonGradient = Instance.new("UIGradient", LoaderUI.LoadButton)
	ButtonGradient["Rotation"] = 90
	ButtonGradient["Color"] = ColorSequence.new{
		ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),
		ColorSequenceKeypoint.new(1.000, Color3.fromRGB(174, 174, 174))
	}
	
	local ButtonPadding = Instance.new("UIPadding", LoaderUI.LoadButton)
	ButtonPadding["PaddingRight"] = UDim.new(0, 16)
	ButtonPadding["PaddingLeft"] = UDim.new(0, 16)
	
	LoaderUI.Status = Instance.new("TextLabel", LoaderUI.Content["1"])
	LoaderUI.Status["BorderSizePixel"] = 0
	LoaderUI.Status["TextSize"] = 12
	LoaderUI.Status["TextXAlignment"] = Enum.TextXAlignment.Center
	LoaderUI.Status["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	LoaderUI.Status["FontFace"] = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	LoaderUI.Status["TextColor3"] = Color3.fromRGB(120, 142, 150)
	LoaderUI.Status["BackgroundTransparency"] = 1
	LoaderUI.Status["Size"] = UDim2.new(1, 0, 0, 16)
	LoaderUI.Status["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	LoaderUI.Status["Text"] = "Ready"
	LoaderUI.Status["Name"] = "Status"
	LoaderUI.Status["TextTransparency"] = 1
	LoaderUI.Status["LayoutOrder"] = 1
	
	LoaderUI.ProgressBar = Instance.new("Frame", LoaderUI.Content["1"])
	LoaderUI.ProgressBar["BorderSizePixel"] = 0
	LoaderUI.ProgressBar["BackgroundColor3"] = Color3.fromRGB(18, 21, 22)
	LoaderUI.ProgressBar["Size"] = UDim2.new(1, -40, 0, 8)
	LoaderUI.ProgressBar["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	LoaderUI.ProgressBar["Name"] = "ProgressBar"
	LoaderUI.ProgressBar["BackgroundTransparency"] = 1
	LoaderUI.ProgressBar["LayoutOrder"] = 2
	
	local ProgressBarCorner = Instance.new("UICorner", LoaderUI.ProgressBar)
	ProgressBarCorner["CornerRadius"] = UDim.new(0, 4)
	
	local ProgressBarStroke = Instance.new("UIStroke", LoaderUI.ProgressBar)
	ProgressBarStroke["Color"] = Color3.fromRGB(47, 57, 60)
	ProgressBarStroke["Transparency"] = 1
	
	LoaderUI.ProgressFill = Instance.new("Frame", LoaderUI.ProgressBar)
	LoaderUI.ProgressFill["BorderSizePixel"] = 0
	LoaderUI.ProgressFill["BackgroundColor3"] = Color3.fromRGB(43, 52, 55)
	LoaderUI.ProgressFill["Size"] = UDim2.new(0, 0, 1, 0)
	LoaderUI.ProgressFill["Position"] = UDim2.new(0, 0, 0, 0)
	LoaderUI.ProgressFill["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	LoaderUI.ProgressFill["Name"] = "Fill"
	
	local ProgressFillCorner = Instance.new("UICorner", LoaderUI.ProgressFill)
	ProgressFillCorner["CornerRadius"] = UDim.new(0, 4)
	
	local ProgressFillGradient = Instance.new("UIGradient", LoaderUI.ProgressFill)
	ProgressFillGradient["Rotation"] = 90
	ProgressFillGradient["Color"] = ColorSequence.new{
		ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),
		ColorSequenceKeypoint.new(1.000, Color3.fromRGB(174, 174, 174))
	}
	
	local function PlayEntranceAnimation()
		local TweenInfo = TweenInfo.new(
			0.3,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		)
		
		local WindowTween = TweenService:Create(LoaderUI["2"], TweenInfo, {
			BackgroundTransparency = 0,
			Size = UDim2.new(0, 500, 0, 300)
		})
		
		local StrokeTween = TweenService:Create(LoaderUI["4"], TweenInfo, {
			Transparency = 0
		})
		
		local TopBarTween = TweenService:Create(LoaderUI.Top["1"], TweenInfo, {
			BackgroundTransparency = 0
		})
		
		local TopBarStrokeTween = TweenService:Create(LoaderUI.Top["Stroke"], TweenInfo, {
			Transparency = 0
		})
		
		local LogoTween = TweenService:Create(LoaderUI.Top["Logo"], TweenInfo, {
			ImageTransparency = 0
		})
		
		local TitleTween = TweenService:Create(LoaderUI.Top["3"], TweenInfo, {
			TextTransparency = 0
		})
		
		local ContentTween = TweenService:Create(LoaderUI.Content["1"], TweenInfo, {
			BackgroundTransparency = 0
		})
		
		local DescTween = TweenService:Create(LoaderUI.Description, TweenInfo, {
			TextTransparency = 0
		})
		
		local ButtonTween = TweenService:Create(LoaderUI.LoadButton, TweenInfo, {
			BackgroundTransparency = 0,
			TextTransparency = 0
		})
		
		local ButtonStrokeTween = TweenService:Create(ButtonStroke, TweenInfo, {
			Transparency = 0
		})
		
		local StatusTween = TweenService:Create(LoaderUI.Status, TweenInfo, {
			TextTransparency = 0
		})
		
		WindowTween:Play()
		StrokeTween:Play()
		TopBarTween:Play()
		TopBarStrokeTween:Play()
		LogoTween:Play()
		TitleTween:Play()
		ContentTween:Play()
		
		task.wait(0.1)
		DescTween:Play()
		
		task.wait(0.1)
		ButtonTween:Play()
		ButtonStrokeTween:Play()
		
		task.wait(0.1)
		StatusTween:Play()
	end
	
	local function SetupButtonHover()
		local HoverTweenInfo = TweenInfo.new(
			0.2,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		)
		
		local OriginalSize = LoaderUI.LoadButton.Size
		local HoverSize = UDim2.new(0, 220, 0, 44)
		
		LoaderUI.LoadButton.MouseEnter:Connect(function()
			local HoverTween = TweenService:Create(LoaderUI.LoadButton, HoverTweenInfo, {
				Size = HoverSize,
				BackgroundColor3 = Color3.fromRGB(37, 43, 46)
			})
			HoverTween:Play()
		end)
		
		LoaderUI.LoadButton.MouseLeave:Connect(function()
			local LeaveTween = TweenService:Create(LoaderUI.LoadButton, HoverTweenInfo, {
				Size = OriginalSize,
				BackgroundColor3 = Color3.fromRGB(29, 34, 36)
			})
			LeaveTween:Play()
		end)
	end
	
	local function SetupButtonClick()
		local ClickTweenInfo = TweenInfo.new(
			0.1,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		)
		
		LoaderUI.LoadButton.MouseButton1Down:Connect(function()
			local ClickTween = TweenService:Create(LoaderUI.LoadButton, ClickTweenInfo, {
				Size = UDim2.new(0, 190, 0, 36),
				BackgroundColor3 = Color3.fromRGB(22, 26, 27)
			})
			ClickTween:Play()
		end)
		
		LoaderUI.LoadButton.MouseButton1Up:Connect(function()
			local ReleaseTween = TweenService:Create(LoaderUI.LoadButton, ClickTweenInfo, {
				Size = UDim2.new(0, 200, 0, 40),
				BackgroundColor3 = Color3.fromRGB(29, 34, 36)
			})
			ReleaseTween:Play()
		end)
	end
	
	local function LoadScripts()
		local LoadTweenInfo = TweenInfo.new(
			0.2,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		)
		
		local StatusTween = TweenService:Create(LoaderUI.Status, LoadTweenInfo, {
			TextColor3 = Color3.fromRGB(120, 142, 150)
		})
		StatusTween:Play()
		
		LoaderUI.Status.Text = "Loading..."
		
		LoaderUI.ProgressFill.Size = UDim2.new(0, 0, 1, 0)
		
		local ShowProgressBarTween = TweenService:Create(LoaderUI.ProgressBar, LoadTweenInfo, {
			BackgroundTransparency = 0
		})
		
		local ShowProgressStrokeTween = TweenService:Create(ProgressBarStroke, LoadTweenInfo, {
			Transparency = 0
		})
		
		ShowProgressBarTween:Play()
		ShowProgressStrokeTween:Play()
		
		local ProgressTween = TweenService:Create(LoaderUI.ProgressFill, TweenInfo.new(
			2,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		), {
			Size = UDim2.new(1, 0, 1, 0)
		})
		ProgressTween:Play()
		
		local LoadingThread = task.spawn(function()
			local Dots = 0
			while true do
				task.wait(0.3)
				Dots = (Dots % 3) + 1
				LoaderUI.Status.Text = "Loading" .. string.rep(".", Dots)
			end
		end)
		
		local Success = true
		local ErrorMessage = nil
		
		if LoadCallback then
			local CallbackSuccess, CallbackResult = pcall(function()
				return LoadCallback(LoaderUI)
			end)
			
			if not CallbackSuccess then
				Success = false
				ErrorMessage = tostring(CallbackResult)
			end
		else
			task.wait(1)
		end
		
		task.cancel(LoadingThread)
		
		LoaderUI.ProgressFill.Size = UDim2.new(1, 0, 1, 0)
		
		if Success then
			local SuccessTween = TweenService:Create(LoaderUI.Status, LoadTweenInfo, {
				TextColor3 = Color3.fromRGB(79, 150, 99)
			})
			SuccessTween:Play()
			LoaderUI.Status.Text = "Scripts Loaded!"
			
			task.wait(1.5)
			
			local FadeOutTweenInfo = TweenInfo.new(
				0.5,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.Out
			)
			
			local WindowFade = TweenService:Create(LoaderUI["2"], FadeOutTweenInfo, {
				BackgroundTransparency = 1
			})
			
			local StrokeFade = TweenService:Create(LoaderUI["4"], FadeOutTweenInfo, {
				Transparency = 1
			})
			
			local TopBarFade = TweenService:Create(LoaderUI.Top["1"], FadeOutTweenInfo, {
				BackgroundTransparency = 1
			})
			
			local TopBarStrokeFade = TweenService:Create(LoaderUI.Top["Stroke"], FadeOutTweenInfo, {
				Transparency = 1
			})
			
			local LogoFade = TweenService:Create(LoaderUI.Top["Logo"], FadeOutTweenInfo, {
				ImageTransparency = 1
			})
			
			local TitleFade = TweenService:Create(LoaderUI.Top["3"], FadeOutTweenInfo, {
				TextTransparency = 1
			})
			
			local ContentFade = TweenService:Create(LoaderUI.Content["1"], FadeOutTweenInfo, {
				BackgroundTransparency = 1
			})
			
			local DescFade = TweenService:Create(LoaderUI.Description, FadeOutTweenInfo, {
				TextTransparency = 1
			})
			
			local ButtonFade = TweenService:Create(LoaderUI.LoadButton, FadeOutTweenInfo, {
				BackgroundTransparency = 1,
				TextTransparency = 1
			})
			
			local ButtonStrokeFade = TweenService:Create(ButtonStroke, FadeOutTweenInfo, {
				Transparency = 1
			})
			
			local StatusFade = TweenService:Create(LoaderUI.Status, FadeOutTweenInfo, {
				TextTransparency = 1
			})
			
			local ProgressBarFade = TweenService:Create(LoaderUI.ProgressBar, FadeOutTweenInfo, {
				BackgroundTransparency = 1
			})
			
			local ProgressBarStrokeFade = TweenService:Create(ProgressBarStroke, FadeOutTweenInfo, {
				Transparency = 1
			})
			
			local ProgressFillFade = TweenService:Create(LoaderUI.ProgressFill, FadeOutTweenInfo, {
				BackgroundTransparency = 1
			})
			
			WindowFade:Play()
			StrokeFade:Play()
			TopBarFade:Play()
			TopBarStrokeFade:Play()
			LogoFade:Play()
			TitleFade:Play()
			ContentFade:Play()
			DescFade:Play()
			ButtonFade:Play()
			ButtonStrokeFade:Play()
			StatusFade:Play()
			ProgressBarFade:Play()
			ProgressBarStrokeFade:Play()
			ProgressFillFade:Play()
			
			WindowFade.Completed:Connect(function()
				LoaderUI["1"]:Destroy()
			end)
		else
			local ErrorTween = TweenService:Create(LoaderUI.Status, LoadTweenInfo, {
				TextColor3 = Color3.fromRGB(150, 79, 79)
			})
			ErrorTween:Play()
			LoaderUI.Status.Text = "Error: " .. (ErrorMessage or "Unknown error")
			
			local HideProgressTween = TweenService:Create(LoaderUI.ProgressBar, LoadTweenInfo, {
				BackgroundTransparency = 1
			})
			local HideProgressStrokeTween = TweenService:Create(ProgressBarStroke, LoadTweenInfo, {
				Transparency = 1
			})
			HideProgressTween:Play()
			HideProgressStrokeTween:Play()
			LoaderUI.ProgressFill.Size = UDim2.new(0, 0, 1, 0)
			
			task.wait(1.5)
			
			local ResetTween = TweenService:Create(LoaderUI.Status, LoadTweenInfo, {
				TextColor3 = Color3.fromRGB(120, 142, 150)
			})
			ResetTween:Play()
			
			LoaderUI.Status.Text = "Ready"
		end
	end
	
	LoaderUI.LoadButton.MouseButton1Click:Connect(LoadScripts)
	
	SetupButtonHover()
	SetupButtonClick()
	
	LoaderUI["2"]["Visible"] = true
	PlayEntranceAnimation()
	
	local Dragging = false
	local DragStart = nil
	local StartPos = nil
	
	local function Update(Input)
		local Delta = Input.Position - DragStart
		LoaderUI["2"].Position = UDim2.new(
			StartPos.X.Scale,
			StartPos.X.Offset + Delta.X,
			StartPos.Y.Scale,
			StartPos.Y.Offset + Delta.Y
		)
	end
	
	LoaderUI["2"].InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			Dragging = true
			DragStart = Input.Position
			StartPos = LoaderUI["2"].Position
			
			local Connection
			Connection = Input.Changed:Connect(function()
				if Input.UserInputState == Enum.UserInputState.End then
					Dragging = false
					Connection:Disconnect()
				end
			end)
		end
	end)
	
	LoaderUI["2"].InputChanged:Connect(function(Input)
		if Dragging and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
			Update(Input)
		end
	end)
	
	LoaderUI.Top["1"].InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			Dragging = true
			DragStart = Input.Position
			StartPos = LoaderUI["2"].Position
			
			local Connection
			Connection = Input.Changed:Connect(function()
				if Input.UserInputState == Enum.UserInputState.End then
					Dragging = false
					Connection:Disconnect()
				end
			end)
		end
	end)
	
	LoaderUI.Top["1"].InputChanged:Connect(function(Input)
		if Dragging and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
			Update(Input)
		end
	end)
	
	UserInputService.InputChanged:Connect(function(Input)
		if Dragging and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
			Update(Input)
		end
	end)
	
	function LoaderUI:Destroy()
		local DestroyTweenInfo = TweenInfo.new(
			0.2,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		)
		
		local DestroyTween = TweenService:Create(LoaderUI["2"], DestroyTweenInfo, {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 480, 0, 280)
		})
		
		local StrokeDestroyTween = TweenService:Create(LoaderUI["4"], DestroyTweenInfo, {
			Transparency = 1
		})
		
		DestroyTween:Play()
		StrokeDestroyTween:Play()
		
		DestroyTween.Completed:Connect(function()
			LoaderUI["1"]:Destroy()
		end)
	end
	
	function LoaderUI:SetStatus(Text, Color)
		Color = Color or Color3.fromRGB(120, 142, 150)
		LoaderUI.Status.Text = Text
		
		local StatusTween = TweenService:Create(LoaderUI.Status, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
			TextColor3 = Color
		})
		StatusTween:Play()
	end
	
	function LoaderUI:SetLoadCallback(Callback)
		LoadCallback = Callback
	end
	
	return LoaderUI
end

return Loader
