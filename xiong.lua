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
local Xstep = { 0, 0, 0, 0, 0, 1, 0, 3, 2, 2, 3, 3, 3, 3, 2, 1, -1, -1, -1, -3, -4, -3, -5, -1, -1, -1, 0, 2, 2, 2, 2, 3, 2, 1, 1, -1, -1, -2, -3, -4}
local Ystep = { 0, 5, 5, 2, 6, 6, 6, 6, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3}
local Tstep = 75
local capacity = 40
--Xstep和Ystep为每发子弹移动的像素数组，正方向分别为向右和向下
--Tstep为射击间隔
--capacity为满弹夹时子弹容量-1

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
        elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 1) and not IsMouseButtonPressed(RC) then ----按左shift实现无后座-----
            repeat
                PressKey("lshift")
                JNoRecoil()
            until not IsMouseButtonPressed(LC)
            ReleaseKey("lshift")
        end
    end
end
