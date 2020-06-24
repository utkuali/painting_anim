local animDict = "anim_heist@hs3f@ig11_steal_painting@male@"
local cabinet, painting, bag, knife, cam
local scene, scene2, scene3
local selection = 1
-- selection = 1 is the anim with no climbing on the cabinet (which makes cabinet almost irrelavent)
-- selection = 2 is the anim with climbing on the cabinet

function GetAnimList(animVersion)
    local animList = {
        enter = {
            player = "ver_0"..animVersion.."_top_left_enter",
            cabinet = "ver_0"..animVersion.."_top_left_enter_ch_prop_ch_sec_cabinet_02a",
            painting = "ver_0"..animVersion.."_top_left_enter_ch_prop_vault_painting_01a",
            bag = "ver_0"..animVersion.."_top_left_enter_hei_p_m_bag_var22_arm_s",
            knife = "ver_0"..animVersion.."__top_left_enter_w_me_switchblade"
        },
        idle = {
            player = "ver_0"..animVersion.."_cutting_top_left_idle",
            cabinet = "ver_0"..animVersion.."_cutting_top_left_idle_ch_prop_ch_sec_cabinet_02a",
            painting = "ver_0"..animVersion.."_cutting_top_left_idle_ch_prop_vault_painting_01a",
            bag = "ver_0"..animVersion.."_cutting_top_left_idle_hei_p_m_bag_var22_arm_s",
            knife = "ver_0"..animVersion.."_cutting_top_left_idle_w_me_switchblade"
        },
        topleft_right = {
            player = "ver_0"..animVersion.."_cutting_top_left_to_right",
            cabinet = "ver_0"..animVersion.."_cutting_top_left_to_right_ch_prop_ch_sec_cabinet_02a",
            painting = "ver_0"..animVersion.."_cutting_top_left_to_right_ch_prop_vault_painting_01a",
            bag = "ver_0"..animVersion.."_cutting_top_left_to_right_hei_p_m_bag_var22_arm_s",
            knife = "ver_0"..animVersion.."_cutting_top_left_to_right_w_me_switchblade"
        },
        topleft_right_idle = {
            player = "ver0"..animVersion.."_cutting_top_right_idle",
            cabinet = "ver0"..animVersion.."_cutting_top_right_idle_ch_prop_ch_sec_cabinet_02a",
            painting = "ver0"..animVersion.."_cutting_top_right_idle_ch_prop_vault_painting_01a",
            bag = "ver0"..animVersion.."_cutting_top_right_idle_hei_p_m_bag_var22_arm_s",
            knife = "ver0"..animVersion.."_cutting_top_right_idle_w_me_switchblade"
        },
        righttop_bottom = {
            player = "ver0"..animVersion.."_cutting_right_top_to_bottom",
            cabinet = "ver0"..animVersion.."_cutting_right_top_to_bottom_ch_prop_ch_sec_cabinet_02a",
            painting = "ver0"..animVersion.."_cutting_right_top_to_bottom_ch_prop_vault_painting_01a",
            bag = "ver0"..animVersion.."_cutting_right_top_to_bottom_hei_p_m_bag_var22_arm_s",
            knife = "ver0"..animVersion.."_cutting_right_top_to_bottom_w_me_switchblade"
        },
        righttop_bottom_idle = {
            player = "ver0"..animVersion.."_cutting_bottom_right_idle",
            cabinet = "ver0"..animVersion.."_cutting_bottom_right_idle_ch_prop_ch_sec_cabinet_02a",
            painting = "ver0"..animVersion.."_cutting_bottom_right_idle_ch_prop_vault_painting_01a",
            bag = "ver0"..animVersion.."_cutting_bottom_right_idle_hei_p_m_bag_var22_arm_s",
            knife = "ver0"..animVersion.."_cutting_bottom_right_idle_w_me_switchblade"
        },
        bottomright_left = {
            player = "ver0"..animVersion.."_cutting_bottom_right_to_left",
            cabinet = "ver0"..animVersion.."_cutting_bottom_right_to_left_ch_prop_ch_sec_cabinet_02a",
            painting = "ver0"..animVersion.."_cutting_bottom_right_to_left_ch_prop_vault_painting_01a",
            bag = "ver0"..animVersion.."_cutting_bottom_right_to_left_hei_p_m_bag_var22_arm_s",
            knife = "ver0"..animVersion.."_cutting_bottom_right_to_left_w_me_switchblade"
        },
        bottomright_left_idle = {
            player = "ver0"..animVersion.."_cutting_bottom_left_idle",
            cabinet = "ver0"..animVersion.."_cutting_bottom_left_idle_ch_prop_ch_sec_cabinet_02a",
            painting = "ver0"..animVersion.."_cutting_bottom_left_idle_ch_prop_vault_painting_01a",
            bag = "ver0"..animVersion.."_cutting_bottom_left_idle_hei_p_m_bag_var22_arm_s",
            knife = "ver0"..animVersion.."_cutting_bottom_left_idle_w_me_switchblade"
        },
        lefttop_bottom = {
            player = "ver0"..animVersion.."_cutting_left_top_to_bottom",
            cabinet = "ver0"..animVersion.."_cutting_left_top_to_bottom_ch_prop_ch_sec_cabinet_02a",
            painting = "ver0"..animVersion.."_cutting_left_top_to_bottom_ch_prop_vault_painting_01a",
            bag = "ver0"..animVersion.."_cutting_left_top_to_bottom_hei_p_m_bag_var22_arm_s",
            knife = "ver0"..animVersion.."_cutting_left_top_to_bottom_w_me_switchblade"
        },
        exit_with_painting = {
            player = "ver0"..animVersion.."_with_painting_exit",
            cabinet = "ver0"..animVersion.."_with_painting_exit_ch_prop_ch_sec_cabinet_02a",
            painting = "ver0"..animVersion.."_with_painting_exit_ch_prop_vault_painting_01a",
            bag = "ver0"..animVersion.."_with_painting_exit_hei_p_m_bag_var22_arm_s",
            knife = "ver0"..animVersion.."_with_painting_exit_w_me_switchblade"
        }
    }
    return animList
