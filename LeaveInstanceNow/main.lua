--https://github.com/restofurryan88/LeaveInstanceNowWowAddon

local function linPrintDebugMessage(isDebug, message)
	local baseMessage = "LIN Debugger: "
	if isDebug then
		print (baseMessage .. message)
	end
end
local linIsDebugging = false; --set to true to get debugging messages

SLASH_LIN1 = "/lin"
SlashCmdList["LIN"] = function()
	linPrintDebugMessage(linIsDebugging, "Command received")
	if not GroupFinderFrame:IsVisible() then
		PVEFrame_ShowFrame("GroupFinderFrame")
		linPrintDebugMessage(linIsDebugging, "Group finder frame opened")
	end
	LFGListFrame.EntryCreation.Name:HookScript ("OnEnterPressed", function()
			LFGListFrame.EntryCreation.ListGroupButton:Click()
		end)
	linPrintDebugMessage(linIsDebugging, "Attached press enter event to title of Start A Group frame")
	GroupFinderFrameGroupButton4:Click()
	LFGListCategorySelection_SelectCategory(LFGListFrame.CategorySelection,6,0)
	linPrintDebugMessage(linIsDebugging, "Custom group type selected")
	LFGListCategorySelectionStartGroupButton_OnClick(LFGListFrame.CategorySelection.StartGroupButton)
	linPrintDebugMessage(linIsDebugging, "Command processed")
end