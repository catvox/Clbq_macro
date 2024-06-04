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
local Xstep = { 0, 1, -2, -3, -3, -2, -2, 1, -4, -4, -4, -4, -4, 2, -1, 1, 2, 1, 3, 4, 4, -1, -1, -5, -5, -5, -4, -2, -3, -4, -4, -3, -3, -1, 1, 1, 1, 3, 3, 3,3,3 }
local Ystep = { 0, 7, 7, 7, 7, 7, 7, 8, 9, 8, 6, 5, 3, 4, 4, 5, 7, 7, 7, 7, 7, 7, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5, 5, 5, 5, 5, 5, 5,5,5 }
local Tstep = 79
local capacity = 40

--------------------------------肩射无后座-------------------
function JNoRecoil()
    repeat
        MoveMouseRelative(JHorizontalRecoilModifier, math.random(JNoRecoilMin, JNoRecoilMax) * Sensrelative)
        Sleep(math.random(JSleepNRMin, JSleepNRMax))
    until not IsMouseButtonPressed(LC)
end

---------------------按键实现-----------------------
function OnEvent(event, arg)
    --当按下4号键时，改变开关变量（切换开关状态）
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
        elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 1) and not IsMouseButtonPressed(RC) then ----按左shift实现无后座-----
            repeat
                PressKey("lshift")
                JNoRecoil()
            until not IsMouseButtonPressed(LC)
            ReleaseKey("lshift")
        end
    end
end
