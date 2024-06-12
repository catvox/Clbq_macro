REEcoil = 1000
NoRecoilMin = 1
NoRecoilMax = 1
HorizontalRecoilModifier = 0
SleepNRMin = 4
SleepNRMax = 5
NoRecoilMinHIGH = 1
NoRecoilMaxHIGH = 1
HorizontalRecoilModifierHIGH = 0
SleepNRMinHIGH = 12
SleepNRMaxHIGH = 13

---------------------------Rapidfire---------------------------
PressSpeedMin = 10 --Change this			<-this is the delay between pressing and releasing left click
PressSpeedMax = 21 --Change this

NoRecoilRFMin = 6 --Change this			<-this is recoil reduction
NoRecoilRFMax = 7 --Change this


SleepNRFMin = 115 --Change this			<-this is the delay between clicks
SleepNRFMax = 138 --Change this

---------------------------JRapidfire---------------------------
PressSpeedMinHIGH = 60 --Change this			<-this is the delay between pressing and releasing left click
PressSpeedMaxHIGH = 71 --Change this

NoRecoilRFMinHIGH = 4 --Change this			<-this is recoil reduction
NoRecoilRFMaxHIGH = 5 --Change this


SleepNRFMinHIGH = 125 --Change this			<-this is the delay between clicks
SleepNRFMaxHIGH = 141 --Change this

------------------------------------------------------BINDS------------------------------------------------------

LockKey = "capslock"



LC = 1 --Left click 1 is the click type this means 3 will be right click(Only works for mousebuttons)
RC = 3 --right click



--Rapidfirebind
LCRF = 1 --just leftclick
Rapidfirebutton = 4


---------------------------Stupid math, please don't touch---------------------------

Sensrelative = REEcoil / 1000


------------------------------------------------------FUNCTIONS------------------------------------------------------		
EnablePrimaryMouseButtonEvents(true);

function RapidFire()
    repeat
        PressMouseButton(LCRF)
        Sleep(math.random(PressSpeedMin, PressSpeedMax))
        ReleaseMouseButton(LCRF)
        MoveMouseRelative(0, math.random(NoRecoilRFMin, NoRecoilRFMax) * Sensrelative)
        Sleep(math.random(SleepNRFMin, SleepNRFMax))
        MoveMouseRelative(0, math.random(NoRecoilRFMin, NoRecoilRFMax) * Sensrelative)
    until not IsMouseButtonPressed(Rapidfirebutton)
end

function JRapidFire()
    repeat
        PressMouseButton(LCRF)
        Sleep(math.random(PressSpeedMinHIGH, PressSpeedMaxHIGH))
        ReleaseMouseButton(LCRF)
        MoveMouseRelative(0, math.random(NoRecoilRFMinHIGH, NoRecoilRFMaxHIGH) * Sensrelative)
        Sleep(math.random(SleepNRFMinHIGH, SleepNRFMaxHIGH))
        MoveMouseRelative(0, math.random(NoRecoilRFMinHIGH, NoRecoilRFMaxHIGH) * Sensrelative)
    until not IsMouseButtonPressed(Rapidfirebutton)
end

function NoRecoil()
    if (HIGH_Recoil == false) then
        repeat
            MoveMouseRelative(HorizontalRecoilModifier, math.random(NoRecoilMin, NoRecoilMax) * Sensrelative)
            Sleep(math.random(SleepNRMin, SleepNRMax))
        until not IsMouseButtonPressed(LC)
    else
        repeat
            MoveMouseRelative(HorizontalRecoilModifierHIGH, math.random(NoRecoilMinHIGH, NoRecoilMaxHIGH) * Sensrelative)
            Sleep(math.random(SleepNRMinHIGH, SleepNRMaxHIGH))
            x = "no"
            seconds = GetRunningTime()
        until not IsMouseButtonPressed(LC)
    end
end

function OnEvent(event, arg)
    if IsKeyLockOn(LockKey) then
        if IsMouseButtonPressed(Rapidfirebutton) and not IsMouseButtonPressed(RC) then
            repeat
                PressKey("lshift")
                JRapidFire()
            until not IsMouseButtonPressed(Rapidfirebutton)
            if not IsMouseButtonPressed(Rapidfirebutton) then
                ReleaseKey("lshift")
            end
        end
        if IsMouseButtonPressed(RC) then
            repeat
                if IsMouseButtonPressed(Rapidfirebutton) then
                    RapidFire()
                end
            until not IsMouseButtonPressed(RC)
        end
    end
end
