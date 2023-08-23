
//! TEST FILE FOR TESTING GAME_UI AND LOGIC_PLAYER_PROXY WITH COOP AND MORE THAN TWO PLAYERS

printl("\ngame_ui_and_logic_playerproxy_capture.nut LOADED!!\n")

function WhoDuck(activator) {
    printl("\n" + activator + " THIS PERSON WAS ACTIVATOR OF PROXY BY DUCKING!!!\n")
    printl(activator)
    printl(activator.entindex())
    printl(activator.GetName())
}

function WhoJump(activatorz) {
    printl("\n" + activator + " THIS PERSON WAS ACTIVATOR OF PROXY FOR JUMPING!!!\n")
    printl(activator)
    printl(activator.entindex())
    printl(activator.GetName())
}

function WhoShoot(activator) {
    printl("\n" + activator + " THIS PERSON WAS ACTIVATOR OF GAME_UI BY PRESSING MOUSE BUTTON 1!!!\n")
    printl(activator)
    printl(activator.entindex())
    printl(activator.GetName())
}