end

RegisterCommand("cabinet", function()
    local playerPed = PlayerPedId()
	local cabinet = GetClosestObjectOfType(GetEntityCoords(playerPed), 10.0, `ch_prop_ch_sec_cabinet_02a`, false, false, false)
    local painting = GetClosestObjectOfType(GetEntityCoords(playerPed), 10.0, `ch_prop_vault_painting_01a`, false, false, false)
    

	if DoesEntityExist(cabinet) then
		DeleteEntity(cabinet)
	end
	if DoesEntityExist(painting) then
		DeleteEntity(painting)
    end
    RequestModel(`ch_prop_ch_sec_cabinet_02a`)
    while not HasModelLoaded(`ch_prop_ch_sec_cabinet_02a`) do Citizen.Wait(1) end
    print("loaded 1")
    RequestModel(`ch_prop_vault_painting_01a`)
    while not HasModelLoaded(`ch_prop_vault_painting_01a`) do Citizen.Wait(1) end
    print("loaded 2")
	cabinet = CreateObject(`ch_prop_ch_sec_cabinet_02a`, 617.39, 6461.46, 29.99, true, true, false)
	SetEntityHeading(cabinet, 90.0)
	painting = CreateObject(`ch_prop_vault_painting_01a`, 617.39, 6461.46, 29.99, true, true, false)
	SetEntityHeading(painting, 90.0)
end)

