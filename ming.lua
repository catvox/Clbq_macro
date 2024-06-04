REEcoil = 1000
--------------------------肩射后座参数------------------------
JNoRecoilMin = 1
JNoRecoilMax = 1
JHorizontalRecoilModifier = 0
JSleepNRMin = 24 --此处修改最小休眠参数			
JSleepNRMax = 25 --此处修改最大休眠参数
-----------------------------------------------------------
LC = 1
MC = 2
RC = 3 --right click
FC = 4 --right click	
LockKey = "numlock"
Sensrelative = REEcoil / 1000

EnablePrimaryMouseButtonEvents(true);
Recoil = false
-------------------------开镜后座参数------------------------
local Xstep = { 0, 1, 1, 4, 5, 5, 5, -1, 4, 5, 0, -1, -5, -5, -2, -1, -2, 3, 4, 2, 4, 4, 2, 3, 2, -1, -1, -4, -10, -10,-9}
local Ystep = { 0, 7, 7, 7, 12, 15, 15, 12, 12, 12, 8, 9, 10, 10, 8, 8, 8, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 12, 12, 12}
local Tstep = 98
local capacity = 29

--------------------------------肩射无后座-------------------
function JNoRecoil()
    repeat
        MoveMouseRelative(JHorizontalRecoilModifier, math.random(JNoRecoilMin, JNoRecoilMax) * Sensrelative)
        Sleep(math.random(JSleepNRMin, JSleepNRMax))
    until not IsMouseButtonPressed(LC)
end

---------------------按键实现-----------------------
function OnEvent(event, arg)
    if IsKeyLockOn(LockKey) then
        if (event == "MOUSE_BUTTON_PRESSED" and arg == 1) and IsMouseButtonPressed(3) then
            Sleep(4)
            for i = 1, capacity do
                if (IsMouseButtonPressed(1) == false) then
                    OutputLogMessage("break\n")
                    break
                end
                MoveMouseRelative(Xstep[i], Ystep[i])
                Sleep(Tstep)
            end
            OutputLogMessage("end\n")
        elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 1) and not IsMouseButtonPressed(RC) then
            repeat
                PressKey("lshift")
                JNoRecoil()
            until not IsMouseButtonPressed(LC)
            Sleep(math.random(5,8))
            ReleaseKey("lshift")
        end
    end
end
