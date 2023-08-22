This read me is for documentation and a guide on the content in the mp_coop_itmvcoop_elements_testroom.bsp map and the instance in the map itmvcoop_start_entities.
The point of mp_coop_itmvcoop_elements_testroom.bsp is to demonstrate the different elements that are specifically in the coop edition of Into The Multiverse (ITMV).

There are hammer_notes hammer entities in each vmf with the message value asking you check for it's entry here. Because reading the message value of the entity would be tedious and
why I didn't put it in the comment section was because I thought it would be easier to have everything here in this text file. Starting with the func_instance and its 
contents then on to the actual map itself. There are two buttons also in the map for restarting the current map and switching to the mp_coop_itmvcoop_portivitygun_testroom test map. 
developer 2 is also enabled in the map so you can see the logic in action. The Portal 2: Multiplayer Mod will also be mentioned and annotated to P2MM.

NOTE: Instructor hints don't show up in the map when running the map in P2MM because instructor hints don't appear when game_text entities are active. P2MM happens to continuously
display game_text entities for displaying the players current color and when a player leaves or joins.

1: itmvcoop_start_entities.vmf func_instance
    This is the func_instance that contains the start entities for the itmvcoop session. Anything in here shouldn't need to be edited and any customization should be done 
    outside the instance through the fixup variables. Any entity in the instance that has a @ in front of the targetname should be exactly named as such as it will have some
    form of communication to and from the instance.

    1a: coop_start_entities.vmf func_instance
        These entities are in every coop Valve map, they are needed for coop to start and not create a 'Partner Disconnected' message. This also manages if the players ever
        go back to the hub which would only occur in P2MM.

    1b: Player start chambers, trigger_playerteams, and trigger_teleports
        These are the two chambers which house the spawning for both Atlas and P-Body, each chamber has a trigger_teleport which gets enabled outside the instance. The two
        trigger_playerteams are for detecting when a player joins, that way it adds the player to the coop_start_camera for P2MM support.

    1c: @coop_checkpoint_text game_text
        This text is called on for checkpoints when there isn't at least two players to activate something. The text is shown through different methods, wether touching the
        trigger that counts how many players are in the space, or pressing a button or trying to open a door. It also stores the VScript file teleport_players.nut which handles
        teleporting all players for P2MM and in the case of needing to override a teleport as seen in Part 1 when the lever for The Gyroscope is flipped. This was to ensure that
        both players, or all players in the case of P2MM, were in the chamber to witness the experiment and not get locked out.

    1d: info_targets for suppressing spawning with portal gun
        Because Valve screwed up the env_global option to supress spawning with a portal gun, they decided instead of fixing it to instead have a check at the engine level for any
        info_targets that are specifically named "supress_blue_portalgun_spawn" for Atlas or "supress_orange_portalgun_spawn" for P-Body. They do exactly as their named. Why these are
        both in the instance and will stay, even in the future parts where both players will have a portal gun, because each player will be given the special Portivity Gun. They need
        to start with no portal gun so the logic_measure_movement tracks the player correctly. There is also a game crash when the logic_measure_movement tries to track one of the coop
        players before they are fully initialized. I've also described this issue in a ITMV Discord (https://discord.com/channels/1067107185554886767/1067107186662187010/1116077444928123013).

        "I have fixed the crashing issue for coop, the issue was that logic_measure_movement doesn't like to have their target assigned to !player in coop. Normally this works because !player 
        is assigned to the first fully initialized player whether this is singleplayer or a server. In Portal 2's coop, this would be considered to be Atlas, but Valve did something backend 
        that causes coop players to not be fully initialized even after OnMapSpawn. Most likely because to ensure that both coop players are in before movement can begin. This causes Atlas 
        and P-Body to be in uninitialized states causing !player targeting to fail for the logic_measure_movement causing a game crash. Using !player_blue and !player_orange, Atlas and P-Body 
        respectively, does work as those entitles are targeting each player directly instead of whatever !player is doing before. Do note that I'm not saying !player doesn't work at all, 
        just doesn't work as intended in some scenarios."

    1e: env_globals for turning off taunting and pinging
        These env_globals are used to prevent pinging and taunting at the start and end of the map. They are also have their targetname set with @ at the beginning in case they 
        also need to be called in other parts of the map.

    1f: @coop_start_text_relay and game_texts
        This relay handles displaying the start text with title and credits. Each game_text has a configurable instance parameter variable depending on the map that the instance is in.

    1g: Start scene entities
        These entities handle the start scene and setup of the map. This logic also unlocks the trigger for P-Body to start the map after P-Body has spawned, so whoever plays P-Body 
        gets the chance to see the start scene.

2a: Five of the six required outside of instance entities to start the itmvcoop map.
    These four entities are needed to start a itmvcoop map. Teleport destinations for both atlas and pbody, a relay to handle the game_text for the title and credits, and a 
    point_servercommand named @command (this is already in most maps if the global_ents or global_ents_generic instance is used). The point_clientcommand is for players to see the start 
    scene and not the loading video.

2b: @coop_start_camera point_viewcontrol_multiplayer
    This is the camera used for the starting scene for each map. It's position and fov are customized individually for each map.

3: teleport_player.nut test buttons
    These two buttons test the functions of the teleport_player.nut script located in the @coop_checkpoint_text entity (see 1c). The level toggles whether the P2MM point_servercommand 
    entities exist. There are two different named ones because one is for the main branch of P2MM and the other is for the dev branch. Both exist for compatibility for both newer 
    and older builds of P2MM.
    3a: Press to teleport all players to blue floor target, works only when P2MM entities exist. Suppose to only happen in P2MM but the pre-made entities are there to mimic that P2MM is running.
    3b: Press to override teleport when in normal coop. See 1c for a example when a override is used.
    3c: Toggle the P2MM entities if they exist or not to teleport_players.nut. Helps for when testing the button 3a.

4: ITMV Coop Edition Checkpoints
    These three entities are used for checkpoints throughout ITMV so both players don't get separated. For the case of P2MM the teleport_player.nut makes sure everyone in the server
    is close together so as not to get left behind or confused. I opted for a math_counter and trigger_multiple instead of a logic_coop_manager and trigger_playerteam to support P2MM, 
    because some players can play as only Atlas or just P-Body, and so on and so forth. It will require at least two players, because in normal coop this is the case, and will unlock 
    or activate anything to continue on. There has been one exception though to me using a logic_coop_manager and trigger_playerteam. What I did in Part 1 in the security chamber before 
    The Gyroscope, was I replaced the one scanner before the test chamber with two individual ones for each player. I did this because of aesthetic reasons, I liked the scanner part so
    instead of having just the one I had one for each player. This way also both players can progress at the correct rate in normal coop also.