RegisterCommand("anim", function()
    local anims = GetAnimList(selection)
    local playerPed = PlayerPedId()
    local playerRot = GetEntityRotation(playerPed)
    local startcartpos = GetOffsetFromEntityInWorldCoords(playerPed, vector3(0, 1, 0))

    RequestModel(`ch_prop_ch_sec_cabinet_02a`)
    while not HasModelLoaded(`ch_prop_ch_sec_cabinet_02a`) do Citizen.Wait(1) end
    cabinet = CreateObject(`ch_prop_ch_sec_cabinet_02a`, startcartpos[1], startcartpos[2], startcartpos[3] - 0.9754, true, true, false)
    SetEntityRotation(cabinet, 0.0, 0.0, playerRot[3], 2, 1)
    FreezeEntityPosition(cabinet, true)
    if selection == 1 then
        SetEntityLocallyInvisible(cabinet) -- because fuck this prop
    end
    SetModelAsNoLongerNeeded(`ch_prop_ch_sec_cabinet_02a`)

    RequestModel(`ch_prop_vault_painting_01a`) -- you can try other props too, they are in the stream folder
    while not HasModelLoaded(`ch_prop_vault_painting_01a`) do Citizen.Wait(1) end
    painting = CreateObject(`ch_prop_vault_painting_01a`, startcartpos[1], startcartpos[2], startcartpos[3] - 0.9754, true, true, false)
    SetEntityRotation(painting,  0.0, 0.0, (playerRot[3] - 180), 2, 1)
    FreezeEntityPosition(painting, true)
    SetEntityCollision(painting, false)
    SetEntityInvincible(painting, true)
    SetModelAsNoLongerNeeded(`ch_prop_vault_painting_01a`)

    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Citizen.Wait(10) end
    print("anim loaded")

    scene3 = CreateSynchronizedScene(GetEntityCoords(cabinet), 0.0, 0.0, GetEntityRotation(cabinet)[3], 2, true, false, 1065353216, 0, 1065353216)
    PlaySynchronizedEntityAnim(cabinet, scene3, anims.enter.cabinet, animDict, 1.0, -1.0, 0, 0x447a0000)
    ForceEntityAiAndAnimationUpdate(cabinet)
    PlaySynchronizedEntityAnim(painting, scene3, anims.enter.painting, animDict, 1.0, -1.0, 0, 0x447a0000)
    ForceEntityAiAndAnimationUpdate(painting)
    SetSynchronizedSceneRate(scene3, 0.0)
    SetSynchronizedScenePhase(scene3, 0.0)

    RequestModel("hei_p_m_bag_var22_arm_s")
    while not HasModelLoaded("hei_p_m_bag_var22_arm_s") do Citizen.Wait(1) end
    RequestModel("w_me_switchblade")
    while not HasModelLoaded("w_me_switchblade") do Citizen.Wait(1) end

    bag = CreateObject(`hei_p_m_bag_var22_arm_s`, startcartpos[1], startcartpos[2], startcartpos[3] - 0.9754, true, true, false)
    SetEntityRotation(bag, 0.0, 0.0, (playerRot[3] - 180), 2, 1)
    FreezeEntityPosition(bag, true)
    SetEntityCollision(bag, false, true)
    SetEntityInvincible(bag, true)
    SetModelAsNoLongerNeeded(`hei_p_m_bag_var22_arm_s`)

    knife = CreateObject(`w_me_switchblade`, startcartpos[1], startcartpos[2], startcartpos[3] - 0.9754, true, true, false)
    SetEntityRotation(switchblade, 0.0, 0.0, (playerRot[3] - 180), 2, 1)
    FreezeEntityPosition(switchblade, true)
    SetEntityCollision(switchblade, false, true)
    SetEntityInvincible(switchblade, true)
    SetModelAsNoLongerNeeded(`w_me_switchblade`)

    if GetEntityModel(playerPed) == `mp_m_freemode_01` or GetEntityModel(playerPed) == `mp_f_freemode_01` then
        SetPedComponentVariation(playerPed, 5, 0, 0, 2)
    else
        SetPedComponentVariation(playerPed, 9, 0, 0, 2)
    end
    DisplayRadar(false)
    cam = CreateCam("DEFAULT_ANIMATED_CAMERA", true)
    SetCamActive(cam, true)
    RenderScriptCams(true, 0, 3000, 1, 0)

    StartMainThread(1, anims)
end)

