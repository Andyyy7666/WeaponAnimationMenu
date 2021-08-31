------------------------------------------------------------------------
------------------------------------------------------------------------
--		    Don't touch if you don't know what you're doing.		  --
--     For support join my discord: https://discord.gg/Z9Mxu72zZ6     --
--																	  --
------------------------------------------------------------------------
------------------------------------------------------------------------

local MenuOri = 0
if Config.MenuOrientation == 0 then
    MenuOri = 0
elseif Config.MenuOrientation == 1 then
    MenuOri = 1320
else
    MenuOri = 0
end

_MenuPool = NativeUI.CreatePool()
MainMenu = NativeUI.CreateMenu()

function Menu()
    local MenuTitle = ""
    if Config.MenuTitle == 0 then
        MenuTitle = "Weapon animations"
    elseif Config.MenuTitle == 1 then
        MenuTitle = GetPlayerName(source)
    elseif Config.MenuTitle == 2 then
        MenuTitle = Config.MenuTitleCustom
    else
        MenuTitle = "Weapon animations"
    end

	_MenuPool:Remove()
	_MenuPool = NativeUI.CreatePool()
	MainMenu = NativeUI.CreateMenu(MenuTitle, GetResourceMetadata(GetCurrentResourceName(), "title", 0), MenuOri)
	_MenuPool:Add(MainMenu)
	MainMenu:SetMenuWidthOffset(Config.MenuWidth)
	collectgarbage()
	
	MainMenu:SetMenuWidthOffset(Config.MenuWidth)	
	_MenuPool:ControlDisablingEnabled(false)
	_MenuPool:MouseControlsEnabled(false)


    local AimStyleMenu = _MenuPool:AddSubMenu(MainMenu, "Aim style", "", true)
    AimStyleMenu:SetMenuWidthOffset(Config.MenuWidth)
    local NormalAimstyle = NativeUI.CreateItem("Normal", "")
    local HillbillyAimstyle = NativeUI.CreateItem("Hillbilly", "")
    local GangsterAimstyle = NativeUI.CreateItem("Gangster", "")
    AimStyleMenu:AddItem(NormalAimstyle)
    AimStyleMenu:AddItem(HillbillyAimstyle)
    AimStyleMenu:AddItem(GangsterAimstyle)
    
    NormalAimstyle.Activated = function(ParentMenu, SelectedItem)
        HillbillyAS = false
        GangsterAS = false
    end
    HillbillyAimstyle.Activated = function(ParentMenu, SelectedItem)
        HillbillyAS = true
        GangsterAS = false
    end
    GangsterAimstyle.Activated = function(ParentMenu, SelectedItem)
        HillbillyAS = false
        GangsterAS = true
    end

    local HolsterStyleMenu = _MenuPool:AddSubMenu(MainMenu, "Holster style", "", true)
    HolsterStyleMenu:SetMenuWidthOffset(Config.MenuWidth)
    local DefaultHolsterStyle = NativeUI.CreateItem("Default animation", "")
    local SideHolsterStyle = NativeUI.CreateItem("Draw from belt holster", "")
    local SideLegHolsterStyle = NativeUI.CreateItem("Draw from leg holster", "")
    local FrontHolsterStyle = NativeUI.CreateItem("Draw from front", "")
    local AgressiveFrontHolsterStyle = NativeUI.CreateItem("Draw from front agressive", "")
    local BackHolsterStyle = NativeUI.CreateItem("Draw from back", "")
    HolsterStyleMenu:AddItem(DefaultHolsterStyle)
    HolsterStyleMenu:AddItem(SideHolsterStyle)
    HolsterStyleMenu:AddItem(SideLegHolsterStyle)
    HolsterStyleMenu:AddItem(FrontHolsterStyle)
    HolsterStyleMenu:AddItem(AgressiveFrontHolsterStyle)
    HolsterStyleMenu:AddItem(BackHolsterStyle)
    
    DefaultHolsterStyle.Activated = function(ParentMenu, SelectedItem)
        SideHolsterAnimation = false
        SideLegHolsterAnimation = false
        FrontHolsterAnimation = false
        AgressiveFrontHolsterAnimation = false
        BackHolsterAnimation = false
    end
    SideHolsterStyle.Activated = function(ParentMenu, SelectedItem)
        SideHolsterAnimation = true
        SideLegHolsterAnimation = false
        FrontHolsterAnimation = false
        AgressiveFrontHolsterAnimation = false
        BackHolsterAnimation = false
    end
    SideLegHolsterStyle.Activated = function(ParentMenu, SelectedItem)
        SideHolsterAnimation = false
        SideLegHolsterAnimation = true
        FrontHolsterAnimation = false
        AgressiveFrontHolsterAnimation = false
        BackHolsterAnimation = false
    end
    FrontHolsterStyle.Activated = function(ParentMenu, SelectedItem)
        SideHolsterAnimation = false
        SideLegHolsterAnimation = false
        FrontHolsterAnimation = true
        AgressiveFrontHolsterAnimation = false
        BackHolsterAnimation = false
    end
    AgressiveFrontHolsterStyle.Activated = function(ParentMenu, SelectedItem)
        SideHolsterAnimation = false
        SideLegHolsterAnimation = false
        FrontHolsterAnimation = false
        AgressiveFrontHolsterAnimation = true
        BackHolsterAnimation = false
    end
    BackHolsterStyle.Activated = function(ParentMenu, SelectedItem)
        SideHolsterAnimation = false
        SideLegHolsterAnimation = false
        FrontHolsterAnimation = false
        AgressiveFrontHolsterAnimation = false
        BackHolsterAnimation = true
    end

    local ToggleClose = NativeUI.CreateItem("Close", "Close the menu")
    MainMenu:AddItem(ToggleClose)
    ToggleClose.Activated = function(ParentMenu, SelectedItem)
        _MenuPool:CloseAllMenus()
    end

    _MenuPool:RefreshIndex()
