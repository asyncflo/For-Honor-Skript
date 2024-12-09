; For Honor Automatisierung - Parry, Block, Deflect, Dodge mit Pixelprüfung
#SingleInstance, Force
#InstallKeybdHook
#InstallMouseHook
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
SetBatchLines, -1

; Variablen
Paused := false
Active := false
ParryKey := "C"
BlockKey := "F"
DodgeKey := "V"
DeflectKey := "X"

; Farben und Pixelkoordinaten für Prüfungen (Beispiele, diese müssen an dein Spiel angepasst werden)
ParryColor := 0xFF0000 ; Rote Farbe für Parry
ParryX := 960
ParryY := 540

BlockColor := 0x00FF00 ; Grüne Farbe für Block
BlockX := 960
BlockY := 550

DeflectColor := 0x0000FF ; Blaue Farbe für Deflect
DeflectX := 960
DeflectY := 560

DodgeColor := 0xFFFF00 ; Gelbe Farbe für Dodge
DodgeX := 960
DodgeY := 570

; GUI erstellen
Gui, Font, s10, Segoe UI
Gui, Color, 1E1E1E
Gui, Add, Text, cWhite x10 y10 w300 h20, Skriptsteuerung:
Gui, Add, Button, x10 y40 w100 h30 gToggleScript, Skript An/Aus
Gui, Add, Button, x120 y40 w100 h30 gPauseScript, Pause/Fortsetzen
Gui, Add, Button, x230 y40 w100 h30 gExitScript, Beenden
Gui, Add, Text, cWhite x10 y80 w300 h20, Status: Nicht aktiv
Gui, Show, w350 h120, Automatisierungs-Skript
return

; Skript ein-/ausschalten
ToggleScript:
    Active := !Active
    if (Active) {
        SetTimer, AutoParry, 10
        SetTimer, AutoBlock, 10
        SetTimer, AutoDeflect, 10
        SetTimer, AutoDodge, 10
        GuiControl,, Static2, Status: Aktiv
    } else {
        SetTimer, AutoParry, Off
        SetTimer, AutoBlock, Off
        SetTimer, AutoDeflect, Off
        SetTimer, AutoDodge, Off
        GuiControl,, Static2, Status: Nicht aktiv
    }
return

; Skript pausieren/fortsetzen
PauseScript:
    Paused := !Paused
    if (Paused) {
        GuiControl,, Static2, Status: Pausiert
    } else {
        GuiControl,, Static2, Status: Aktiv
    }
return

; Skript beenden
ExitScript:
    ExitApp
return

; Auto-Parry Logik
AutoParry:
    if !Active or Paused
        return
    
    ; Überprüfen, ob die Farbe für Parry sichtbar ist (z. B. bei einem gegnerischen Angriff)
    PixelSearch, ParryX, ParryY, ParryX+10, ParryY+10, ParryColor, 0, Fast
    if !ErrorLevel {
        Send, %ParryKey% ; Parry-Taste simulieren
    }
return

; Auto-Block Logik
AutoBlock:
    if !Active or Paused
        return
    
    ; Blockprüfung - ähnliche Logik wie Parry
    PixelSearch, BlockX, BlockY, BlockX+10, BlockY+10, BlockColor, 0, Fast
    if !ErrorLevel {
        Send, %BlockKey% ; Block-Taste simulieren
    }
return

; Auto-Deflect Logik
AutoDeflect:
    if !Active or Paused
        return
    
    ; Deflect-Prüfung - ähnliche Logik wie Block und Parry
    PixelSearch, DeflectX, DeflectY, DeflectX+10, DeflectY+10, DeflectColor, 0, Fast
    if !ErrorLevel {
        Send, %DeflectKey% ; Deflect-Taste simulieren
    }
return

; Auto-Dodge Logik
AutoDodge:
    if !Active or Paused
        return
    
    ; Dodge-Prüfung - ähnliche Logik wie Block, Parry und Deflect
    PixelSearch, DodgeX, DodgeY, DodgeX+10, DodgeY+10, DodgeColor, 0, Fast
    if !ErrorLevel {
        Send, %DodgeKey% ; Dodge-Taste simulieren
    }
return