function StartMainThread(selection, anims)
    local playerPed = PlayerPedId()
    local paintIndex, scene = 0, nil
    local cabinetCoords, cabinetRotation = GetEntityCoords(cabinet), GetEntityRotation(cabinet)
    local paintingCoords, paintingRotation = GetEntityCoords(painting), GetEntityRotation(painting)

    SetFollowPedCamViewMode(0)
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            Debug1("paintIndex = "..paintIndex)
            Debug2("isRunning = "..tostring(IsSynchronizedSceneRunning(scene)))
            Debug3("scenePhase = "..tostring(GetSynchronizedScenePhase(scene)))
            if paintIndex == 10 then
                DisplayHelpTextThisFrame("~INPUT_MOVE_RIGHT_ONLY~ to cut right.")
            elseif paintIndex == 30 or paintIndex == 70 then
                DisplayHelpTextThisFrame("~INPUT_MOVE_DOWN_ONLY~ to cut down.")
            elseif paintIndex == 50 then
                DisplayHelpTextThisFrame("~INPUT_MOVE_LEFT_ONLY~ to cut left.")
            end

            if paintIndex == 0 then
                if not IsSynchronizedSceneRunning(scene) then
                    scene = CreateSynchronizedScene(cabinetCoords, 0.0, 0.0, cabinetRotation[3], 2, true, false, 1065353216, 0, 1065353216)
                    PlaySynchronizedEntityAnim(cabinet, scene, anims.enter.cabinet, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(cabinet)

                    TaskSynchronizedScene(playerPed, scene, animDict, anims.enter.player, 4.0, -4.0, 1033, 0, 1000.0, 0)
                    ForceEntityAiAndAnimationUpdate(playerPed)

                    PlaySynchronizedEntityAnim(painting, scene, anims.enter.painting, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(painting)

                    PlaySynchronizedEntityAnim(bag, scene, anims.enter.bag, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(bag)
                    PlaySynchronizedEntityAnim(knife, scene, anims.enter.knife, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(knife)

                    PlaySynchronizedCamAnim(cam, scene, "ver_0"..selection.."_top_left_enter_cam_re", animDict)
                elseif IsSynchronizedSceneRunning(scene) then
                    if GetSynchronizedScenePhase(scene) >= 0.99 then
                        paintIndex = 10
                    end
                end
            elseif paintIndex == 10 then
                if not IsSynchronizedSceneRunning(scene2) then
                    scene2 = CreateSynchronizedScene(cabinetCoords, 0.0, 0.0, cabinetRotation[3], 2, true, false, 1065353216, 0, 1065353216)
                    PlaySynchronizedEntityAnim(cabinet, scene2, anims.idle.cabinet, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(cabinet)

                    TaskSynchronizedScene(playerPed, scene2, animDict, anims.idle.player, 4.0, -4.0, 1033, 0, 1000.0, 0)
                    ForceEntityAiAndAnimationUpdate(playerPed)

                    PlaySynchronizedEntityAnim(painting, scene2, anims.idle.painting, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(painting)

                    PlaySynchronizedEntityAnim(bag, scene2, anims.idle.bag, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(bag)
                    PlaySynchronizedEntityAnim(knife, scene2, anims.idle.knife, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(knife)
                end
                if IsControlJustReleased(2, 35) then -- D button
                    paintIndex = 20
                end
            elseif paintIndex == 20 then
                if not IsSynchronizedSceneRunning(scene) then
                    scene = CreateSynchronizedScene(cabinetCoords, 0.0, 0.0, cabinetRotation[3], 2, true, false, 1065353216, 0, 1065353216)
                    PlaySynchronizedEntityAnim(cabinet, scene, anims.topleft_right.cabinet, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(cabinet)

                    TaskSynchronizedScene(playerPed, scene, animDict, anims.topleft_right.player, 4.0, -4.0, 1033, 0, 1000.0, 0)
                    ForceEntityAiAndAnimationUpdate(playerPed)

                    PlaySynchronizedEntityAnim(painting, scene, anims.topleft_right.painting, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(painting)

                    PlaySynchronizedEntityAnim(bag, scene, anims.topleft_right.bag, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(bag)
                    PlaySynchronizedEntityAnim(knife, scene, anims.topleft_right.knife, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(knife)

                    PlaySynchronizedCamAnim(cam, scene, "ver_0"..selection.."_cutting_top_left_to_right_cam", animDict)
                elseif IsSynchronizedSceneRunning(scene) then
                    if GetSynchronizedScenePhase(scene) >= 0.99 then
                        paintIndex = 30
                    end
                end
            elseif paintIndex == 30 then
                if not IsSynchronizedSceneRunning(scene2) then
                    scene2 = CreateSynchronizedScene(cabinetCoords, 0.0, 0.0, cabinetRotation[3], 2, true, false, 1065353216, 0, 1065353216)
                    PlaySynchronizedEntityAnim(cabinet, scene2, anims.topleft_right_idle.cabinet, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(cabinet)

                    TaskSynchronizedScene(playerPed, scene2, animDict, anims.topleft_right_idle.player, 4.0, -4.0, 1033, 0, 1000.0, 0)
                    ForceEntityAiAndAnimationUpdate(playerPed)

                    PlaySynchronizedEntityAnim(painting, scene2, anims.topleft_right_idle.painting, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(painting)

                    PlaySynchronizedEntityAnim(bag, scene2, anims.topleft_right_idle.bag, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(bag)
                    PlaySynchronizedEntityAnim(knife, scene2, anims.topleft_right_idle.knife, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(knife)
                end
                if IsControlJustReleased(2, 33) then -- S button
                    paintIndex = 40
                end
            elseif paintIndex == 40 then
                if not IsSynchronizedSceneRunning(scene) then
                    scene = CreateSynchronizedScene(cabinetCoords, 0.0, 0.0, cabinetRotation[3], 2, true, false, 1065353216, 0, 1065353216)
                    PlaySynchronizedEntityAnim(cabinet, scene, anims.righttop_bottom.cabinet, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(cabinet)

                    TaskSynchronizedScene(playerPed, scene, animDict, anims.righttop_bottom.player, 4.0, -4.0, 1033, 0, 1000.0, 0)
                    ForceEntityAiAndAnimationUpdate(playerPed)

                    PlaySynchronizedEntityAnim(painting, scene, anims.righttop_bottom.painting, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(painting)

                    PlaySynchronizedEntityAnim(bag, scene, anims.righttop_bottom.bag, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(bag)
                    PlaySynchronizedEntityAnim(knife, scene, anims.righttop_bottom.knife, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(knife)

                    PlaySynchronizedCamAnim(cam, scene, "ver_0"..selection.."_cutting_right_top_to_bottom_cam", animDict)
                elseif IsSynchronizedSceneRunning(scene) then
                    if GetSynchronizedScenePhase(scene) >= 0.99 then
                        paintIndex = 50
                    end
                end
            elseif paintIndex == 50 then
                if not IsSynchronizedSceneRunning(scene2) then
                    scene2 = CreateSynchronizedScene(cabinetCoords, 0.0, 0.0, cabinetRotation[3], 2, true, false, 1065353216, 0, 1065353216)
                    PlaySynchronizedEntityAnim(cabinet, scene2, anims.righttop_bottom_idle.cabinet, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(cabinet)

                    TaskSynchronizedScene(playerPed, scene2, animDict, anims.righttop_bottom_idle.player, 4.0, -4.0, 1033, 0, 1000.0, 0)
                    ForceEntityAiAndAnimationUpdate(playerPed)

                    PlaySynchronizedEntityAnim(painting, scene2, anims.righttop_bottom_idle.painting, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(painting)

                    PlaySynchronizedEntityAnim(bag, scene2, anims.righttop_bottom_idle.bag, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(bag)
                    PlaySynchronizedEntityAnim(knife, scene2, anims.righttop_bottom_idle.knife, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(knife)
                end
                if IsControlJustReleased(2, 34) then -- A button
                    paintIndex = 60
                end
            elseif paintIndex == 60 then
                if not IsSynchronizedSceneRunning(scene) then
                    scene = CreateSynchronizedScene(cabinetCoords, 0.0, 0.0, cabinetRotation[3], 2, true, false, 1065353216, 0, 1065353216)
                    PlaySynchronizedEntityAnim(cabinet, scene, anims.bottomright_left.cabinet, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(cabinet)

                    TaskSynchronizedScene(playerPed, scene, animDict, anims.bottomright_left.player, 4.0, -4.0, 1033, 0, 1000.0, 0)
                    ForceEntityAiAndAnimationUpdate(playerPed)

                    PlaySynchronizedEntityAnim(painting, scene, anims.bottomright_left.painting, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(painting)

                    PlaySynchronizedEntityAnim(bag, scene, anims.bottomright_left.bag, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(bag)
                    PlaySynchronizedEntityAnim(knife, scene, anims.bottomright_left.knife, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(knife)

                    PlaySynchronizedCamAnim(cam, scene, "ver_0"..selection.."_cutting_bottom_right_to_left_cam", animDict)
                elseif IsSynchronizedSceneRunning(scene) then
                    if GetSynchronizedScenePhase(scene) >= 0.99 then
                        paintIndex = 70
                    end
                end
            elseif paintIndex == 70 then
                if not IsSynchronizedSceneRunning(scene2) then
                    scene2 = CreateSynchronizedScene(cabinetCoords, 0.0, 0.0, cabinetRotation[3], 2, true, false, 1065353216, 0, 1065353216)
                    PlaySynchronizedEntityAnim(cabinet, scene2, anims.idle.cabinet, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(cabinet)

                    TaskSynchronizedScene(playerPed, scene2, animDict, anims.idle.player, 1.5, -1.0, 13, 16, 1.5, 0)
                    ForceEntityAiAndAnimationUpdate(playerPed)

                    PlaySynchronizedEntityAnim(bag, scene2, anims.idle.bag, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(bag)
                    PlaySynchronizedEntityAnim(knife, scene2, anims.idle.knife, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(knife)

                    scene3 = CreateSynchronizedScene(cabinetCoords, 0.0, 0.0, cabinetRotation[3], 2, true, false, 1065353216, 0, 1065353216)
                    PlaySynchronizedEntityAnim(painting, scene3, anims.bottomright_left.painting, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(painting)
                    SetSynchronizedSceneRate(scene3, 0.0)
                    SetSynchronizedScenePhase(scene3, 0.99)
                end
                if IsControlJustReleased(2, 33) then -- S button again
                    paintIndex = 80
                end
            elseif paintIndex == 80 then
                if not IsSynchronizedSceneRunning(scene) then
                    scene = CreateSynchronizedScene(cabinetCoords, 0.0, 0.0, cabinetRotation[3], 2, true, false, 1065353216, 0, 1065353216)
                    PlaySynchronizedEntityAnim(cabinet, scene, anims.lefttop_bottom.cabinet, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(cabinet)

                    TaskSynchronizedScene(playerPed, scene, animDict, anims.lefttop_bottom.player, 4.0, -4.0, 1033, 0, 1000.0, 0)
                    ForceEntityAiAndAnimationUpdate(playerPed)

                    PlaySynchronizedEntityAnim(painting, scene, anims.lefttop_bottom.painting, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(painting)

                    PlaySynchronizedEntityAnim(bag, scene, anims.lefttop_bottom.bag, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(bag)
                    PlaySynchronizedEntityAnim(knife, scene, anims.lefttop_bottom.knife, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(knife)

                    PlaySynchronizedCamAnim(cam, scene, "ver_0"..selection.."_cutting_left_top_to_bottom_cam", animDict)
                elseif IsSynchronizedSceneRunning(scene) then
                    if GetSynchronizedScenePhase(scene) >= 0.99 then
                        paintIndex = 90
                    end
                end
            elseif paintIndex == 90 then
                if not IsSynchronizedSceneRunning(scene2) then
                    scene2 = CreateSynchronizedScene(cabinetCoords, 0.0, 0.0, cabinetRotation[3], 2, true, false, 1065353216, 0, 1065353216)
                    PlaySynchronizedEntityAnim(cabinet, scene2, anims.righttop_bottom_idle.cabinet, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(cabinet)

                    TaskSynchronizedScene(playerPed, scene2, animDict, anims.righttop_bottom_idle.player, 4.0, -4.0, 1033, 0, 1000.0, 0)
                    ForceEntityAiAndAnimationUpdate(playerPed)

                    PlaySynchronizedEntityAnim(painting, scene2, anims.righttop_bottom_idle.painting, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(painting)

                    PlaySynchronizedEntityAnim(bag, scene2, anims.righttop_bottom_idle.bag, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(bag)
                    PlaySynchronizedEntityAnim(knife, scene2, anims.righttop_bottom_idle.knife, animDict, 1.0, -1.0, 0, 0x447a0000)
                    ForceEntityAiAndAnimationUpdate(knife)

                    PlaySynchronizedCamAnim(cam, scene, "ver_02_with_painting_exit_cam", animDict)
                elseif IsSynchronizedSceneRunning(scene2) then
                    if GetSynchronizedScenePhase(scene2) >= 0.99 then
                        paintIndex = 100
                    end
                end
            elseif paintIndex == 100 then
                DeleteEntity(bag)
                DeleteEntity(knife)
                ClearPedTasks(playerPed)

                scene3 = CreateSynchronizedScene(cabinetCoords, 0.0, 0.0, cabinetRotation[3], 2, true, false, 1065353216, 0, 1065353216)
                PlaySynchronizedEntityAnim(cabinet, scene3, anims.exit_with_painting.cabinet, animDict, 1.0, -1.0, 0, 0x447a0000)
                ForceEntityAiAndAnimationUpdate(cabinet)

                PlaySynchronizedEntityAnim(painting, scene3, anims.exit_with_painting.painting, animDict, 1.0, -1.0, 0, 0x447a0000)
                ForceEntityAiAndAnimationUpdate(painting)

                SetSynchronizedSceneRate(scene3, 0.0)
                SetSynchronizedScenePhase(scene3, 0.99)

                DisposeSynchronizedScene(scene)
                DisposeSynchronizedScene(scene2)
                print("test complete!")

                SetCamActive(cam, false)
                RenderScriptCams(false, 0, 3000, 1, 0)
                DisplayRadar(true)
                return
            end
        end
    end)
end

function DisplayHelpTextThisFrame(text)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentString(text)
    EndTextCommandDisplayHelp(0, 0, 1, -1)
end

function Debug1(txt) SetTextFont(0) SetTextProportional(0) SetTextScale(0.42, 0.42) SetTextDropShadow(0, 0, 0, 0,255) SetTextEdge(1, 0, 0, 0, 255) SetTextEntry("STRING") AddTextComponentString("~r~"..txt.."~w~") DrawText(0.5, 0.5) end
function Debug2(txt) SetTextFont(0) SetTextProportional(0) SetTextScale(0.42, 0.42) SetTextDropShadow(0, 0, 0, 0,255) SetTextEdge(1, 0, 0, 0, 255) SetTextEntry("STRING") AddTextComponentString("~r~"..txt.."~w~") DrawText(0.5, 0.6) end
function Debug3(txt) SetTextFont(0) SetTextProportional(0) SetTextScale(0.42, 0.42) SetTextDropShadow(0, 0, 0, 0,255) SetTextEdge(1, 0, 0, 0, 255) SetTextEntry("STRING") AddTextComponentString("~r~"..txt.."~w~") DrawText(0.5, 0.7) end