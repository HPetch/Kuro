//Currently horribly broken from porting over from one of NOHUA's projects - sorry!!! -Harry

image_alpha = 0.5;
transparencyBufferHeight = 32;
springCount = ceil(sprite_width/WATERDIVISION);
springs[springCount] = 0;
springsVelocity[springCount] = 0;
springDeltaL[springCount] = 0;
springDeltaR[springCount] = 0;

k = 0.035;
d = 0.025;
spread = 0.25;
