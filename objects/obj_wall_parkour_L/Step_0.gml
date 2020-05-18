if obj_player.player_state = states.normal and (obj_player.bbox_left > x) and (obj_player.onground = false) mask_index = this_sprite else mask_index = -1;


//if obj_player.player_state = states.normal and (obj_player.bbox_left > x) and ( ((obj_player.move != 0) and (obj_player.vsp != 0)) or obj_player.walljumpdelay != 0 ) mask_index = this_sprite else mask_index = -1;