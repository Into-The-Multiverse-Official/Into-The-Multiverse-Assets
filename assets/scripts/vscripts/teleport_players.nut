//-----------------------------------------------------//
//------------Created By: Orsell/OrsellGaming----------//
//-----------------------------------------------------//

// Purpose:
// The Into The Multiverse Coop Edition maps use point_teleports
// in order to make sure players are together and aren't left behind when
// playing the map using the Portal 2: Multiplayer Mod (P2MM).
// 
// Unfortunatly a flaw with with them is that it can't grab all players as 
// the player entity class for each player has a different targetname and using the 
// classname player and !player doesn't appear work. 
// 
// To solve this, scan for every entity with the class player, or every player 
// in the server including bots, and set all their origins to match the target point_teleport.

// Simple debug message to indicate that the script is packed and working in the map
printl("\nteleport_players.nut has loaded for P2MM support!!!\n")

// TeleportPlayers: Teleports players to the defined point_teleport
// target_point_teleport (String): Specified point_teleport targetname for teleporting to
// override (Bool) Default = false: Weither to ignore if the P2MM point_servercommand entity exists or not 
function TeleportPlayers(target_point_teleport, override = false) {
    // Setup player variable and get the point_teleport that was specified
    local player = null
    local target = Entities.FindByName(player, target_point_teleport)

    // Checks if the P2MM point_servercommand entity doesn't exists in the map
    // If it doesn't exist then that means this map isn't being run on P2MM so just return
    if (!(Entities.FindByName(player, "p2mm_command") || Entities.FindByName(player, "p2mm_servercommand")) && override == false) {
        return
    }

    // Debug message to indicate a teleport with override set to true was called
    if (override == true) {
        printl("\nTeleport override was called by teleport_players.nut!\n")
    }
    
    // Search for all entities with the class player and set their origin to the point_teleport
    while (player = Entities.FindByClassname(player, "player")) {
        player.SetOrigin(target.GetOrigin())
    }
}