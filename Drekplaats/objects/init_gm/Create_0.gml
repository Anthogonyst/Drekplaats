/// @description Init global.myGM and ?drek
// Feather disable GM2017

if (! variable_global_exists("myGM")) {
	global.myGM = ds_map_create();
}

// Init
aqua = ds_map_create();
global.myGM[? "aqua"] = aqua;

// Data
global.myGM[? "aqua"][$ "score"] = 0;
global.myGM[? "aqua"][$ "money"] = 300;
global.myGM[? "aqua"][$ "fish"] = 2;

drek = ds_map_create();
global.myGM[? "drek"] = drek;

global.myGM[? "drek"][? "webgl"] = true;

global.myGM[? "drek"][? "food"] = 3;
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
drekmap = [
	"Waves", "Marsh", "Marsh", "Bramble",
	"Waves", "Marsh", "Bramble", "Woods",
	"Waves", "Woods", "Birch", "Bramble",
	"Waves", "Bramble", "Birch", "Birch",
	
	"Marsh", "Woods", "Woods",
	"Bramble", "Home", "Birch",
	"Birch", "Bramble", "Woods"
];
var _liz = [12, 13, 14, 15]
var _redliz = _liz[_rand % 4];
drekmap[@ _redliz] = "RedLizard";

global.myGM[? "drek"][? "drekmap"] = drekmap;
global.myGM[? "drek"][? "mapx"] = 990;
global.myGM[? "drek"][? "mapy"] = 320;
global.myGM[? "drek"][? "mapdist"] = 4;

chat = array_create(250, "");
chatpos = array_create(250, 0);
global.myGM[? "drek"][? "chat"] = chat;
global.myGM[? "drek"][? "chatpos"] = chatpos;
global.myGM[? "drek"][? "chatlen"] = 0;
global.myGM[? "drek"][? "chatleft"] = 0;

global.myGM[? "drek"][? "chosen"] = "Intro";
global.myGM[? "drek"][? "chosenData"] = "Intro";
global.myGM[? "drek"][? "chosenBg"] = spr_treehouse;

drekbg = ds_map_create();
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

global.myGM[? "drek"][? "drekbg"] = drekbg;

drekenv = ds_map_create();
drekenv[? "Birch"] = 4;
drekenv[? "Bramble"] = 1;
drekenv[? "Home"] = 0;
drekenv[? "Marsh"] = 8;
drekenv[? "Waves"] = 7;
drekenv[? "Woods"] = 6;
drekenv[? "Debug"] = 10;
drekenv[? "Dead"] = 11;

global.myGM[? "drek"][? "drekenv"] = drekenv;

drekscav = ds_map_create();
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

global.myGM[? "drek"][? "drekscav"] = drekscav;

drekcreature = ds_map_create();
drekcreature[? "Dural"] = 0;
drekcreature[? "RedLizard"] = 1;

global.myGM[? "drek"][? "drekcreature"] = drekcreature;

voiceCreature = ds_map_create();
voiceCreature[? "Dural"] = snd_dural;
voiceCreature[? "RedLizard"] = snd_liz;

global.myGM[? "drek"][? "voiceCreature"] = voiceCreature;

drekchat = ds_grid_create(5, 1 + 1);

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

global.myGM[? "drek"][? "drekchat"] = drekchat;
