// Purpose:
// Into The Multiverse uses map logic to create a portal gun
// and gravity gun combo, this portal gun + gravity gun was 
// named the Portivity Gun.
// 
// In testing the Portivity Gun does work in coop, but it only 
// works with the first player, usually Atlas, but it can also 
// be control by P-Body. Essentually Atlas has the Portivity Gun 
// but it can be controlled by both players.
//
// In testing, altering the map logic allows for Atlas to use the
// Portivity Gun seemlessly, viewmodel doesnt change though.

printl("\nportivity_gun.nut LOADED!!\n")

function PrintPlayerClass() {
    foreach (curclass in playerclasses) {
        printl(curclass)
    }
}

function init() {
    printl(playerclasses)
    local itmvplayerclasses = {}
    itmvplayerclasses.portivitygunmode <- "portal"
    playerclasses.push(itmvplayerclasses)
    printl(playerclasses)
    printl(playerclasses.itmvplayerclasses)
    printl(playerclasses.portivitygunmode)
}


function SwitchMode() {
    previousmode = c
    if (previousmode = "weapon"){
        printl("Switching to Portal mode...")
    }
    if (previousmode = "portal"){
        printl("Switching to Gravity mode...")
    }
    if (previousmode = "gravity"){
        printl("Switching to Weapon mode...")
    }
}