end

if Config.StartingAimAnimation == 1 then
    HillbillyAS = false
    GangsterAS = true
elseif Config.StartingAimAnimation == 2 then
    HillbillyAS = true
    GangsterAS = false
else
    HillbillyAS = false
    GangsterAS = false
end

if Config.StartingDrawAnimation == 1 then
    SideHolsterAnimation = true
    SideLegHolsterAnimation = false
    FrontHolsterAnimation = false
    AgressiveFrontHolsterAnimation = false
    BackHolsterAnimation = false
elseif Config.StartingDrawAnimation == 2 then
    SideHolsterAnimation = false
    SideLegHolsterAnimation = true
    FrontHolsterAnimation = false
    AgressiveFrontHolsterAnimation = false
    BackHolsterAnimation = false
elseif Config.StartingDrawAnimation == 3 then
    SideHolsterAnimation = false
    SideLegHolsterAnimation = false
    FrontHolsterAnimation = false
    AgressiveFrontHolsterAnimation = false
    BackHolsterAnimation = true
elseif Config.StartingDrawAnimation == 4 then
    SideHolsterAnimation = false
    SideLegHolsterAnimation = false
    FrontHolsterAnimation = true
    AgressiveFrontHolsterAnimation = false
    BackHolsterAnimation = false
elseif Config.StartingDrawAnimation == 5 then
    SideHolsterAnimation = false
    SideLegHolsterAnimation = false
    FrontHolsterAnimation = false
    AgressiveFrontHolsterAnimation = true
    BackHolsterAnimation = false
else
    SideHolsterAnimation = false
    SideLegHolsterAnimation = false
    FrontHolsterAnimation = false
    AgressiveFrontHolsterAnimation = false
    BackHolsterAnimation = false
end

-- aim style
CreateThread(function()
    while true do
        Citizen.Wait(80)

        if GangsterAS == true then
            local ped = PlayerPedId(), DecorGetInt(PlayerPedId())
            local _, hash = GetCurrentPedWeapon(ped, 1)
            loadAnimDict2("combat@aim_variations@1h@gang")
            if IsPlayerFreeAiming(PlayerId()) or (IsControlPressed(0, 24) and GetAmmoInClip(ped, hash) > 0) then
                if not IsEntityPlayingAnim(ped, "combat@aim_variations@1h@gang", "aim_variation_a", 3) then
                    TaskPlayAnim(ped, "combat@aim_variations@1h@gang", "aim_variation_a", 8.0, -8.0, -1, 49, 0, 0, 0, 0)
                    SetEnableHandcuffs(ped, true)
                end
            elseif IsEntityPlayingAnim(ped, "combat@aim_variations@1h@gang", "aim_variation_a", 3) then
                ClearPedTasks(ped)
                SetEnableHandcuffs(ped, false)
            end
        elseif HillbillyAS == true then
            local ped = PlayerPedId(), DecorGetInt(PlayerPedId())
            local _, hash = GetCurrentPedWeapon(ped, 1)
            loadAnimDict2("combat@aim_variations@1h@hillbilly")
            if IsPlayerFreeAiming(PlayerId()) or (IsControlPressed(0, 24) and GetAmmoInClip(ped, hash) > 0) then
                if not IsEntityPlayingAnim(ped, "combat@aim_variations@1h@hillbilly", "aim_variation_a", 3) then
                    TaskPlayAnim(ped, "combat@aim_variations@1h@hillbilly", "aim_variation_a", 8.0, -8.0, -1, 49, 0, 0, 0, 0)
                    SetEnableHandcuffs(ped, true)
                end
            elseif IsEntityPlayingAnim(ped, "combat@aim_variations@1h@hillbilly", "aim_variation_a", 3) then
                ClearPedTasks(ped)
                SetEnableHandcuffs(ped, false)
            end
        end
    end
end)

