// Purpose:
// Into The Multiverse uses map logic to create a portal gun, gravity gun, and pellet gun
// combo, this device is named the Portivity Gun.
// 
// In testing the Portivity Gun does work in coop, but it only 
// works with the first player, usually Atlas, but it can also 
// be control by P-Body. Essentually Atlas has the Portivity Gun 
// but it can be controlled by both players.
//
// In testing, altering the map logic allows for Atlas to use the
// Portivity Gun seemlessly, viewmodel can not change though.
//
// In the Portal 2: Multiplayer Mod (P2MM), this will be harder to do, especially when it comes
// to the engine entiity limit. The Portivity Gun's gravity gun logic will have to be 
// most likely redone for this reason. As the gravity part is made of many env_enemyfinders
// and many triggers. I will try to make a seperate mode for both normal coop and P2MM. In normal coop,
// I will try automatically applying two different Portivity Gun gravity gun triggers to each player.
// I was thinking of also making another logic_measuremovement specifically for each coop player, but for
// P2MM I could take advantage instead of its own logic_measuremovement mainly for nametags, but I could
// try getting it to work with the Portivity Gun. Something I can also try to do is use a func_instance
// to create the massive trigger and other stuff for z`
//
// Process:
// In order for each player to have their own Portivity Gun, they need their own 

playerlist <- {
    testplayerentityid = {mode: "portal"}
}
function SwitchMode(player) {
    previousmode = playerlist.player.mode
    if (previousmode = "portal"){
        printl("Switching to Gravity mode...")
    }
    if (previousmode = "gravity"){
        printl("Switching to Weapon mode...")
    }
    if (previousmode = "weapon"){
        printl("Switching to Portal mode...")
        EntFireByHandle("portivity_screenoverlay", action, value, delay, player, null)
    } 
}

function init() {
    printl(playerlist.testplayerentityid.mode)
}

// Simple debug message to indicate that the script is packed and working in the map
printl("\nportivity_gun.nut LOADED!!\n")