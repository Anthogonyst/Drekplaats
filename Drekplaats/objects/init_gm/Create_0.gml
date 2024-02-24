/// @description Init global.myGM and ?drek
// Feather disable GM2017

if (! variable_global_exists("myGM")) {
	global.myGM = ds_map_create();
	drek = ds_map_create();
	global.myGM[? "drek"] = drek;	
	chat = array_create(250, "");
	chatpos = array_create(250, 0);
	drekbg = ds_map_create();
	global.myGM[? "drek"][? "drekbg"] = drekbg;
	drekenv = ds_map_create();
	global.myGM[? "drek"][? "drekenv"] = drekenv;
	drekscav = ds_map_create();
	global.myGM[? "drek"][? "drekscav"] = drekscav;
	voiceCreature = ds_map_create();
	global.myGM[? "drek"][? "voiceCreature"] = voiceCreature;
	drekcreature = ds_map_create();
	global.myGM[? "drek"][? "drekcreature"] = drekcreature;

	// Column length corresponds to one per character, where (5, n)
	drekchat = ds_grid_create(5, 2);
	global.myGM[? "drek"][? "drekchat"] = drekchat;
}


global.myGM[? "drek"][? "webgl"] = true;

global.myGM[? "drek"][? "food"] = 4;
global.myGM[? "drek"][? "shells"] = 3;
global.myGM[? "drek"][? "dead"] = 0;
global.myGM[? "drek"][? "win"] = 0;
global.myGM[? "drek"][? "luck"] = 0;

global.myGM[? "drek"][? "keyknife"] = 0;
global.myGM[? "drek"][? "keygun"] = 0;
global.myGM[? "drek"][? "keyfert"] = 0;
global.myGM[? "drek"][? "keycigs"] = 0;
global.myGM[? "drek"][? "keylocket"] = 0;
global.myGM[? "drek"][? "keyfly"] = 0;

global.myGM[? "drek"][? "oceanprev"] = 3;
global.myGM[? "drek"][? "oceancurr"] = 4;
global.myGM[? "drek"][? "oceantick"] = false;
global.myGM[? "drek"][? "oceanpos"] = 60;
global.myGM[? "drek"][? "oceandir"] = 1;
global.myGM[? "drek"][? "day"] = 0;
global.myGM[? "drek"][? "daytick"] = true;

var _rand = current_second;

// Map data determines where creatures live on the world map to prepare the VN scene
// Values 0-15 corresponds to the top left corner down, for columns 1, 3, 5, 7
// Values 16-24 corresponds to the connecting middle columns 2, 4, 6
drekmap = [
	"Waves", "Marsh", "Marsh", "Bramble",
	"Waves", "Marsh", "Bramble", "Woods",
	"Waves", "Woods", "Birch", "Bramble",
	"Waves", "Bramble", "Birch", "Birch",
	
	"Marsh", "Woods", "Woods",
	"Bramble", "Home", "Birch",
	"Birch", "Bramble", "Woods"
];

// Add red lizard to rightmost column
var _liz = [12, 13, 14, 15]
var _redliz = _liz[_rand % 4];
drekmap[@ _redliz] = "RedLizard";

global.myGM[? "drek"][? "drekmap"] = drekmap;
global.myGM[? "drek"][? "mapx"] = 990;
global.myGM[? "drek"][? "mapy"] = 320;
global.myGM[? "drek"][? "mapdist"] = 4;

global.myGM[? "drek"][? "chat"] = chat;
global.myGM[? "drek"][? "chatpos"] = chatpos;
global.myGM[? "drek"][? "chatlen"] = 0;
global.myGM[? "drek"][? "chatleft"] = 0;

// Initialized at map choice to contain chatterbox data and background sprite
global.myGM[? "drek"][? "chosen"] = "Intro";
global.myGM[? "drek"][? "chosenData"] = "Intro";
global.myGM[? "drek"][? "chosenBg"] = spr_treehouse;


// Connect map data in drekmap (above) to sprite index for the background in each environmental scene
drekbg[? "Birch"] = spr_birchwood;
drekbg[? "Bramble"] = spr_congested;
drekbg[? "Glacier"] = spr_snow;
drekbg[? "Home"] = spr_treehouse;
drekbg[? "Marsh"] = spr_rivergrass;
drekbg[? "Mountain"] = spr_mountain;
drekbg[? "Waves"] = spr_wavecrash;
drekbg[? "Woods"] = spr_treehouse;
drekbg[? "Debug"] = spr_wavecrash;
drekbg[? "Dead"] = spr_wavecrash;


// Connect map data in drekmap (above) to world map sprite index (see spr_drekplaats_ng_strip12)
drekenv[? "Birch"] = 4;
drekenv[? "Bramble"] = 1;
drekenv[? "Glacier"] = 10;
drekenv[? "Home"] = 0;
drekenv[? "Marsh"] = 8;
drekenv[? "Mountain"] = 10;
drekenv[? "Waves"] = 7;
drekenv[? "Woods"] = 6;
drekenv[? "Debug"] = 11;
drekenv[? "Dead"] = 11;


// Connect map data in drekmap (above) to Chatterbox chat alias (see init_chatterbox::Create.gml)
drekscav[? "Birch"] = "Birch";
drekscav[? "Bramble"] = "Bramble";
drekscav[? "Glacier"] = "Glacier";
drekscav[? "Home"] = "Home";
drekscav[? "Marsh"] = "Marsh";
drekscav[? "Mountain"] = "Mountain";
drekscav[? "Waves"] = "Waves";
drekscav[? "Woods"] = "Woods";
drekscav[? "Debug"] = "Debug";
drekscav[? "Dead"] = "Intro";


// Connect map data in drekmap (above) to the sound effect index played by their character
voiceCreature[? "Dural"] = snd_dural;
voiceCreature[? "RedLizard"] = snd_liz;


// Connect map data in drekmap (above) to drekchat grid (below) for each character's chatterbox
drekcreature[? "Dural"] = 0;
drekcreature[? "RedLizard"] = 1;


// Connect map data in drekmap (above) to character's chatterbox wheree days are experienced in sequence
// drekchat[0, n] contains the number of visits the player has experienced
// For [1, n]  [2, n]  [3, n]  it contains the chatterbox alias corresponding to visits 1/2/3
// drekchat[4, n] contains the background sprite for the character
// Grid size initialized at top of file and needs to be updated to correspond to one column per character

// Dural
drekchat[# 0, 0] = 0;
drekchat[# 1, 0] = "Dural1";
drekchat[# 2, 0] = "Dural2";
drekchat[# 3, 0] = "Dural3";
drekchat[# 4, 0] = spr_rivergrass;

// Grandpa RedLizard
drekchat[# 0, 1] = 0;
drekchat[# 1, 1] = "RedLizard1";
drekchat[# 2, 1] = "RedLizard2";
drekchat[# 3, 1] = "RedLizard3";
drekchat[# 4, 1] = spr_birchwood;