-- Weapon drawing
CreateThread(function()
    while true do
        Citizen.Wait(0)

        if SideHolsterAnimation == true then
            loadAnimDict2("rcmjosh4")
            loadAnimDict2("reaction@intimidation@cop@unarmed")
            local ped = PlayerPedId()
            if not IsPedInAnyVehicle(ped, false) then
                if GetVehiclePedIsTryingToEnter (ped) == 0 and (GetPedParachuteState(ped) == -1 or GetPedParachuteState(ped) == 0) and not IsPedInParachuteFreeFall(ped) then
                    if CheckWeapon(ped) then
                        if holstered then
                            blocked   = true
                                SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
                                TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "intro", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
                                
                                    Citizen.Wait(100)
                                    SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
                                TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
                                    Citizen.Wait(400)
                                ClearPedTasks(ped)
                            holstered = false
                        else
                            blocked = false
                        end
                    else
                        if not holstered then
                                TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
                                    Citizen.Wait(500)
                                TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "outro", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
                                    Citizen.Wait(60)
                                ClearPedTasks(ped)
                            holstered = true
                        end
                    end
                else
                    SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
                end
            else
                holstered = true
            end
        elseif BackHolsterAnimation == true then
            local ped = PlayerPedId()
            loadAnimDict2("reaction@intimidation@1h")

            if not IsPedInAnyVehicle(ped, false) then
                if GetVehiclePedIsTryingToEnter (ped) == 0 and (GetPedParachuteState(ped) == -1 or GetPedParachuteState(ped) == 0) and not IsPedInParachuteFreeFall(ped) then
                    if CheckWeapon(ped) then
                        if holstered then
                            pos = GetEntityCoords(ped, true)
		                    rot = GetEntityHeading(ped)
                            blocked   = true
                                TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "intro", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.325, 0, 0)
                                    Citizen.Wait(600)
                                ClearPedTasks(ped)
                            holstered = false
                        else
                            blocked = false
                        end
                    else
                        if not holstered then
                            pos = GetEntityCoords(ped, true)
		                    rot = GetEntityHeading(ped)
                                TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "outro", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.125, 0, 0)
                                    Citizen.Wait(2000)
                                ClearPedTasks(ped)
                            holstered = true
                        end
                    end
                else
                    SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
                end
            else
                holstered = true
            end
        elseif FrontHolsterAnimation == true then
            local ped = PlayerPedId()
            loadAnimDict2("combat@combat_reactions@pistol_1h_gang")

            if not IsPedInAnyVehicle(ped, false) then
                if GetVehiclePedIsTryingToEnter (ped) == 0 and (GetPedParachuteState(ped) == -1 or GetPedParachuteState(ped) == 0) and not IsPedInParachuteFreeFall(ped) then
                    if CheckWeapon(ped) then
                        if holstered then
                            pos = GetEntityCoords(ped, true)
		                    rot = GetEntityHeading(ped)
                            blocked   = true
                                TaskPlayAnimAdvanced(ped, "combat@combat_reactions@pistol_1h_gang", "0", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.325, 0, 0)
                                    Citizen.Wait(600)
                                ClearPedTasks(ped)
                            holstered = false
                        else
                            blocked = false
                        end
                    else
                        if not holstered then
                            pos = GetEntityCoords(ped, true)
		                    rot = GetEntityHeading(ped)
                                TaskPlayAnimAdvanced(ped, "combat@combat_reactions@pistol_1h_gang", "0", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.125, 0, 0)
                                    Citizen.Wait(1000)
                                ClearPedTasks(ped)
                            holstered = true
                        end
                    end
                else
                    SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
                end
            else
                holstered = true
            end
        elseif AgressiveFrontHolsterAnimation == true then
            local ped = PlayerPedId()
            loadAnimDict2("combat@combat_reactions@pistol_1h_hillbilly")
            loadAnimDict2("combat@combat_reactions@pistol_1h_gang")

            if not IsPedInAnyVehicle(ped, false) then
                if GetVehiclePedIsTryingToEnter (ped) == 0 and (GetPedParachuteState(ped) == -1 or GetPedParachuteState(ped) == 0) and not IsPedInParachuteFreeFall(ped) then
                    if CheckWeapon(ped) then
                        if holstered then
                            pos = GetEntityCoords(ped, true)
		                    rot = GetEntityHeading(ped)
                            blocked   = true
                                TaskPlayAnimAdvanced(ped, "combat@combat_reactions@pistol_1h_hillbilly", "0", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.325, 0, 0)
                                    Citizen.Wait(600)
                                ClearPedTasks(ped)
                            holstered = false
                        else
                            blocked = false
                        end
                    else
                        if not holstered then
                            pos = GetEntityCoords(ped, true)
		                    rot = GetEntityHeading(ped)
                                TaskPlayAnimAdvanced(ped, "combat@combat_reactions@pistol_1h_gang", "0", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.125, 0, 0)
                                    Citizen.Wait(1000)
                                ClearPedTasks(ped)
                            holstered = true
                        end
                    end
                else
                    SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
                end
            else
                holstered = true
            end
        elseif SideLegHolsterAnimation == true then
            local ped = PlayerPedId()
            loadAnimDict2("reaction@male_stand@big_variations@d")

            if not IsPedInAnyVehicle(ped, false) then
                if GetVehiclePedIsTryingToEnter (ped) == 0 and (GetPedParachuteState(ped) == -1 or GetPedParachuteState(ped) == 0) and not IsPedInParachuteFreeFall(ped) then
                    if CheckWeapon(ped) then
                        if holstered then
                            pos = GetEntityCoords(ped, true)
		                    rot = GetEntityHeading(ped)
                            blocked   = true
                                TaskPlayAnimAdvanced(ped, "reaction@male_stand@big_variations@d", "react_big_variations_m", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.325, 0, 0)
                                    Citizen.Wait(500)
                                ClearPedTasks(ped)
                            holstered = false
                        else
                            blocked = false
                        end
                    else
                        if not holstered then
                            pos = GetEntityCoords(ped, true)
		                    rot = GetEntityHeading(ped)
                                TaskPlayAnimAdvanced(ped, "reaction@male_stand@big_variations@d", "react_big_variations_m", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.125, 0, 0)
                                    Citizen.Wait(500)
                                ClearPedTasks(ped)
                            holstered = true
                        end
                    end
                else
                    SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
                end
            else
                holstered = true
            end
        end
    end
