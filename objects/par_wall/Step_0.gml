if place_meeting(x,y-1,obj_player) and (obj_player.image_index = 2 or obj_player.image_index = 5) {
	
	//Add and change audio for different sound types here!!!
	switch (sound_type) {
	case "Grass":
		switch (choose(1,2,3)) {
		    case 1:
			
			//DISABLE IF STATEMENTS IF THE SOUND EFFECTS ARE LONG e.g. 0.5 secs
		//	if !audio_is_playing(snd_physStepGrass1)
		        audio_play_sound(snd_physStepGrass1,1,0);
		        break;
			case 2:
			if !audio_is_playing(snd_physStepGrass2)
				audio_play_sound(snd_physStepGrass2,1,0);
				break;
			case 3:
		//	if !audio_is_playing(snd_physStepGrass3)
				audio_play_sound(snd_physStepGrass3,1,0);
				break;
		    default:
		//	if !audio_is_playing(snd_physStepGrass1)
		        audio_play_sound(snd_physStepGrass1,1,0);
		        break;
		}
		break;
	case "Stone":
		switch (choose(1,2,3)) {
		    case 1:
			if !audio_is_playing(snd_physStepStone1)
		        audio_play_sound(snd_physStepStone1,1,0);
		        break;
			case 2:
			if !audio_is_playing(snd_physStepStone2)
				audio_play_sound(snd_physStepStone2,1,0);
				break;
			case 3:
			if !audio_is_playing(snd_physStepStone3)
				audio_play_sound(snd_physStepStone3,1,0);
				break;
		    default:
			if !audio_is_playing(snd_physStepStone1)
		        audio_play_sound(snd_physStepStone1,1,0);
		        break;
		}
		break;
	case "Dirt":
		switch (choose(1,2)) {
		    case 1:
			if !audio_is_playing(snd_physStepDirt1)
		        audio_play_sound(snd_physStepDirt1,1,0);
		        break;
			case 2:
			if !audio_is_playing(snd_physStepDirt2)
				audio_play_sound(snd_physStepDirt2,1,0);
				break;
		    default:
			if !audio_is_playing(snd_physStepDirt1)
		        audio_play_sound(snd_physStepDirt1,1,0);
		        break;
		}
		break;
	case "Metal":
		switch (choose(1,2,3)) {
		    case 1:
			if !audio_is_playing(snd_physStepMetal1)
		        audio_play_sound(snd_physStepMetal1,1,0);
		        break;
			case 2:
			if !audio_is_playing(snd_physStepMetal2)
				audio_play_sound(snd_physStepMetal2,1,0);
				break;
			case 3:
			if !audio_is_playing(snd_physStepMetal3)
				audio_play_sound(snd_physStepMetal3,1,0);
				break;
		    default:
			if !audio_is_playing(snd_physStepMetal1)
		        audio_play_sound(snd_physStepMetal1,1,0);
		        break;
		}
		break;
	case "Sand":
		switch (choose(1,2,3)) {
		    case 1:
			if !audio_is_playing(snd_physStepSand1)
		        audio_play_sound(snd_physStepSand1,1,0);
		        break;
			case 2:
			if !audio_is_playing(snd_physStepSand2)
				audio_play_sound(snd_physStepSand2,1,0);
				break;
			case 3:
			if !audio_is_playing(snd_physStepSand3)
				audio_play_sound(snd_physStepSand3,1,0);
				break;
		    default:
			if !audio_is_playing(snd_physStepSand1)
		        audio_play_sound(snd_physStepSand1,1,0);
		        break;
		}
		break;
	case "Wood":
		switch (choose(1,2)) {
		    case 1:
			if !audio_is_playing(snd_physStepWood1)
		        audio_play_sound(snd_physStepWood1,1,0);
		        break;
			case 2:
			if !audio_is_playing(snd_physStepWood2)
				audio_play_sound(snd_physStepWood2,1,0);
				break;
		    default:
			if !audio_is_playing(snd_physStepWood1)
		        audio_play_sound(snd_physStepWood1,1,0);
		        break;
		}
		break;
	
	
	default:
		show_debug_message("No sound_type declared in this wall instance!");
		break;
	}
}