end)

-- Block
CreateThread(function()
    while true do
        Citizen.Wait(0)

        if blocked then
            DisableControlAction(1, 25, true )
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
            DisableControlAction(1, 23, true)
            DisableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (TAB)
            DisablePlayerFiring(ped, true) -- Disable weapon firing
        end
    end
end)
-- Weapon drawing end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		_MenuPool:ProcessMenus()	
		_MenuPool:ControlDisablingEnabled(false)
		_MenuPool:MouseControlsEnabled(false)
		
		if Config.OpenMenu == 0 and IsControlJustPressed(1, Config.MenuButton) and GetLastInputMethod(2) then
			if not menuOpen then
				Menu()
                MainMenu:Visible(true)
            else
                _MenuPool:CloseAllMenus()
			end
		end
	end
end)

if Config.OpenMenu == 1 then
    RegisterCommand(Config.Command, function(source, args, rawCommands)
        Menu()
        MainMenu:Visible(true)
    end)
end

if Config.OpenMenu == 1 then
    Citizen.CreateThread(function()
        TriggerEvent("chat:addSuggestion", "/" .. Config.Command, "Open weapon animation menu")
    end)
end

Citizen.CreateThread(function()
    print("WeaponAnimationMenu by Andyyy#7666. If you're in need of support join the discord server: https://discord.gg/Z9Mxu72zZ6")
end)
