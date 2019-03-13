//imports------------------------------------------------------------------------
//pathfinder------------------------------------------------------------------------
import ai.pathfinder.*;
//sound------------------------------------------------------------------------
import ddf.minim.*;
//Game-related variables------------------------------------------------------------------------
//images and variabes dealing with the screen.------------------------------------------------------------------------
int screen = 0;
int level = 1;
int reset = 0;
int refresh = 0;
int upgradeTemp = 0;
int lightning = 0;
float lightNumber = 0, strike = 10;
PImage fire1, fire2, titleImage, titleImage2, lightning1, 
lightning2, lightning3, grass, concrete, bullet, explosive, 
mineG, spikeInd, instructions;
PImage[] levelImage = new PImage[11];
PImage[] pf = new PImage[4];
PImage[] pb = new PImage[4];
PImage[] pl = new PImage[4];
PImage[] pr = new PImage[4];
PImage[] zf = new PImage[4];
PImage[] zb = new PImage[4];
PImage[] zr = new PImage[4];
PImage[] zl = new PImage[4];
PImage[] gzf = new PImage[4];
PImage[] gzb = new PImage[4];
PImage[] gzr = new PImage[4];
PImage[] gzl = new PImage[4];
PImage[] dzf = new PImage[4];
PImage[] dzb = new PImage[4];
PImage[] dzr = new PImage[4];
PImage[] dzl = new PImage[4];
PImage[] qzf = new PImage[4];
PImage[] qzb = new PImage[4];
PImage[] qzr = new PImage[4];
PImage[] qzl = new PImage[4];
PImage[] mzf = new PImage[4];
PImage[] mzb = new PImage[4];
PImage[] mzr = new PImage[4];
PImage[] mzl = new PImage[4];
PImage[] jf = new PImage[4];
PImage[] jb = new PImage[4];
PImage[] jr = new PImage[4];
PImage[] jl = new PImage[4];
PImage[] jbf = new PImage[4];
PImage[] jbb = new PImage[4];
PImage[] jbr = new PImage[4];
PImage[] jbl = new PImage[4];
PImage[] zrf = new PImage[4];
PImage[] zrb = new PImage[4];
PImage[] zrr = new PImage[4];
PImage[] zrl = new PImage[4];
PImage[] dgzf = new PImage[4];
PImage[] dgzb = new PImage[4];
PImage[] dgzr = new PImage[4];
PImage[] dgzl = new PImage[4];
PImage[] szf = new PImage[4];
PImage[] szb = new PImage[4];
PImage[] szr = new PImage[4];
PImage[] szl = new PImage[4];
PImage[] spike = new PImage[4];
PImage[] portal = new PImage[4];
PImage[] zrdf = new PImage[4];
PImage[] story = new PImage[159];
PImage web;
PImage[] eb = new PImage[2];
PImage[] rtb = new PImage[2];
PImage[] rtf = new PImage[2];
PImage[] rtl = new PImage[2];
PImage[] rtr = new PImage[2];
PImage[] etb = new PImage[2];
PImage[] etf = new PImage[2];
PImage[] etl = new PImage[2];
PImage[] etr = new PImage[2];
PImage[] sftb = new PImage[2];
PImage[] sftf = new PImage[2];
PImage[] sftl = new PImage[2];
PImage[] sftr = new PImage[2];
PImage[] st = new PImage[2];
PImage[] so = new PImage[2];
PImage[] egg = new PImage[2];
PImage[] bo = new PImage[2];
PImage[] ebs = new PImage[2];
PImage[] szdf = new PImage[4];
PImage go;
PImage upgrade_screen;
PImage iemissioner;
PImage igrenade;
PImage iheart;
PImage imine;
PImage ichain;
PImage ipistol;
PImage iredpepper;
PImage iresource;
PImage ishotgun;
PImage ismallfry;
PImage iwebgun;
//sounds
AudioPlayer titleMusic, levelMusic, bossMusic1, bossMusic2, bossMusic3, 
loseMusic, storyMusic, upgradeMusic, music, creditMusic;
Minim minim = new Minim(this);
//lists and entity counters for every object displayed on screen------------------------------------------------------------------------
ArrayList chasers;
ArrayList bullets;
ArrayList turrets;
ArrayList resources;
int newScreen = 0;
int num_enemies=0;
int num_turrets=0;
int num_bullets=0;
int num_resources;
//which direction the enemy/player is facing------------------------------------------------------------------------
int z_dir = 0;
//which slide of the story the game is on
int storySlide = 0;
Pathfinder astar;
//variables used for pathfinder------------------------------------------------------------------------
ArrayList path = new ArrayList();
Player p= new Player(0, new PVector(300, 400), new PVector(0, 0), 100000, 50);
int w = 70;
int h = 40;
int moveN = 0;
int buttonUp =0, buttonDown = 0, buttonLeft = 0, buttonRight =0;
int spacing;
PFont font;
//which screen are we on------------------------------------------------------------------------
boolean PLAYING=false;
boolean LOSING=false;
boolean CONTINUE=false;
boolean CREDITS=false;
boolean TITLE=true;
boolean UPGRADE=false;
boolean INSTRUCTIONS=false;
boolean STORYS= false;
final int EXPLODE = -99;
//variables for wave mechanics------------------------------------------------------------------------
int frame=0;
int frame3=0;
int wave_frame=0;
int score=0;
int reload=0;
int bullets_remaining=5;
int num_waves=1;
int total_waves;
int wave_enemies;
int wave_killed=0;
int wave_spawned=0;
int wave_start = 0;
//final boss globals------------------------------------------------------------------------
boolean charging=false;
int fb_count = 0;
int boss_shield=0;
boolean boss_disabled=true;
PVector boss_portal_pos=new PVector(100, 100);
float base_health=20;
//UpgradeScreen------------------------------------------------------------------------
String utext="";
boolean PISTOL=true;
float damage0=0;
float pierce0=0;
boolean MINE=false;
float damage1=0;
boolean SHOTGUN=false;
float damage3=0;
float reload3=0;
boolean CHAINGUN=false;
float damage5=0;
float reload5=0;
boolean GRENADE=false;
float damage4=0;
boolean WEBGUN=false;
float time6=0;
float reload6=0;
boolean SMALLFRY=true;
float pierce10=0;
boolean ORBULATOR=false;
float damage2=0;
float reload2=0;
boolean REDPEPPER=true;
float reload7=0;
boolean EMISSIONER=false;
float reload8=0;

boolean moveOn = false;
//Credit related variables
int credit_y;
int newLevel = 0;
PFont credit_font;
Confetti[] c = new Confetti[100];

//this class deas with the confetti on the credits screen------------------------------------------------------------------------
class Confetti {
  float x_pos;
  float y_pos;
  float speed;
  float colour;
  float r;
  float g;
  float b;
  Confetti(float temp_x_pos, float temp_y_pos, float temp_speed, float temp_r, float temp_g, float temp_b) {
    x_pos= temp_x_pos;
    y_pos= temp_y_pos;
    speed=temp_speed;
    r=temp_r;
    g=temp_g;
    b=temp_b;
  }

  void display_fetti() {
    fill(r, g, b);
    rect(x_pos, y_pos, 10, 10);
  }
  void move_fetti(float dir) {
    y_pos+=speed;
    x_pos+=dir;
    if (y_pos>630) {
      y_pos=130;
      x_pos=random(570)+400;
    }
  }
  void switch_fetti(float dir) {
    x_pos+=dir;
  }
}
//this displays the animations and image that is the title screen------------------------------------------------------------------------
void titleScreen() {
  background(255, 255, 255);
  image(titleImage2, 0, 0, 1120, 640);
  textFont(credit_font, 58);
  fill(0);
  text("Two Brothers", 352, 334);
  textFont(credit_font, 32);
  text("Press ENTER to start", 368, 374);

  if (frame < 15 ) {
    image(fire1, 60, 185, 80, 100);
    image(fire1, 960, 150, 80, 100);
    image(fire1, 785, 57, 52, 65);
  } else {
    image(fire2, 60, 185, 80, 100);
    image(fire2, 960, 150, 80, 100);
    image(fire2, 785, 57, 52, 65);
  }
  //chooses a lightning bolt to display------------------------------------------------------------------------
  if (frame % 5 == 0) {
    lightning ++;
  }
  if (lightning < 4) {
    if (lightNumber >= 0 && lightNumber < 9) {
      image(lightning2, 100, 0, 80, 100);
    }
    if (lightNumber >= 9 && lightNumber < 18) {
      image(lightning1, 375, 00, 80, 100);
    }
    if (lightNumber >= 18 && lightNumber < 27) {
      image(lightning2, 600, 0, 80, 100);
    }
    if (lightNumber >= 27 && lightNumber < 28) {
      image(lightning2, 100, 0, 80, 100); 
      image(lightning2, 600, 0, 80, 100);
    }
    if (lightNumber >= 28 && lightNumber < 29) {
      image(lightning1, 375, 00, 80, 100);
      image(lightning2, 600, 0, 80, 100);
    }
    if (lightNumber >= 29) {
      image(lightning2, 600, 0, 80, 100);
      image(lightning2, 100, 0, 80, 100);
    }
  }
  //randomized lightning appearance ------------------------------------------------------------------------
  if (lightning >= strike) {
    lightNumber = random(30);
    lightning = 0;
    strike = random(10)+5;
  }
}

//credits ------------------------------------------------------------------------
void credit() {
  //scrolling credits
  credit_y-=5;
  textFont(credit_font, 32);
  fill(250, 250, 250);
  text("The End", 0, credit_y-32*10); 
  fill(210, 75, 30);
  text("Programmers", 0, credit_y+32); 
  fill(125, 125, 255);
  text("Daniel Lau", 0, credit_y+32*3); 
  text("Jeremy Denhartogh", 0, credit_y+32*5); 
  fill(210, 75, 30);
  text("Level Design", 0, credit_y+32*8); 
  fill(125, 125, 255);
  text("Jeremy Denhartogh", 0, credit_y+32*11); 
  fill(210, 75, 30);
  text("Boss Design", 0, credit_y+32*14); 
  fill(125, 125, 255);
  text("Daniel Lau", 0, credit_y+32*17);
  text("Jeremy Denhartogh", 0, credit_y+32*19); 
  fill(210, 75, 30);
  text("Gun Design", 0, credit_y+32*22); 
  fill(125, 125, 255);
  text("Daniel Lau", 0, credit_y+32*25); 
  fill(210, 75, 30);
  text("Artificial Intelligence", 0, credit_y+32*28); 
  fill(125, 125, 255);
  text("Jeremy Denhartogh", 0, credit_y+32*31); 
  fill(210, 75, 30);
  text("Enemy Design", 0, credit_y+32*34); 
  fill(125, 125, 255);
  text("Daniel Lau", 0, credit_y+32*36); 
  text("Jeremy Denhartogh", 0, credit_y+32*38);
  fill(210, 75, 30);
  text("Graphics", 0, credit_y+32*41); 
  fill(125, 125, 255);
  text("Thomas Reese", 0, credit_y+32*44);
  fill(210, 75, 30);
  text("Writer", 0, credit_y+32*47); 
  fill(125, 125, 255);
  text("Daniel Lau", 0, credit_y+32*50); 
  fill(210, 75, 30);
  text("Other Stuff", 0, credit_y+32*53); 
  fill(125, 125, 255);
  text("Daniel Lau", 0, credit_y+32*55); 
  text("Jeremy Denhartogh", 0, credit_y+32*57);
  text("Thomas Reese", 0, credit_y+32*59);
  if (credit_y+32*59<0) {
    credit_y=1100;
  }
  //static words
  textSize(80);
  fill(255, 130, 100);
  text("Well Played!", 400, 120);
}
//this function computes the distance between to PVectors and returns a float------------------------------------------------------------------------
float dist_between(PVector obj1, PVector obj2) {
  float dx=(obj1.x-obj2.x);
  float dy=(obj1.y-obj2.y);
  float dist=sqrt(dx*dx+dy*dy);
  return dist;
}

//advances the player to the next level------------------------------------------------------------------------
void nextLevel() {
  //deducts resources collected on lvl 2 because they are used to fix a car------------------------------------------------------------------------
  newScreen = 0;
  if (level == 2) {
    p.resource -= 300;
    moveOn = false;
  }  
  //initialized basehealth for base defence level ------------------------------------------------------------------------
  if (level == 4) {//base defence
    moveOn=false;
    base_health=20;
  }  
  if (level == 7) {
    p.resource -= 600;
    moveOn = false;
  }  
  //initialized basehealth for base defence level ------------------------------------------------------------------------
  if (level == 8) {//base defence
    moveOn=false;
    base_health=20;
  } 
  //makes you restart the level
  if (LOSING) {
    level --;
    reset = 1;
    moveOn = false;
  }
  //pathfinding cuboid nodes spaced based on w/h and spacing varibles. 
  astar.setCuboidNodes(w, h, spacing);
  astar.radialDisconnectUnwalkables();
  //resetting player values------------------------------------------------------------------------
  num_waves=1; 
  p.health=100000;
  p.pos.x=width/2;
  p.pos.y=height/2;
  if (p.resource < 0) {
    p.loonies+=p.resource;
  }
  p.resource=50;
  //removing all objects(except the player) from the screen------------------------------------------------------------------------

  for (int i=0; i<num_enemies; i++) {
    chasers.remove(i);
    num_enemies--;
    i--;
  }

  for (int i=0; i<num_bullets; i++) {
    bullets.remove(i);
    num_bullets--;
    i--;
  }
  for (int i=0; i<num_turrets; i++) {
    turrets.remove(i);
    num_turrets--;
    i--;
  }
  for (int i=0; i<num_resources; i++) {
    resources.remove(i);
    num_resources--;
    i--;
  }
  level ++;
  newLevel = 0;
  boss_disabled = true;
  CONTINUE=false;
  LOSING = false;
  PLAYING = false;
  UPGRADE = false;
  if (reset == 0) {
    STORYS = true;
  } else {
    STORYS = false;
    PLAYING = true;
    reset = 0;
  }
}


//player class
class Player {
  PVector pos;
  PVector v;
  float health;
  int weapon;
  int resource;
  float charge;
  float shoot_speed;
  float reloading;
  boolean machine_gun;
  float slow;
  boolean slowed;
  float slow_time;
  boolean poisoned;
  float poison;
  float poison_time;
  int loonies;
  Player(int temp_weapon, PVector temp_pos, PVector temp_v, float temp_health, int temp_resource) {
    pos=temp_pos;
    v=temp_v;
    health=temp_health;
    weapon=temp_weapon;
    resource=temp_resource;
    charge=0;
    shoot_speed=15;
    machine_gun=false;
    slow=1.0;
    slowed=false;
    slow_time=0;
    poisoned=false;
    poison=0.1;
    poison_time=0;
    loonies=0;
  }
  //displays the player------------------------------------------------------------------------
  void display(int moveNum) {
    fill(100, 0, 0);
    if (this.reloading<this.shoot_speed) {
      fill(255, 0, 0);
    } else {
      fill(0, 255, 0);
    }

    imageMode(CENTER);
    PVector mouse = new PVector (mouseX, mouseY);
    float x_dist = ((mouseX-pos.x));
    float y_dist = (abs(mouseY-pos.y));
    float angle = degrees(atan(x_dist/y_dist));
    //displays image based on mouse location compared to player loation------------------------------------------------------------------------
    if (angle >=-90 && angle < -45) {
      image(pl[moveNum], this.pos.x, this.pos.y, 32, 32);
    }
    if (angle >45 && angle <= 90) {
      image(pr[moveNum], this.pos.x, this.pos.y, 32, 32);
    }
    if (angle >=-45 && angle <=45) {
      if (mouseY >= pos.y) {
        image(pf[moveNum], this.pos.x, this.pos.y, 32, 32);
      } else {
        image(pb[moveNum], this.pos.x, this.pos.y, 32, 32);
      }
    }
  } 

  void move() { 
    keyCheck(); 
    if (this.pos.x>1000&&CONTINUE==true) { 
      nextLevel();
    }
    float prev_x = this.pos.x;
    float prev_y = this.pos.y;
    this.pos.x+=this.v.x*this.slow; 
    //Doesn't alow the player to move on an unwalkable node------------------------------------------------------------------------
    Node temp = (Node)astar.nodes.get((int)(p.pos.x/16)+ (70*(int)(p.pos.y/16)));
    if (temp.walkable) {
    } else {
      if (prev_x!=this.pos.x) { 
        this.pos.x = prev_x;
      }
    }
    this.pos.y+=this.v.y*this.slow; 
    temp = (Node)astar.nodes.get((int)(p.pos.x/16)+ (70*(int)(p.pos.y/16)));

    if (temp.walkable) {
    } else {
      if (prev_y!=this.pos.y) { 
        this.pos.y = prev_y;
      }
    }
    if (this.pos.x+16>=1120) { 
      this.pos.x -= 3;
    } 
    if (this.pos.x-16<=0) { 
      this.pos.x += 3;
    } 
    if (this.pos.y-16<=0) { 
      this.pos.y += 3;
    } 
    if (this.pos.y+16>=640) { 
      this.pos.y -= 3;
    }
  }
}
//chaser class ------------------------------------------------------------------------
class Chaser {
  PVector pos;
  PVector target;
  float health;
  int type;
  int reload;
  int moveZ;
  float slow;
  int mother_target;
  int eggHatch;
  int motherSpawn;
  int death;
  float damage;
  int shots;
  int shots2;
  boolean cooldown;
  float boss_reload1;
  float boss_reload2;
  float boss_reload3;
  float boss_reload4;
  float boss_reload5;
  float theta;
  float bc;
  float red;
  float green;
  float maxHealth;
  int portal_pos;
  boolean cooldown2;
  float tendril_time;
  Node node = (Node)astar.nodes.get((int)0);
  //(0 - Normal), (1 - Shooters), (2 - Turret Chasers), (3 - Juggernaut), (4 - Rager) , (5 - Mother) 
  //(6 - Slower), (7 - Boss1), (8 - MotherBoss), (9 - Portal), (10 - Shield)
  //(11 - Tendril), (12 - Tendril Target), (13 - JuggerGhost Boss),(14 - Ghosts)
  Chaser(PVector temp_pos, float temp_health, int temp_type, int temp_moveZ, int eggs) {
    pos=temp_pos;
    health=temp_health;
    type = temp_type;
    reload = 0;
    moveZ = temp_moveZ;
    slow=1.0;
    mother_target = 0;
    eggHatch = eggs;
    motherSpawn = 0;
    death = 0;
    bc = 0;
    green = 255;
    red = 0;
    maxHealth = 0;
    node = (Node)astar.nodes.get((int)0);
    //intiailizing health/movement values based on enemy type------------------------------------------------------------------------
    if (this.type==0) {
      this.health=40;
      this.maxHealth = 40;
    } else if (this.type==1) {
      this.health=30;
      this.maxHealth = 30;
    } else if (this.type==2) {
      this.health=100;
      this.maxHealth = 100;
    } else if (this.type==3) {
      this.health=400;
      this.maxHealth = 400;
    } else if (this.type==4) {
      this.health=15;
      this.maxHealth = 15;
    } else if (this.type == 5) {
      this.health = 200;
      this.maxHealth = 200;
    } else if (this.type==6) {
      this.health=20;
      this.maxHealth = 20;
    } else if (this.type==7) {
      this.boss_reload1=0;
      this.boss_reload2=0;
      this.boss_reload3=0;
      this.boss_reload4=0;
      this.boss_reload5=0;
      this.shots=0;
      this.shots2=0;
      this.cooldown=false;
      this.cooldown2=false;
      this.health=10000;
      this.maxHealth = 10000;
      this.pos.x=width/2;
      this.pos.y=height/2;
    } else if (this.type==8) {
      this.health=2000;
      this.maxHealth = 2000;
    } else if (this.type==9) {
      this.health=1000;
      this.maxHealth = 1000;
      //random portal respawning location ------------------------------------------------------------------------
      this.portal_pos=int(random(0, 4));
      if (portal_pos==0) {
        this.pos.x=100;
        this.pos.y=100;
        boss_portal_pos.x=100;
        boss_portal_pos.y=100;
      } else if (portal_pos==1) {
        this.pos.x=width-100;
        this.pos.y=100;
        boss_portal_pos.x=width-100;
        boss_portal_pos.y=100;
      } else if (portal_pos==2) {
        this.pos.x=100;
        this.pos.y=height-100;
        boss_portal_pos.x=100;
        boss_portal_pos.y=height-100;
      } else if (portal_pos==3) {
        this.pos.x=width-100;
        this.pos.y=height-100;
        boss_portal_pos.x=width-100;
        boss_portal_pos.y=height-100;
      }
    } else if (this.type==10) {
      this.theta=0;
      this.health=999999;
      this.pos.y-=59;//arbitrary value; i just guessed
    } else if (this.type==11) {
      this.health=100;
    } else if (this.type==12) {
      this.health=100;
      this.tendril_time=0;
    } else if (this.type==13) {
      this.health=3000;
      this.maxHealth = 3000;
    } else if (this.type==14) {
      this.health=30;
    }
  }

  void display() {
    fill(0, 100, 0);
    moveZ ++;
    if (moveZ == 32) {
      moveZ = 0;
    }
    if (this.type==14) {
      fill(200, 200, 200);
      ellipse(this.pos.x, this.pos.y, 16, 16);
    }
    if (this.type < 0 && this.health > 0) {
      if (eggHatch > 8) {
        image(egg[0], this.pos.x, this.pos.y, 32, 32);
      } else {
        image(egg[1], this.pos.x, this.pos.y, 32, 32);
      }
    }
    if ((this.type == 0 || type == 2)&& this.health>0) {
      if (z_dir == 1) {
        image(zb[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 0) {
        image(zf[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 2) {
        image(zr[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 3) {
        image(zl[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
    }
    if ((this.type == 3  || this.type ==5 || this.type == 7 || this.type ==8  ||this.type==0||this.type==2) && this.health<=0) {
      if (z_dir == 1) {
        image(dzb[(int)death/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 0) {
        image(dzf[(int)death/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 2) {
        image(dzr[(int)death/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 3) {
        image(dzl[(int)death/8], this.pos.x, this.pos.y, 32, 32);
      }
    }
    if (this.type == 1 && this.health>0) {
      if (z_dir == 1) {
        image(gzb[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 0) {
        image(gzf[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 2) {
        image(gzr[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 3) {
        image(gzl[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
    }
    if (this.type == 1 && this.health<=0) {
      if (z_dir == 1) {
        image(dgzb[(int)death/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 0) {
        image(dgzf[(int)death/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 2) {
        image(dgzr[(int)death/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 3) {
        image(dgzl[(int)death/8], this.pos.x, this.pos.y, 32, 32);
      }
    }
    if (this.type == 4 && this.health<=0) {
      if (z_dir == 1) {
        image(zrdf[(int)death/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 0) {
        image(zrdf[(int)death/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 2) {
        image(zrdf[(int)death/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 3) {
        image(zrdf[(int)death/8], this.pos.x, this.pos.y, 32, 32);
      }
    }
    if (this.type == 6 && this.health<=0) {
      if (z_dir == 1) {
        image(szdf[(int)death/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 0) {
        image(szdf[(int)death/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 2) {
        image(szdf[(int)death/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 3) {
        image(szdf[(int)death/8], this.pos.x, this.pos.y, 32, 32);
      }
    }
    if (this.type == 3 && this.health >0) {
      if (z_dir == 1) {
        image(jb[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 0) {
        image(jf[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 2) {
        image(jr[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 3) {
        image(jl[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
    }
    if (this.type == 13 && this.health >0) {
      if (z_dir == 1) {
        image(jbb[(int)moveZ/8], this.pos.x, this.pos.y, 64, 64);
      }
      if (z_dir == 0) {
        image(jbf[(int)moveZ/8], this.pos.x, this.pos.y, 64, 64);
      }
      if (z_dir == 2) {
        image(jbr[(int)moveZ/8], this.pos.x, this.pos.y, 64, 64);
      }
      if (z_dir == 3) {
        image(jbl[(int)moveZ/8], this.pos.x, this.pos.y, 64, 64);
      }
    }
    if (this.type == 13 && this.health<=0) {
      frame3 = 151;
      if (z_dir == 1) {
        image(dzb[(int)death/8], this.pos.x, this.pos.y, 64, 64);
      }
      if (z_dir == 0) {
        image(dzf[(int)death/8], this.pos.x, this.pos.y, 64, 64);
      }
      if (z_dir == 2) {
        image(dzr[(int)death/8], this.pos.x, this.pos.y, 64, 64);
      }
      if (z_dir == 3) {
        image(dzl[(int)death/8], this.pos.x, this.pos.y, 64, 64);
      }
    }
    if (this.type == 4 && this.health >0) {
      if (z_dir == 1) {
        image(zrb[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 0) {
        image(zrf[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 2) {
        image(zrr[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 3) {
        image(zrl[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
    }
    if (this.type == 5 && this.health >0) {
      if (z_dir == 1) {
        image(mzb[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 0) {
        image(mzf[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 2) {
        image(mzr[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 3) {
        image(mzl[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
    }
    if (this.type == 6 && this.health >0) {
      if (z_dir == 1) {
        image(szb[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 0) {
        image(szf[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 2) {
        image(szr[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
      if (z_dir == 3) {
        image(szl[(int)moveZ/8], this.pos.x, this.pos.y, 32, 32);
      }
    }
    if (this.type == 8 && this.health >0) {
      if (z_dir == 1) {
        image(qzb[(int)moveZ/8], this.pos.x, this.pos.y, 64, 64);
      }
      if (z_dir == 0) {
        image(qzf[(int)moveZ/8], this.pos.x, this.pos.y, 64, 64);
      }
      if (z_dir == 2) {
        image(qzr[(int)moveZ/8], this.pos.x, this.pos.y, 64, 64);
      }
      if (z_dir == 3) {
        image(qzl[(int)moveZ/8], this.pos.x, this.pos.y, 64, 64);
      }
    }
    if (this.type==7 && this.health > 0) {
      fb_count ++;
      if (fb_count >= 16) {
        fb_count = 0;
      }
      image(ebs[(int)fb_count/8], this.pos.x, this.pos.y, 64, 64);
    }
    if (this.type==9) {
      bc++;   
      if (bc == 32) {
        bc = 0;
      }
      image(portal[(int)bc/8], this.pos.x, this.pos.y, 32, 32);
    }    
    if (this.type==10) {
      bc++;   
      if (bc == 16) {
        bc = 0;
      }
      image(bo[(int)bc/8], this.pos.x, this.pos.y, 32, 32);
    }    
    if (this.type==11) {
      if (tendril_time < 20) {
        image(spike[(int)tendril_time/5], this.pos.x, this.pos.y, 32, 32);
      } else if (tendril_time < 40) {
        image(spike[7-((int)tendril_time/5)], this.pos.x, this.pos.y, 32, 32);
      }
    }    
    if (this.type==12) {
      image(spikeInd, this.pos.x, this.pos.y, 32, 32);
    }

    fill(0);
    textSize(8);
    if (this.type <= 9||this.type==13) {
      rect (this.pos.x, this.pos.y-22, 32, 8);
      rectMode(CORNER);
      this.green = (this.health*510)/(this.maxHealth);
      if (this.green <= 255) {
        this.red = 255;
      } else {
        this.red = (1 - this.health/this.maxHealth)*510;
        this.green = 255;
      }
      fill(this.red, this.green, 0);
      rect (this.pos.x-15, this.pos.y-25, 30*(health/maxHealth), 6);
      rectMode(CENTER);
      fill(0);
      text(int(this.health), this.pos.x-6, this.pos.y-18);
    }
  }

  void move() {
    if (this.type==10) {
      this.theta+=0.01;
      this.pos.x+=.63*cos(theta);
      this.pos.y+=.63*sin( theta );
      z_dir = 0;
    }

    if (path.size()>=2&&this.type!=14) {
      Node temp = (Node)path.get(0);
      Node temp2 = (Node)path.get(1);
      float dx=(temp2.x-temp.x);
      float dy=(temp2.y-temp.y);
      float dist=sqrt(dx*dx+dy*dy);
      if (this.type==3) {
        this.pos.x+=(dx/(dist)*slow)*.25;
        this.pos.y+=(dy/(dist)*slow)*.25;
      } else if (this.type==4) {
        this.pos.x+=(dx/(dist)*slow)*3.25;
        this.pos.y+=(dy/(dist)*slow)*3.25;
      } else if (this.type==6) {
        this.pos.x+=(dx/(dist)*slow)*2.0;
        this.pos.y+=(dy/(dist)*slow)*2.0;
      } else if (this.type==7||this.type==9||this.type==11||this.type==12) {
      } else if (this.type==10) {
      } else {
        this.pos.x+=(dx/(dist)*slow);
        this.pos.y+=(dy/(dist)*slow);
      }

      if (dx >= 0) {
        z_dir = 2;
      }
      if (dx < 0) {
        z_dir = 3;
      }
      if (dy > 0) {
        z_dir = 0;
      }
      if (dy < 0) {
        z_dir = 1;
      }
    } else if (this.type==14) {
      this.pos.x+=(p.pos.x-this.pos.x)/dist_between(this.pos, p.pos); 
      this.pos.y+=(p.pos.y-this.pos.y)/dist_between(this.pos, p.pos);
    }
  }
  //enemy colliding with player ------------------------------------------------------------------------
  void collide(int chaser_number) {
    float hit=dist_between(this.pos, p.pos);
    if ((this.type==8||this.type==13||this.type==7)&&hit<=40) {//Boss Collision
      p.health-=10;
    } else if ((this.type==10||this.type==11)&&hit<=25) {//boss, shield, tendril touch you
      p.health-=10;
    } else if (this.type==12) {
    } else if (this.type==9 && hit<=25) { // portal colision
      p.health -=10;
    } else if (hit<=25) {
      if (this.type == 3) {
        p.health -= this.health * 50;
        this.health = 0;
      } else if (this.type == 4) {
        p.health -= this.health * 200;
        this.health = 0;
      } else {
        p.health-=this.health*100;
        this.health=0;
        if (this.type==6) {
          p.slow_time=0;
          p.slowed=true;
          if (p.slow>=.5) {
            p.slow-=0.25;
          }
        }
      }
    }
  }
  //special case collide function for turret chaser types
  void collide(int chaser_number, int target) {
    if (num_turrets > 0) {
      Turret t = (Turret)turrets.get(target);
      float hit=dist_between(this.pos, t.pos);
      if (hit<=40 && this.type==2) {
        this.health = 0;
        t.health-=this.health;
      }
      if (hit <=40 && this.type ==8) {
        t.health --;
      }
    }
  }
  //first boss attack------------------------------------------------------------------------
  void ghosties() {
    num_enemies++;
    chasers.add(new Chaser(new PVector(this.pos.x+random(-10, 10), this.pos.y+random(-10, 10)), 40, 14, 0, 0));
  }
  //Shooter type's attack------------------------------------------------------------------------
  void shoot () {
    num_bullets++;
    bullets.add(new Bullet(0, new PVector(0, 0), new PVector(this.pos.x, this.pos.y), new PVector(p.pos.x, p.pos.y), 1));
  }
  //Final boss attack 1------------------------------------------------------------------------
  void barf() {
    for (int i=0; i<=3; i++) {
      num_bullets++;
      bullets.add(new Bullet(-1, new PVector(random(10, 14), random(10, 14)), new PVector(this.pos.x, this.pos.y), new PVector(p.pos.x+random(0, dist_between(p.pos, this.pos)/3), p.pos.y+random(0, dist_between(p.pos, this.pos))/3), 1));
    }
  }
  //final boss attack 2------------------------------------------------------------------------
  void shockwave() {
    for (int i=0; i<5; i++) {
      num_bullets++;
      bullets.add(new Bullet(9, new PVector(0, 0), new PVector(this.pos.x, this.pos.y), new PVector(random(0, width), random(0, height)), 1));
    }
  }
  //final boss attack 3------------------------------------------------------------------------
  void tendrils() {
    num_enemies++;
    chasers.add(new Chaser(new PVector(p.pos.x, p.pos.y), 40, 12, 0, 0));
  }
}

//bullet class------------------------------------------------------------------------
class Bullet {
  PVector pos;
  PVector target;
  PVector v;
  PVector origin_pos;
  float theta;
  int type;
  float damage;
  float detection;
  float dist;
  int explode;
  int owner;
  int pierce;
  Float charge;
  float time;
  int counter;
  //BULLET TYPES(0 - normal bullet), (1 - mine), (2 - orbitting), (3 - shotgun), (4 - grenade launcher), (5 - machine gun), (6 - web gun), (7 - turret mg)
  //BULLET TYPES(8- turret web bomb), (-1 - barf), (9 - shockwave)
  //OWNER of BULLET(0 - player), (1 - zomb), (2 - turret)
  Bullet(int temp_type, PVector temp_v, PVector temp_pos, PVector temp_target, int temp_owner) {
    origin_pos=temp_pos;
    pos=temp_pos;
    target=temp_target;
    charge=new Float (temp_v.x);
    v=temp_v;
    type=temp_type;
    owner=temp_owner;
    pierce=1;
    explode=0;
    counter = 0;
    dist=dist_between(this.pos, target);
    this.v.x=(target.x-this.pos.x)/dist*random(14, 15);
    this.v.y=(target.y-this.pos.y)/dist*random(14, 15);
    //initializing speed, target, damage, detection radius based on type------------------------------------------------------------------------
    if (this.type==-1) {
      this.time=50;
      this.damage=1;
      this.detection=7;
      this.v.x=(target.x-this.pos.x)/dist;
      this.v.y=(target.y-this.pos.y)/dist;
    } else if (this.type==0) {
      this.pierce+=pierce0;
      this.damage=20+damage0;
      this.detection=16;
    } else if (this.type==1) {
      this.damage=40+damage1;
      this.detection=40;
    } else if (this.type==2) {//intented for turret's use, not player.
      this.theta=0;
      this.damage=20+damage2;
      this.detection=16;
      this.pos.y-=50;//arbitrary value; i just guessed
    } else if (this.type==3) {
      this.damage=20+damage3;
      this.detection=16;
      this.pierce=1;
      this.v.x=(target.x-this.pos.x)/dist*random(13, 16);
      this.v.y=(target.y-this.pos.y)/dist*random(13, 16);
    } else if (this.type==4) {
      this.damage=30+damage4;
      this.detection=10;
      this.v.x=(target.x-this.pos.x)/dist;
      this.v.y=(target.y-this.pos.y)/dist;
    } else if (this.type==5) {
      this.damage=5+damage5;
      this.detection=16;
      this.v.x=(target.x-this.pos.x)/dist*random(14, 17);
      this.v.y=(target.y-this.pos.y)/dist*random(14, 17);
    } else if (this.type==6) {
      this.time=400+time6;
      this.damage=0;
      this.detection=16;
      this.v.x=(target.x-this.pos.x)/dist;
      this.v.y=(target.y-this.pos.y)/dist;
    } else if (this.type==7) {
      this.damage=5;
      this.detection=16;
    } else if (this.type==8) {
      this.damage=0;
      this.detection=10;
      this.v.x=(target.x-this.pos.x)/dist;
      this.v.y=(target.y-this.pos.y)/dist;
    } else if (this.type==9) {
      this.damage=100;
      this.detection=20;
    } else if (this.type==10) {
      this.pierce+=pierce10;
      this.damage=20;
      this.detection=10;
    }
  }

  void display() {
    if (this.type==-1) {
      fill(40, 120, 60); 
      ellipse(this.pos.x, this.pos.y, 4, 4);
    } else if (this.type==0||this.type==10) {
      fill(0, 0, 100);
      if (this.owner == 0 || this.owner ==2) {
        image(bullet, this.pos.x, this.pos.y, 8, 8);
      }
      if (this.owner == 1) {
        this.counter++;
        if (this.counter < 8) {
          image(eb[0], this.pos.x, this.pos.y, 8, 8);
        } else {
          image(eb[1], this.pos.x, this.pos.y, 8, 8);
        }
        if (this.counter == 16) {
          this.counter = 0;
        }
      }
    } else if (this.type==1) {
      fill(120, 40, 30);
      ellipse(this.pos.x, this.pos.y, 90, 90);
      fill(70, 80, 100);
      ellipse(this.pos.x, this.pos.y, 60, 60);
      image(mineG, this.pos.x, this.pos.y, 16, 16);
    } else if (this.type==2) {
      fill(120, 20, 30);
      this.counter++;
      if (this.counter < 8) {
        image(so[0], this.pos.x, this.pos.y, 8, 8);
      } else {
        image(so[1], this.pos.x, this.pos.y, 8, 8);
      }
      if (this.counter == 16) {
        this.counter = 0;
      }
    } else if (this.type==3) {
      fill(50, 0, 100);
      image(bullet, this.pos.x, this.pos.y, 8, 8);
    } else if (this.type==4) {
      fill(0, 70, 100);
      image(explosive, this.pos.x, this.pos.y, 16, 16);
    } else if (this.type==5) {
      fill(90, 70, 100);
      image(bullet, this.pos.x, this.pos.y, 8, 8);
    } else if (this.type==6) {
      fill(255, 255, 255);
      image(web, this.pos.x, this.pos.y, 8, 8);
    } else if (this.type==7) {
      fill(90, 70, 100);
      image(bullet, this.pos.x, this.pos.y, 8, 8);
    } else if (this.type==8) {
      fill(255, 255, 255);
      image(bullet, this.pos.x, this.pos.y, 8, 8);
    } else if (this.type==9) {
      fill(50, 0, 0);
      ellipse(this.pos.x, this.pos.y, 20, 20);
    }
  }

  void move() {
    if (this.type==-1) {
      this.pos.x+=this.v.x*this.charge;
      this.pos.y+=this.v.y*this.charge;
    } else if (this.type==0||this.type ==10) {
      this.pos.x+=this.v.x;
      this.pos.y+=this.v.y;
    } else if (this.type==1) {
    } else if (this.type==2) {
      this.theta+=0.01;
      this.pos.x+=.5*cos(theta);
      this.pos.y+=.5*sin( theta );
    } else if (this.type==3) {
      this.pos.x+=this.v.x;
      this.pos.y+=this.v.y;
    } else if (this.type==4) {
      this.pos.x+=this.v.x*this.charge;
      this.pos.y+=this.v.y*this.charge;
    } else if (this.type==5) {
      this.pos.x+=this.v.x;
      this.pos.y+=this.v.y;
    } else if (this.type==6) {
      this.pos.x+=this.v.x*this.charge;
      this.pos.y+=this.v.y*this.charge;
    } else if (this.type==7) {
      this.pos.x+=this.v.x;
      this.pos.y+=this.v.y;
    } else if (this.type==8) {
      this.pos.x+=this.v.x*this.charge;
      this.pos.y+=this.v.y*this.charge;
    } else if (this.type==9) {
      float a = random(-4, 4);
      this.pos.x+=this.v.x*.3;
      this.pos.y+=this.v.y*.3;
      this.pos.x+=3*cos(a);
      this.pos.y+=3*sin(a);
      this.pos.x-=(this.pos.x-p.pos.x)/dist_between(this.pos, p.pos);
      this.pos.y-=(this.pos.y-p.pos.y)/dist_between(this.pos, p.pos);
    }
  }
}
//turret class------------------------------------------------------------------------
class Turret {
  PVector pos;
  PVector target;
  float reload;
  int shotsleft;
  float health;
  int type;
  float angle;
  int above;
  int fired;
  int elec;
  int counter;
  int eCount;
  Turret(PVector temp_pos, int temp_reload, int temp_shotsleft, float temp_health, int temp_type) {
    pos=temp_pos;
    reload=temp_reload;
    shotsleft=temp_shotsleft;
    health = temp_health;
    type=temp_type;
    angle = 0;
    above = 1;
    fired = 0;
    counter = 0;
    elec = 0;
    eCount = 0;
  }
  void display() {
    fill(0, 100, 100);
    if (fired == 1) {
      counter ++;
    }
    if (counter == 4) {
      fired = 0;
      counter = 0;
    }
    eCount ++;
    if (eCount == 6) {
      if (elec == 0) {
        elec = 1;
      } else {
        elec = 0;
      }
      eCount = 0;
    }
    if (this.type == 0) {
      if (angle >=-90 && angle < -45) {
        image(sftl[fired], this.pos.x, this.pos.y, 32, 32);
      }
      if (angle >45 && angle <= 90) {
        image(sftr[fired], this.pos.x, this.pos.y, 32, 32);
      }
      if (angle >=-45 && angle <=45) {
        if (above == 0) {
          image(sftf[fired], this.pos.x, this.pos.y, 32, 32);
        } else {
          image(sftb[fired], this.pos.x, this.pos.y, 32, 32);
        }
      }
    } 
    if (this.type == 2) {
      if (angle >=-90 && angle < -45) {
        image(rtl[fired], this.pos.x, this.pos.y, 32, 32);
      }
      if (angle >45 && angle <= 90) {
        image(rtr[fired], this.pos.x, this.pos.y, 32, 32);
      }
      if (angle >=-45 && angle <=45) {
        if (above == 0) {
          image(rtf[fired], this.pos.x, this.pos.y, 32, 32);
        } else {
          image(rtb[fired], this.pos.x, this.pos.y, 32, 32);
        }
      }
    }     
    if (this.type == 3) {
      if (angle >=-90 && angle < -45) {
        image(etl[fired], this.pos.x, this.pos.y, 32, 32);
      }
      if (angle >45 && angle <= 90) {
        image(etr[fired], this.pos.x, this.pos.y, 32, 32);
      }
      if (angle >=-45 && angle <=45) {
        if (above == 0) {
          image(etf[fired], this.pos.x, this.pos.y, 32, 32);
        } else {
          image(etb[fired], this.pos.x, this.pos.y, 32, 32);
        }
      }
    } 
    if (this.type == 1) {
      image(st[elec], this.pos.x, this.pos.y, 32, 32);
    }
  }
  void shoot(PVector targ, int type) {
    float x_dist = ((targ.x-this.pos.x));
    float y_dist = (abs(targ.y-this.pos.y));
    angle = degrees(atan(x_dist/y_dist));
    fired = 1;
    if (targ.y > this.pos.y) {
      above = 0;
    }
    num_bullets++;
    if (type==8) {
      bullets.add(new Bullet(8, new PVector(8, 8), new PVector(this.pos.x, this.pos.y), new PVector(targ.x, targ.y), 2));
    } else {
      bullets.add(new Bullet(type, new PVector(0, 0), new PVector(this.pos.x, this.pos.y), new PVector(targ.x, targ.y), 2));
    }
  }
}
//resources class------------------------------------------------------------------------
class Resource {
  PVector pos;
  int resourceUp;

  Resource(PVector temp_pos, int resUp) {
    pos=temp_pos;
    resourceUp = resUp;
  }
  void display() {
    fill(100, 200, 100);
    rect(this.pos.x, this.pos.y, 8, 8);
  }
}

void setup() {
  //screen size------------------------------------------------------------------------
  size(1120, 640);
  //story!------------------------------------------------------------------------
  spacing = width / w;
  story[0] = loadImage("Story/1lvl1.png");
  story[1] = loadImage("Story/1lvl2.png");
  story[2] = loadImage("Story/1lvl3.png");
  story[3] = loadImage("Story/1lvl4.png");
  story[4] = loadImage("Story/1lvl5.png");
  story[5] = loadImage("Story/1lvl6.png");
  story[6] = loadImage("Story/1lvl7.png");
  story[7] = loadImage("Story/1lvl8.png");
  story[8] = loadImage("Story/1lvl9.png");
  story[9] = loadImage("Story/1lvl10.png");
  story[10] = loadImage("Story/1lvl11.png");
  story[11] = loadImage("Story/1lvl12.png");
  story[12] = loadImage("Story/1lvl13.png");
  story[13] = loadImage("Story/1lvl14.png");
  story[14] = loadImage("Story/1lvl15.png");
  story[15] = loadImage("Story/1lvl16.png");
  story[16] = loadImage("Story/1lvl17.png");
  story[17] = loadImage("Story/1lvl18.png");
  story[18] = loadImage("Story/1lvl19.png");
  story[19] = loadImage("Story/2lvl1.png");
  story[20] = loadImage("Story/2lvl2.png");
  story[21] = loadImage("Story/2lvl3.png");
  story[22] = loadImage("Story/2lvl4.png");
  story[23] = loadImage("Story/2lvl5.png");
  story[24] = loadImage("Story/2lvl6.png");
  story[25] = loadImage("Story/2lvl7.png");
  story[26] = loadImage("Story/2lvl8.png");
  story[27] = loadImage("Story/2lvl9.png");
  story[28] = loadImage("Story/2lvl10.png");
  story[29] = loadImage("Story/2lvl11.png");  
  story[30] = loadImage("Story/2lvl12.png");
  story[31] = loadImage("Story/2lvl13.png");
  story[32] = loadImage("Story/2lvl14.png");
  story[33] = loadImage("Story/2lvl15.png");
  story[34] = loadImage("Story/2lvl16.png");
  story[35] = loadImage("Story/3lvl1.png");
  story[36] = loadImage("Story/3lvl2.png");
  story[37] = loadImage("Story/3lvl3.png");
  story[38] = loadImage("Story/3lvl4.png");
  story[39] = loadImage("Story/3lvl5.png");  
  story[40] = loadImage("Story/3lvl6.png");
  story[41] = loadImage("Story/3lvl7.png");
  story[42] = loadImage("Story/3lvl8.png");
  story[43] = loadImage("Story/3lvl9.png");
  story[44] = loadImage("Story/3lvl10.png");
  story[45] = loadImage("Story/3lvl11.png");
  story[46] = loadImage("Story/3lvl12.png");
  story[47] = loadImage("Story/3lvl13.png");
  story[48] = loadImage("Story/3lvl14.png");
  story[49] = loadImage("Story/4lvl1.png");
  story[50] = loadImage("Story/4lvl2.png");
  story[51] = loadImage("Story/4lvl3.png");
  story[52] = loadImage("Story/4lvl4.png");
  story[53] = loadImage("Story/4lvl5.png");
  story[54] = loadImage("Story/4lvl6.png");
  story[55] = loadImage("Story/4lvl7.png");
  story[56] = loadImage("Story/4lvl8.png");
  story[57] = loadImage("Story/4lvl9.png");
  story[58] = loadImage("Story/4lvl10.png");
  story[59] = loadImage("Story/5lvl1.png");
  story[60] = loadImage("Story/5lvl2.png");
  story[61] = loadImage("Story/5lvl3.png");
  story[62] = loadImage("Story/5lvl4.png");
  story[63] = loadImage("Story/5lvl5.png");
  story[64] = loadImage("Story/5lvl6.png");
  story[65] = loadImage("Story/5lvl7.png");
  story[66] = loadImage("Story/5lvl8.png");
  story[67] = loadImage("Story/5lvl9.png");
  story[68] = loadImage("Story/6lvl1.png");
  story[69] = loadImage("Story/6lvl2.png");
  story[70] = loadImage("Story/6lvl3.png");
  story[71] = loadImage("Story/6lvl4.png");
  story[72] = loadImage("Story/6lvl5.png");
  story[73] = loadImage("Story/6lvl6.png");
  story[74] = loadImage("Story/6lvl7.png");
  story[75] = loadImage("Story/6lvl8.png");
  story[76] = loadImage("Story/6lvl9.png");
  story[77] = loadImage("Story/6lvl10.png");
  story[78] = loadImage("Story/6lvl11.png");
  story[79] = loadImage("Story/6lvl12.png");
  story[80] = loadImage("Story/7lvl1.png");
  story[81] = loadImage("Story/7lvl2.png");
  story[82] = loadImage("Story/7lvl3.png");
  story[83] = loadImage("Story/7lvl4.png");
  story[84] = loadImage("Story/7lvl5.png");
  story[85] = loadImage("Story/7lvl6.png");
  story[86] = loadImage("Story/7lvl7.png");
  story[87] = loadImage("Story/7lvl8.png");
  story[88] = loadImage("Story/7lvl9.png");
  story[89] = loadImage("Story/7lvl10.png");
  story[90] = loadImage("Story/7lvl11.png");
  story[91] = loadImage("Story/7lvl12.png");
  story[92] = loadImage("Story/7lvl13.png");
  story[93] = loadImage("Story/7lvl14.png");
  story[94] = loadImage("Story/7lvl15.png");
  story[95] = loadImage("Story/7lvl16.png");
  story[96] = loadImage("Story/7lvl17.png");
  story[97] = loadImage("Story/8lvl1.png");
  story[98] = loadImage("Story/8lvl2.png");
  story[99] = loadImage("Story/8lvl3.png");
  story[100] = loadImage("Story/8lvl4.png");
  story[101] = loadImage("Story/8lvl5.png");
  story[102] = loadImage("Story/8lvl6.png");
  story[103] = loadImage("Story/8lvl7.png");
  story[104] = loadImage("Story/8lvl8.png");
  story[105] = loadImage("Story/8lvl9.png");
  story[106] = loadImage("Story/8lvl10.png");
  story[107] = loadImage("Story/8lvl11.png");
  story[108] = loadImage("Story/8lvl12.png");
  story[109] = loadImage("Story/8lvl13.png");  
  story[110] = loadImage("Story/8lvl14.png");
  story[111] = loadImage("Story/8lvl15.png");
  story[112] = loadImage("Story/9lvl1.png");
  story[113] = loadImage("Story/9lvl2.png");
  story[114] = loadImage("Story/9lvl3.png");
  story[115] = loadImage("Story/9lvl4.png");
  story[116] = loadImage("Story/9lvl5.png");
  story[117] = loadImage("Story/9lvl6.png");
  story[118] = loadImage("Story/9lvl7.png");
  story[119] = loadImage("Story/9lvl8.png");
  story[120] = loadImage("Story/9lvl9.png");
  story[121] = loadImage("Story/9lvl10.png");
  story[122] = loadImage("Story/9lvl11.png");
  story[123] = loadImage("Story/9lvl12.png");
  story[124] = loadImage("Story/9lvl13.png");
  story[125] = loadImage("Story/9lvl14.png");
  story[126] = loadImage("Story/9lvl15.png");
  story[127] = loadImage("Story/9lvl16.png");
  story[128] = loadImage("Story/9lvl17.png");
  story[129] = loadImage("Story/9lvl18.png");  
  story[130] = loadImage("Story/10lvl1.png");
  story[131] = loadImage("Story/10lvl2.png");
  story[132] = loadImage("Story/10lvl3.png");
  story[133] = loadImage("Story/10lvl4.png");
  story[134] = loadImage("Story/10lvl5.png");
  story[135] = loadImage("Story/10lvl6.png");
  story[136] = loadImage("Story/10lvl7.png");
  story[137] = loadImage("Story/10lvl8.png");
  story[138] = loadImage("Story/10lvl9.png");
  story[139] = loadImage("Story/10lvl10.png");  
  story[140] = loadImage("Story/10lvl11.png");
  story[141] = loadImage("Story/10lvl12.png");
  story[142] = loadImage("Story/10lvl13.png");
  story[143] = loadImage("Story/10lvl14.png");
  story[144] = loadImage("Story/10lvl15.png");
  story[145] = loadImage("Story/10lvl16.png");
  story[146] = loadImage("Story/10lvl17.png");
  story[147] = loadImage("Story/10lvl18.png");
  story[148] = loadImage("Story/10lvl19.png");
  story[149] = loadImage("Story/10lvl20.png"); 
  story[150] = loadImage("Story/10lvl21.png");
  story[151] = loadImage("Story/10lvl22.png");
  story[152] = loadImage("Story/10lvl23.png");
  story[153] = loadImage("Story/10lvl24.png");
  story[154] = loadImage("Story/10lvl25.png");
  story[155] = loadImage("Story/10lvl26.png");
  story[156] = loadImage("Story/10lvl27.png");
  story[157] = loadImage("Story/10lvl28.png");
  story[158] = loadImage("Story/10lvl29.png");
  //title screen images!
  fire1 = loadImage("Sprites/fire1big.png");
  fire2 = loadImage("Sprites/fire2big.png");
  titleImage = loadImage("Sprites/titleScreenNone.png");
  titleImage2 = loadImage("Sprites/titleScreen.png");
  lightning1 = loadImage("Sprites/lightning1.png");
  lightning2 = loadImage("Sprites/lightning2.png");
  lightning3 = loadImage("Sprites/lightning3.png");
  //player images!
  pb[0] = loadImage("Sprites/playerbehind0.png");
  pb[1] = loadImage("Sprites/playerbehind1.png");
  pb[2] = loadImage("Sprites/playerbehind2.png");
  pb[3] = loadImage("Sprites/playerbehind3.png");
  pf[0] = loadImage("Sprites/playerfront0.png");
  pf[1] = loadImage("Sprites/playerfront1.png");
  pf[2] = loadImage("Sprites/playerfront2.png");
  pf[3] = loadImage("Sprites/playerfront3.png");
  pl[0] = loadImage("Sprites/playerleft0.png");
  pl[1] = loadImage("Sprites/playerleft1.png");
  pl[2] = loadImage("Sprites/playerleft2.png");
  pl[3] = loadImage("Sprites/playerleft3.png");
  pr[0] = loadImage("Sprites/playerright0.png");
  pr[1] = loadImage("Sprites/playerright1.png");
  pr[2] = loadImage("Sprites/playerright2.png");
  pr[3] = loadImage("Sprites/playerright3.png");
  //these are all the enemy images
  zf[0] = loadImage("Sprites/zombieguywalk0.png");
  zf[1] = loadImage("Sprites/zombieguywalk1.png");
  zf[2] = loadImage("Sprites/zombieguywalk2.png");
  zf[3] = loadImage("Sprites/zombieguywalk3.png");
  zb[0] = loadImage("Sprites/zbehind0.png");
  zb[1] = loadImage("Sprites/zbehind1.png");
  zb[2] = loadImage("Sprites/zbehind2.png");
  zb[3] = loadImage("Sprites/zbehind3.png");
  zl[0] = loadImage("Sprites/zleft0.png");
  zl[1] = loadImage("Sprites/zleft1.png");
  zl[2] = loadImage("Sprites/zleft2.png");
  zl[3] = loadImage("Sprites/zleft3.png");
  zr[0] = loadImage("Sprites/zright0.png");
  zr[1] = loadImage("Sprites/zright1.png");
  zr[2] = loadImage("Sprites/zright2.png");
  zr[3] = loadImage("Sprites/zright3.png");
  gzf[0] = loadImage("Sprites/greyfront0.png");
  gzf[1] = loadImage("Sprites/greyfront1.png");
  gzf[2] = loadImage("Sprites/greyfront2.png");
  gzf[3] = loadImage("Sprites/greyfront3.png");
  gzb[0] = loadImage("Sprites/greyback0.png");
  gzb[1] = loadImage("Sprites/greyback1.png");
  gzb[2] = loadImage("Sprites/greyback2.png");
  gzb[3] = loadImage("Sprites/greyback3.png");
  gzl[0] = loadImage("Sprites/greyleft0.png");
  gzl[1] = loadImage("Sprites/greyleft1.png");
  gzl[2] = loadImage("Sprites/greyleft2.png");
  gzl[3] = loadImage("Sprites/greyleft3.png");
  gzr[0] = loadImage("Sprites/greyright0.png");
  gzr[1] = loadImage("Sprites/greyright1.png");
  gzr[2] = loadImage("Sprites/greyright2.png");
  gzr[3] = loadImage("Sprites/greyright3.png");
  dgzf[0] = loadImage("Sprites/greydeathfront0.png");
  dgzf[1] = loadImage("Sprites/greydeathfront1.png");
  dgzf[2] = loadImage("Sprites/greydeathfront2.png");
  dgzf[3] = loadImage("Sprites/greydeathfront3.png");
  dgzb[0] = loadImage("Sprites/greydeathback0.png");
  dgzb[1] = loadImage("Sprites/greydeathback1.png");
  dgzb[2] = loadImage("Sprites/greydeathback2.png");
  dgzb[3] = loadImage("Sprites/greydeathback3.png");
  dgzl[0] = loadImage("Sprites/greyleftdeath0.png");
  dgzl[1] = loadImage("Sprites/greyleftdeath1.png");
  dgzl[2] = loadImage("Sprites/greyleftdeath2.png");
  dgzl[3] = loadImage("Sprites/greyleftdeath3.png");
  dgzr[0] = loadImage("Sprites/greyrightdeath0.png");
  dgzr[1] = loadImage("Sprites/greyrightdeath1.png");
  dgzr[2] = loadImage("Sprites/greyrightdeath2.png");
  dgzr[3] = loadImage("Sprites/greyrightdeath3.png");
  dzf[0] = loadImage("Sprites/zdeathback0.png");
  dzf[1] = loadImage("Sprites/zdeathback1.png");
  dzf[2] = loadImage("Sprites/zdeathback2.png");
  dzf[3] = loadImage("Sprites/zdeathback3.png");
  dzb[0] = loadImage("Sprites/zdeathfront0.png");
  dzb[1] = loadImage("Sprites/zdeathfront1.png");
  dzb[2] = loadImage("Sprites/zdeathfront2.png");
  dzb[3] = loadImage("Sprites/zdeathfront3.png");
  dzl[0] = loadImage("Sprites/zleftsidedeath0.png");
  dzl[1] = loadImage("Sprites/zleftsidedeath1.png");
  dzl[2] = loadImage("Sprites/zleftsidedeath2.png");
  dzl[3] = loadImage("Sprites/zleftsidedeath3.png");
  dzr[0] = loadImage("Sprites/zrightsidedeath0.png");
  dzr[1] = loadImage("Sprites/zrightsidedeath1.png");
  dzr[2] = loadImage("Sprites/zrightsidedeath2.png");
  dzr[3] = loadImage("Sprites/zrightsidedeath3.png");
  grass = loadImage("Sprites/grass tile.png");
  concrete = loadImage("Sprites/concrete.png");
  bullet = loadImage("Sprites/bullet mark 1.png");
  explosive = loadImage("Sprites/explosive.png");
  mineG = loadImage("Sprites/mine green light.png");  
  eb[0] = loadImage("Sprites/redorb0.png");
  eb[1] = loadImage("Sprites/redorb1.png");
  so[0] = loadImage("Sprites/shieldorb0.png");
  so[1] = loadImage("Sprites/shieldorb1.png"); 
  rtb[0] = loadImage("Sprites/redturretbackface0.png");
  rtb[1] = loadImage("Sprites/redturretbackface1.png");  
  rtf[0] = loadImage("Sprites/redturretfrontface0.png");
  rtf[1] = loadImage("Sprites/redturretfrontface1.png");  
  rtl[0] = loadImage("Sprites/redturretleftface0.png");
  rtl[1] = loadImage("Sprites/redturretleftface1.png");  
  rtr[0] = loadImage("Sprites/redturretrightface0.png");
  rtr[1] = loadImage("Sprites/redturretrightface1.png");
  etb[0] = loadImage("Sprites/etb0.png");
  etb[1] = loadImage("Sprites/etb1.png");  
  etf[0] = loadImage("Sprites/etf0.png");
  etf[1] = loadImage("Sprites/etf1.png");  
  etl[0] = loadImage("Sprites/etl0.png");
  etl[1] = loadImage("Sprites/etl1.png");  
  etr[0] = loadImage("Sprites/etr0.png");
  etr[1] = loadImage("Sprites/etr1.png");
  ebs[0] = loadImage("Sprites/ebs0.png");
  ebs[1] = loadImage("Sprites/ebs1.png");    
  sftb[0] = loadImage("Sprites/sftb0.png");
  sftb[1] = loadImage("Sprites/sftb1.png");  
  sftf[0] = loadImage("Sprites/sftf0.png");
  sftf[1] = loadImage("Sprites/sftf1.png");  
  sftl[0] = loadImage("Sprites/sftl0.png");
  sftl[1] = loadImage("Sprites/sftl1.png");  
  sftr[0] = loadImage("Sprites/sftr0.png");
  sftr[1] = loadImage("Sprites/sftr1.png");  
  st[0] = loadImage("Sprites/shieldturret0.png");
  st[1] = loadImage("Sprites/shieldturret1.png");
  egg[0] = loadImage("Sprites/egg32.png");
  egg[1] = loadImage("Sprites/egg33.png");
  qzf[0] = loadImage("Sprites/bqf0.png");
  qzf[1] = loadImage("Sprites/bqf1.png");
  qzf[2] = loadImage("Sprites/bqf2.png");
  qzf[3] = loadImage("Sprites/bqf3.png");
  qzb[0] = loadImage("Sprites/bqb0.png");
  qzb[1] = loadImage("Sprites/bqb1.png");
  qzb[2] = loadImage("Sprites/bqb2.png");
  qzb[3] = loadImage("Sprites/bqb3.png");
  qzl[0] = loadImage("Sprites/bql0.png");
  qzl[1] = loadImage("Sprites/bql1.png");
  qzl[2] = loadImage("Sprites/bql2.png");
  qzl[3] = loadImage("Sprites/bql3.png");
  qzr[0] = loadImage("Sprites/bqr0.png");
  qzr[1] = loadImage("Sprites/bqr1.png");
  qzr[2] = loadImage("Sprites/bqr2.png");
  qzr[3] = loadImage("Sprites/bqr3.png");
  zrf[0] = loadImage("Sprites/zrf0.png");
  zrf[1] = loadImage("Sprites/zrf1.png");
  zrf[2] = loadImage("Sprites/zrf2.png");
  zrf[3] = loadImage("Sprites/zrf3.png");
  zrb[0] = loadImage("Sprites/zrb0.png");
  zrb[1] = loadImage("Sprites/zrb1.png");
  zrb[0] = loadImage("Sprites/zrb0.png");
  zrb[1] = loadImage("Sprites/zrb1.png");
  zrb[2] = loadImage("Sprites/zrb2.png");
  zrb[3] = loadImage("Sprites/zrb3.png");  
  zrl[0] = loadImage("Sprites/zrl0.png");
  zrl[1] = loadImage("Sprites/zrl1.png");
  zrl[2] = loadImage("Sprites/zrl2.png");
  zrl[3] = loadImage("Sprites/zrl3.png");  
  zrr[0] = loadImage("Sprites/zrr0.png");
  zrr[1] = loadImage("Sprites/zrr1.png");
  zrr[2] = loadImage("Sprites/zrr2.png");
  zrr[3] = loadImage("Sprites/zrr3.png");
  szf[0] = loadImage("Sprites/szf0.png");
  szf[1] = loadImage("Sprites/szf1.png");
  szf[2] = loadImage("Sprites/szf2.png");
  szf[3] = loadImage("Sprites/szf3.png");
  szb[0] = loadImage("Sprites/szb0.png");
  szb[1] = loadImage("Sprites/szb1.png");
  szb[2] = loadImage("Sprites/szb2.png");
  szb[3] = loadImage("Sprites/szb3.png");  
  szl[0] = loadImage("Sprites/szl0.png");
  szl[1] = loadImage("Sprites/szl1.png");
  szl[2] = loadImage("Sprites/szl2.png");
  szl[3] = loadImage("Sprites/szl3.png");  
  szr[0] = loadImage("Sprites/szr0.png");
  szr[1] = loadImage("Sprites/szr1.png");
  szr[2] = loadImage("Sprites/szr2.png");
  szr[3] = loadImage("Sprites/szr3.png");
  jf[0] = loadImage("Sprites/jf0.png");
  jf[1] = loadImage("Sprites/jf1.png");
  jf[2] = loadImage("Sprites/jf2.png");
  jf[3] = loadImage("Sprites/jf3.png");
  jb[0] = loadImage("Sprites/jb0.png");
  jb[1] = loadImage("Sprites/jb1.png");
  jb[2] = loadImage("Sprites/jb2.png");
  jb[3] = loadImage("Sprites/jb3.png");  
  jl[0] = loadImage("Sprites/jl0.png");
  jl[1] = loadImage("Sprites/jl1.png");
  jl[2] = loadImage("Sprites/jl2.png");
  jl[3] = loadImage("Sprites/jl3.png");  
  jr[0] = loadImage("Sprites/jr0.png");
  jr[1] = loadImage("Sprites/jr1.png");
  jr[2] = loadImage("Sprites/jr2.png");
  jr[3] = loadImage("Sprites/jr3.png");
  jbf[0] = loadImage("Sprites/jf0.png");
  jbf[1] = loadImage("Sprites/jf1.png");
  jbf[2] = loadImage("Sprites/jf2.png");
  jbf[3] = loadImage("Sprites/jf3.png");
  jbb[0] = loadImage("Sprites/jb0.png");
  jbb[1] = loadImage("Sprites/jb1.png");
  jbb[2] = loadImage("Sprites/jb2.png");
  jbb[3] = loadImage("Sprites/jb3.png");  
  jbl[0] = loadImage("Sprites/jl0.png");
  jbl[1] = loadImage("Sprites/jl1.png");
  jbl[2] = loadImage("Sprites/jl2.png");
  jbl[3] = loadImage("Sprites/jl3.png");  
  jbr[0] = loadImage("Sprites/jr0.png");
  jbr[1] = loadImage("Sprites/jr1.png");
  jbr[2] = loadImage("Sprites/jr2.png");
  jbr[3] = loadImage("Sprites/jr3.png");
  mzf[0] = loadImage("Sprites/queenfrontview0.png");
  mzf[1] = loadImage("Sprites/queenfrontview1.png");
  mzf[2] = loadImage("Sprites/queenfrontview2.png");
  mzf[3] = loadImage("Sprites/queenfrontview3.png");
  mzb[0] = loadImage("Sprites/queenbackview0.png");
  mzb[1] = loadImage("Sprites/queenbackview1.png");
  mzb[2] = loadImage("Sprites/queenbackview2.png");
  mzb[3] = loadImage("Sprites/queenbackview3.png");
  mzl[0] = loadImage("Sprites/queenleftview0.png");
  mzl[1] = loadImage("Sprites/queenleftview1.png");
  mzl[2] = loadImage("Sprites/queenleftview2.png");
  mzl[3] = loadImage("Sprites/queenleftview3.png");
  spike[0] = loadImage("Sprites/spike0.png");
  spike[1] = loadImage("Sprites/spike1.png");
  spike[2] = loadImage("Sprites/spike2.png");
  spike[3] = loadImage("Sprites/spike3.png");
  spikeInd = loadImage("Sprites/xmarker.png");
  web = loadImage("Sprites/web.png");
  mzr[0] = loadImage("Sprites/queenrightview0.png");
  mzr[1] = loadImage("Sprites/queenrightview1.png");
  mzr[2] = loadImage("Sprites/queenrightview2.png");
  mzr[3] = loadImage("Sprites/queenrightview3.png");
  bo[0] = loadImage("Sprites/bossorbiter0.png");
  bo[1] = loadImage("Sprites/bossorbiter1.png");
  portal[0] = loadImage("Sprites/portal0.png");
  portal[1] = loadImage("Sprites/portal1.png");
  portal[2] = loadImage("Sprites/portal2.png");
  portal[3] = loadImage("Sprites/portal3.png");
  zrdf[0] = loadImage("Sprites/zrdf0.png");
  zrdf[1] = loadImage("Sprites/zrdf1.png");
  zrdf[2] = loadImage("Sprites/zrdf2.png");
  zrdf[3] = loadImage("Sprites/zrdf3.png");
  szdf[0] = loadImage("Sprites/szdf0.png");
  szdf[1] = loadImage("Sprites/szdf1.png");
  szdf[2] = loadImage("Sprites/szdf2.png");
  szdf[3] = loadImage("Sprites/szdf3.png");
  levelImage[0] = loadImage("Sprites/desert background.png");
  levelImage[1] = loadImage("Sprites/desert background.png");
  levelImage[2] = loadImage("Sprites/desert background 2 lines.png");
  levelImage[3] = loadImage("Sprites/desert background 4 lines with pegs.png");
  levelImage[4] = loadImage("Sprites/uh4.png");
  levelImage[5] = loadImage("Sprites/uh1.png");
  levelImage[6] = loadImage("Sprites/uh3.png");
  levelImage[7] = loadImage("Sprites/demon background2.png");
  levelImage[8] = loadImage("Sprites/demon background4.png");
  levelImage[9] = loadImage("Sprites/final boss background.png");
  levelImage[10] = loadImage("Sprites/final boss background.png");
  //instruction image
  instructions = loadImage("Sprites/instructions.png");
  go = loadImage("Sprites/game over screen 2.png");
  upgrade_screen = loadImage("Sprites/upgradescreen.png");
  //icon images for the HUD for weapons------------------------------------------------------------------------
  iemissioner=loadImage("Sprites/emissioner icon.png");
  igrenade=loadImage("Sprites/grenadelaunchericon.png");
  iheart=loadImage("Sprites/heart.png");
  imine=loadImage("Sprites/mineicon.png");
  ichain=loadImage("Sprites/minigunicon.png");
  ipistol=loadImage("Sprites/pistolicon.png");
  iredpepper=loadImage("Sprites/red pepper icon.png");
  iresource=loadImage("Sprites/resource icon.png");
  ishotgun=loadImage("Sprites/shotgunicon.png");
  ismallfry=loadImage("Sprites/small fry icon.png");
  iwebgun=loadImage("Sprites/webgunicon.png");
  //sound------------------------------------------------------------------------
  minim = new Minim(this);
  titleMusic = minim.loadFile("TitleScreen.wav", 2048);
  levelMusic = minim.loadFile("levels.wav", 2048);
  bossMusic1 = minim.loadFile("Boss1.wav", 2048);
  bossMusic2 = minim.loadFile("Boss2.wav", 2048);
  bossMusic3 = minim.loadFile("Boss3.wav", 2048);
  storyMusic = minim.loadFile("Story.wav", 2048);
  upgradeMusic = minim.loadFile("Upgrade.wav", 2048);
  loseMusic= minim.loadFile("gameover.wav", 2048);
  creditMusic= minim.loadFile("Credits2.wav", 2048);

  smooth();
  rectMode(CENTER);
  //initializing EVERYTHING------------------------------------------------------------------------
  chasers= new ArrayList(num_enemies);
  bullets= new ArrayList(num_bullets);
  turrets= new ArrayList(num_turrets);
  resources= new ArrayList(num_resources);
  astar = new Pathfinder();
  astar.offsetX = spacing/2;
  astar.offsetY = spacing/2;
  astar.setCuboidNodes(w, h, spacing);
  // credits
  credit_y=1000;
  credit_font=loadFont("SimplifiedArabicFixed-48.vlw");
  for (int i=0; i<100; i++) {
    c[i]= new Confetti((random(570)+400), random(130, 250), random(1, 3), random(1, 255), random(1, 255), random(1, 255));
  }
}

void draw() {
  //YOU WIN!
  if (level == 10) {
    if (refresh == 0) {
      newScreen = 0;
      refresh = 1;
    }
    PLAYING = false;
  }    
  //Resetting nodes and assigns values to wave-variables based on level type.
  if (newLevel == 0) {
    setNodes();
    if (level == 1) {
      wave_enemies=30;
      wave_killed = 0;
      wave_spawned = 0;
      wave_start = 30;
      total_waves=3;
    }
    if (level == 6|| level == 7|| level == 9) {
      wave_enemies=1;
      wave_killed = 0;
      wave_spawned = 0;
      wave_start = 1;
      total_waves=1;
      p.pos.x = 30;
      p.pos.y = 30;
    }
    if (level == 2) {
      wave_enemies=1;
      wave_spawned = 0;
      wave_killed = 0;
      wave_start = 1;
      total_waves=1;
      p.pos.x = width/2;
      p.pos.y = height/2;
    }
    if (level==3) {
      wave_enemies=1;
      wave_killed = 0;
      wave_spawned = 0;
      wave_start = 1;
      total_waves=1;
    }
    if (level==4) {
      wave_enemies=40;
      wave_killed=0;
      wave_spawned = 0;
      wave_start=40;
      total_waves=3;
    }
    if (level==8) {
      wave_enemies=50;
      wave_killed=0;
      wave_spawned = 0;
      wave_start=50;
      total_waves=3;
    }
    if (level ==5) {
      wave_enemies=3;
      wave_spawned = 0;
      wave_killed = 0;
      wave_start = 3;
      total_waves=3;
      p.pos.x = 30;
      p.pos.y = 30;
    }
    newLevel++;
  }
  //Instrution screen------------------------------------------------------------------------
  if (INSTRUCTIONS) {
    image(instructions, width/2, height/2, 1120, 640);
  }
  //Title screen------------------------------------------------------------------------
  if (TITLE) {
    if (newScreen == 0) {
      playMusic();
      newScreen = 1;
    }
    frame++;

    if (frame ==30) {
      frame=0;
    }
    titleScreen();
  }
  //During the levels(actually playing)------------------------------------------------------------------------
  if (PLAYING) {
    background(80);
    image(levelImage[level], width/2, height/2, 1120, 640);
    if (newScreen == 0) {
      playMusic();
      newScreen = 1;
    }
    //the HUD ------------------------------------------------------------------------
    textSize(20);
    text("Weapon", 373+28, height-60);
    rect(373+65, height-30, 40, 40);
    if (p.weapon==0) {
      image(ipistol, 438, height-30, 32, 32);
    } else if (p.weapon==1) {
      image(imine, 438, height-30, 32, 32);
    } else if (p.weapon==3) {
      image(ishotgun, 438, height-30, 32, 32);
    } else if (p.weapon==4) {
      image(igrenade, 438, height-30, 32, 32);
    } else if (p.weapon==5) {
      image(ichain, 438, height-30, 32, 32);
    } else if (p.weapon==6) {
      image(iwebgun, 438, height-30, 32, 32);
    }
    text("Health", 373+190, height-60);
    image(iheart, 373+248-40, height-27, 32, 32);
    text(round(p.health), 373+235, height-22);
    text("Scrap", 373+248+220-90, height-60);
    image(iresource, 373+248+248-65-40, height-30, 32, 32);
    text(p.resource, 373+235+248-65, height-22);
    textSize(20);
    text("'Press i for Instructions'", 20, height-20);
    textSize(20);
    // drawBackground();
    wave_frame++;
    // drawNodes();
    // drawPath();
    //incrementing------------------------------------------------------------------------
    if (level == 1 || level == 6|| level == 9 || level ==5|| level ==4||level ==3||level== 8) {
      if (wave_spawned<wave_enemies&&num_waves<=total_waves) {
        frame ++;
      }
      if (frame ==60&&wave_spawned<wave_enemies&&num_waves<=total_waves) {
        int side = (int) (random(0, 4));
        PVector sideSpawn = (new PVector (random(width), height-20));
        if (side == 0) {
          sideSpawn = (new PVector (random(width), height-20));
        } else if (side == 1) {
          sideSpawn = (new PVector(random(width), 20));
        } else if (side == 2) {
          sideSpawn = (new PVector(width-20, random(height)));
        } else if (side == 3) {
          sideSpawn = (new PVector(20, random(height)));
        }
        if (level == 1) {
          int ct= (int)(random(0, 2));
          chasers.add(new Chaser(new PVector(sideSpawn.x, sideSpawn.y), 400, ct, 0, 0));
        }
        if (level == 6) {
          chasers.add(new Chaser(new PVector(random(width), height-20), 400, 8, 0, 0));
        }
        if (level ==3) {
          chasers.add(new Chaser(new PVector(random(width), height-20), 400, 13, 0, 0));
        }
        if (level==4) {
          int ct= (int)(random(0, 5));
          while (ct == 2) {
            ct= (int)(random(0, 5));
          }
          chasers.add(new Chaser(new PVector(sideSpawn.x, sideSpawn.y), 400, ct, 0, 0));
        }
        if (level == 9) {
          chasers.add(new Chaser(new PVector(random(width), height-20), 400, 7, 0, 0));
        }
        if (level == 5) {
          chasers.add(new Chaser(new PVector(random(width), height-20), 400, 5, 0, 0));
        }
        if (level == 8) {
          int ct= (int)(random(0, 7));
          chasers.add(new Chaser(new PVector(sideSpawn.x, sideSpawn.y), 400, ct, 0, 0));
        }
        num_enemies++;
        wave_spawned++;
        frame = 0;
      }
      //advancing to next wave------------------------------------------------------------------------
      if (wave_killed==wave_enemies) {
        wave_spawned=0;
        wave_killed=0;
        if (level == 5) {
          wave_start += 4;
        }
        wave_enemies = wave_start;
        num_waves++;
      }
      if (num_waves==total_waves+1) {
        CONTINUE=true;
      }
    } else if (level == 2) {
      frame ++;
      if (frame == 60) {
        int side = (int) (random(0, 2));
        PVector sideSpawn = (new PVector (random(width), height-20));
        if (side == 0) {
          sideSpawn = (new PVector (random(width), height-20));
        } else if (side == 1) {
          sideSpawn = (new PVector(random(width), 20));
        }
        chasers.add(new Chaser(new PVector(sideSpawn.x, sideSpawn.y), 400, 4, 0, 0));
        num_enemies++;
        frame = 0;
      }
      //you can now pass the level!
      if (p.resource >= 300) {
        textSize(32);
        text("Press ENTER To Advance", width*.65, height/2);
        if (moveOn == true) {
          nextLevel();
        }
      }
    } else if (level == 7) {
      frame ++;
      if (frame == 60) {
        int side = (int) (random(0, 4));
        PVector sideSpawn = (new PVector (random(width), height-20));
        if (side == 0) {
          sideSpawn = (new PVector (random(width), height-20));
        } else if (side == 1) {
          sideSpawn = (new PVector(random(width), 20));
        } else if (side == 2) {
          sideSpawn = (new PVector(width-20, random(height)));
        } else if (side == 3) {
          sideSpawn = (new PVector(20, random(height)));
        }
        int typeS = (int)random(0, 3);
        if (typeS == 0) {
          chasers.add(new Chaser(new PVector(sideSpawn.x, sideSpawn.y), 400, 2, 0, 0));
        }
        if (typeS == 1) {
          chasers.add(new Chaser(new PVector(sideSpawn.x, sideSpawn.y), 400, 1, 0, 0));
        }
        if (typeS == 2) {
          chasers.add(new Chaser(new PVector(sideSpawn.x, sideSpawn.y), 400, 6, 0, 0));
        }
        num_enemies++;
        frame = 0;
      }
      if (p.resource >= 600) {
        textSize(32);
        text("Press ENTER To Advance", width*.65, height/2);
        if (moveOn == true) {
          nextLevel();
        }
      }
    }
    if (level == 3) {
      frame3 ++;
      if (frame3 == 150) {      
        int side = (int) (random(0, 4));
        PVector sideSpawn = (new PVector (random(width), height-20));
        if (side == 0) {
          sideSpawn = (new PVector (random(width), height-20));
        } else if (side == 1) {
          sideSpawn = (new PVector(random(width), 20));
        } else if (side == 2) {
          sideSpawn = (new PVector(width-20, random(height)));
        } else if (side == 3) {
          sideSpawn = (new PVector(20, random(height)));
        }
        chasers.add(new Chaser(new PVector(sideSpawn.x, sideSpawn.y), 400, 3, 0, 0));
        num_enemies++;
        wave_spawned++;
        wave_enemies++;
        frame3=0;
      }
    }
    //Displays wave count------------------------------------------------------------------------
    if (level!=2&&level!=7) {
      text("Enemies left in wave: "+(wave_enemies-wave_killed), width/2-100, 40);
      text("Wave: "+num_waves+"/"+total_waves, width/2-100, 70);
    } else {
      text("Collect "+((level+3)*60-p.resource) + " more scrap to advance", width/2-150, 40);
    }
    //checks to see if player is poisioned------------------------------------------------------------------------
    if (p.poisoned==true) {
      //decreased player health by poison damage------------------------------------------------------------------------
      p.health-=p.poison;
      p.poison_time++;
      if (p.poison_time>=200) {
        p.poisoned=false;
        p.poison_time=0;
      }
    }
    //checks to see if player is slowed------------------------------------------------------------------------
    if (p.slowed==true) {
      p.slow_time++;
      if (p.slow_time>=300) {
        //un-slows player after 300frames------------------------------------------------------------------------
        p.slowed=false;
        p.slow_time=0; 
        p.slow=1.0;
      }
    }
    if (p.reloading<=p.shoot_speed) {
      p.reloading++;
    }
    //machine gun!------------------------------------------------------------------------
    if (p.machine_gun&&p.reloading>=p.shoot_speed) {
      p.reloading=0+reload5;
      num_bullets++;
      bullets.add(new Bullet(5, new PVector(0, 0), new PVector(p.pos.x, p.pos.y), new PVector(mouseX, mouseY), 0));
    }
    //Resource for-loop. Theyre displayed here and all that other jazz.------------------------------------------------------------------------
    for (int i=0; i<num_resources; i++) {
      Resource r = (Resource)resources.get(i);
      r.display(); 
      if (dist_between(r.pos, p.pos)<=16) {
        resources.remove(r);
        num_resources--;
        i--;
        p.resource+=r.resourceUp;
      }
    }
    //Bullet for loop
    for (int i=0; i<num_bullets; i++) {
      Bullet b = (Bullet)bullets.get(i);
      b.move();
      b.display();
      if ((b.type==4||b.type==8)&&b.charge>=0) {//(4 - grenade launcher) charge
        b.charge-=0.5;
        if (b.charge<=0) {
          b.charge=0.0;
        }
      }
      if (b.type==6||b.type==-1) { //(6/-1 - web gun) 
        b.time--;
        if (b.time<=0) {
          b.pierce=0;
        }
        if (b.charge>=0) {
          if (b.type==6) {
            b.charge-=2;
          } else if (b.type==-1) {
            b.charge-=0.35;
          }
          if (b.charge<=0) {
            b.charge=0.0;
          }
        }
      }
      //checks to see if it's left the bounds of the map.
      if (((int)((b.pos.x+8)/16)+ (70*(int)(b.pos.y/16))>=2800) ||
        (((int)((b.pos.x-8)/16)+ (70*(int)(b.pos.y/16))) < 0) ||
        ((int)((b.pos.x)/16)+ (70*(int)((b.pos.y+8)/16))>=2800)||
        (((int)((b.pos.x)/16)+ (70*(int)((b.pos.y-8)/16))) < 0)) {
        b.explode=EXPLODE;
        b.pierce=0;
      } else {
        Node bul = (Node)astar.nodes.get((int)(b.pos.x/16)+ (70*(int)((b.pos.y+8)/16)));
        Node bul2 = (Node)astar.nodes.get((int)(b.pos.x/16)+ (70*(int)((b.pos.y-8)/16)));
        Node bul3 = (Node)astar.nodes.get((int)((b.pos.x+8)/16)+ (70*(int)((b.pos.y)/16)));
        Node bul4 = (Node)astar.nodes.get((int)((b.pos.x-8)/16)+ (70*(int)((b.pos.y)/16)));
        //checks to see if the bullet is in an unwalkable node
        if (bul.walkable || bul2.walkable || bul3.walkable || bul4.walkable) {
        } else { 
          b.explode = EXPLODE;
          b.pierce=0;
        }
      }
      boolean deleted=false;
      if (b.explode != EXPLODE) {
        if ((b.pos.x>1130||b.pos.x<0||b.pos.y>630||b.pos.y<0)) {
          bullets.remove(i);
          num_bullets--;
          i--;
          if (i == -1 && num_bullets <=0) {
            break;
          } else if (i == -1 && num_bullets > 0) {
            i=0;
          }
        }
        //checks to see if a bullet has collided with an enemy
        for (int j=0; j<num_enemies; j++) {
          Chaser c = (Chaser)chasers.get(j);
          float hit=dist_between(c.pos, b.pos);//this is the detection radius!
          float hit_player = dist_between(p.pos, b.pos);
          if (c.type == 7 || c.type == 8 || c.type == 13) {
            hit = hit/2;
          }
          if ((hit<=b.detection&&b.owner!=1)||b.pierce<=0||hit_player<=b.detection&&//normal case
          ((hit_player<=b.detection&&b.owner!=0)&&(hit_player<=b.detection&&b.owner!=2))||//no friendly fire for player
          (((b.type==4||b.type==8)&&b.charge==0.0)||(b.type==4||b.type==8)&&(c.type==10&&hit<=b.detection))&& //(4 - grenadelauncher),(8 - turret web bomb) bullet stopped moving
          (b.owner == 2 || c.type !=8)//something with mother boss
          ) {
            if (c.type!=11 &&c.type!=12) {
              if (b.explode != EXPLODE) {
                b.explode = EXPLODE;
              }
            }
          }
        }
      }
      //bullet has hit something!
      if (b.explode == EXPLODE) {
        for (int j=0; j<num_enemies; j++) {
          Chaser c = (Chaser)chasers.get(j);
          float hit=dist_between(c.pos, b.pos);//this is the blast radius!
          float hit_player = dist_between(p.pos, b.pos);
          if (c.type == 7 || c.type == 8 || c.type == 13) {
            hit = hit/2;
          }
          if (b.type==1&&hit<=b.detection+30) {//this is the mine!
            c.health-=b.damage;
            b.pierce-=1;
          } else if (b.type==6&&hit<=b.detection) {//web
            c.slow=0.25;
          } else if (b.type==6&&hit>=b.detection) {
            c.slow=1;
          } else if (hit<=b.detection) {
            b.pierce-=1;
            c.health-=b.damage;
            if (c.type==10) {
              b.pierce=0;
            }
          } else if (b.type==8) {
            b.pierce=0;
            ellipse(b.pos.x, b.pos.y, 60, 60);
            if (hit<=60) {
              if (c.slow>=.25) {
                c.slow-=.05;
              }
            }
          } else if (b.type==4) {
            b.pierce=0;
            ellipse(b.pos.x, b.pos.y, 60, 60);
            if (hit<=60) {
              c.health-=b.damage;
            }
          }
          if (hit_player <= b.detection) {
            b.pierce=0;
            p.health -= b.damage;
            if (b.type==-1) {
              p.poisoned=true;
            }
          }
        }
        //bullet has piereced maximum amount of enemies------------------------------------------------------------------------
        if (b.pierce<=0) {
          bullets.remove(i);
          num_bullets --;
          i--;
        }
        if (i == -1 && num_bullets <=0) {
          break;
        } else if (i == -1 && num_bullets > 0) {
          i=0;
        }
      }
    }
    //Chaser for loop!
    for (int i=0; i<num_enemies; i++) {
      Chaser c = (Chaser)chasers.get(i);
      //If the chaser type isn't a ghost execute this
      if (c.type!=14) {
        Node a = (Node)astar.nodes.get(2470);
        int target=0;
        if (level!=4&&level!=8) {
          a = (Node)astar.nodes.get((int)(p.pos.x/16)+
            (70*(int)(p.pos.y/16)));
          target = 0;
          if (c.type == 2) {
            if (num_turrets > 0) {
              float min_dist = 10000;
              for (int j=0; j<num_turrets; j++) {
                Turret t = (Turret)turrets.get(j);
                float dist = dist_between(t.pos, c.pos);
                if (dist < min_dist) {
                  target = j;
                  min_dist = dist;
                }
              }
              Turret t = (Turret)turrets.get(target);
              a = (Node)astar.nodes.get((int)(t.pos.x/16)+
                (70*(int)(t.pos.y/16)));
            } else {
              a = (Node)astar.nodes.get((int)(p.pos.x/16)+
                (70*(int)(p.pos.y/16)));
            }
          }
          //checks to see if it is a DEFENCE LEVEL------------------------------------------------------------------------
        } else if (level==4||level==8) {
          //displays base health ------------------------------------------------------------------------
          textSize(30);
          text("Base HP "+round(base_health), width/2-90, height/2);
          a = (Node)astar.nodes.get(1435);
          target = 0;
          if (c.type == 2) {
            if (num_turrets > 0) {
              float min_dist = 10000;
              for (int j=0; j<num_turrets; j++) {
                Turret t = (Turret)turrets.get(j);
                float dist = dist_between(t.pos, c.pos);
                if (dist < min_dist) {
                  target = j;
                  min_dist = dist;
                }
              }
              Turret t = (Turret)turrets.get(target);
              a = (Node)astar.nodes.get((int)(t.pos.x/16)+
                (70*(int)(t.pos.y/16)));
            } else {
              a = (Node)astar.nodes.get(1435);
            }
          }
          if (dist_between(c.pos, new PVector(width/2, height/2))<=50) {
            base_health-=0.032256;
            c.health=0;
          }
        }
        //mother enemy------------------------------------------------------------------------
        Node b = (Node)astar.nodes.get((int)(c.pos.x/16)+
          (70*(int)(c.pos.y/16)));
        if (c.type == 5) {
          if (c.mother_target == 0) {
            c.node = getRandomNode();
            while (a.walkable == false) {
              c.node = getRandomNode();
            }
            c.mother_target = 1;
          }
          a = c.node;
          //if mother has met it's location, spawn an egg
          if (a==b) {
            chasers.add(new Chaser(new PVector(c.pos.x, c.pos.y), 10, -1, 0, 120));
            num_enemies++;
            wave_spawned++;
            wave_enemies++;
            c.mother_target = 0;
          }
        } 
        if (c.type == 8) {
          //spawn en enemy from the egg; egg has hatched------------------------------------------------------------------------
          if (c.motherSpawn == 90) {
            chasers.add(new Chaser(new PVector(c.pos.x, c.pos.y), 30, -2, 0, 90));
            num_enemies++;
            wave_spawned++;
            wave_enemies++;
            c.mother_target = 0;
          }
          c.motherSpawn ++;
          if (c.motherSpawn > 90) {
            c.motherSpawn =0;
          }
          if (num_turrets > 0) {
            float min_dist = 10000;
            for (int j=0; j<num_turrets; j++) {
              Turret t = (Turret)turrets.get(j);
              float dist = dist_between(t.pos, c.pos);
              if (dist < min_dist) {
                target = j;
                min_dist = dist;
              }
            }
            //mother attacks turrets------------------------------------------------------------------------
            Turret t = (Turret)turrets.get(target);
            a = (Node)astar.nodes.get((int)(t.pos.x/16)+
              (70*(int)(t.pos.y/16)));
          } else {
            if (c.mother_target == 0) {
              c.node = getRandomNode();
              while (a.walkable == false) {
                c.node = getRandomNode();
              }
              c.mother_target = 1;
            }
            a = c.node;
            if (a==b) {
              chasers.add(new Chaser(new PVector(c.pos.x, c.pos.y), 10, -2, 0, 120));
              num_enemies++;
              wave_spawned++;
              wave_enemies++;
              c.mother_target = 0;
            }
          }
        }
        path = astar.bfs(a, b);

        if (c.type >= 0 && c.health > 0) {
          c.move();
        } else if (c.type<0) {
          c.eggHatch --;
          if (c.eggHatch == 0 && c.type == -1) {
            c.type = 0;
            c.health = 40;
            c.maxHealth = 40;
          }
          if (c.eggHatch == 0 && c.type == -2) {
            c.type =5;
            c.health = 200;
            c.maxHealth = 200;
          }
        }
        if (c.health<=0) {
          if (c.type==11||c.type==12||c.type==9) {
            c.health=-1;
          } else {
            c.health=0;
          }
          if (c.health == 0) {
            c.death ++;
            if (c.death >= 31) {
              score+=1;

              int rUp = (int)random(-11, 11);
              if (rUp > 0) {
                num_resources++;
                resources.add(new Resource(new PVector(c.pos.x, c.pos.y), rUp));
              }
              chasers.remove(i);
              num_enemies--;
              i--;
              wave_killed++;
            }
          } else {
            if (c.type==12) {
              num_enemies++;
              chasers.add(new Chaser(new PVector(c.pos.x, c.pos.y), 40, 11, 0, 0));
            }
            if (c.type==9) {//portal is disabled temporarily
              boss_disabled=true;
            }
            chasers.remove(i);
            num_enemies--;
            i--;
          }
        }
        //displays enemeis, calls collides
        c.display();
        c.collide(i);
        c.collide(i, target);
        //Shooter is close enough to shoot!------------------------------------------------------------------------
        if (c.type == 1 && dist_between(c.pos, p.pos) <=200 && c.reload ==100 && c.health >0) {
          c.shoot();
          c.reload = 0;
        }
        if (c.reload < 100) {
          c.reload ++;
        }
        //this is the final boss's tendrils
        if (c.type==12) {
          c.tendril_time++;
          if (c.tendril_time==40) {
            c.health=-1;
          }
        }
        //this is also the final boss's tendils
        if (c.type==11) {
          c.tendril_time++;
          if (c.tendril_time==40) {
            c.health=-1;
          }
        }
        if (c.type==13) {
          if (c.boss_reload3 >= 100) {//Timer for ghosties
            for (int k=0; k<4; k++) {
              c.ghosties();
            }
            c.boss_reload3=-200;
          }
          if (c.boss_reload3<100) {//Reload for ghosties
            c.boss_reload3++;
          }
        }
        if (c.type == 7) {
          if (c.boss_reload1 ==105) {//Timer for shield/turret spawn
            c.boss_reload1=0;
            if (boss_shield<6) {
              num_enemies++;
              chasers.add(new Chaser(new PVector(c.pos.x, c.pos.y), 40, 10, 0, 0));
              boss_shield++;
            }
            int portal_spawn=int(random(0, 5));//20% chance to respawn the portal at random corner
            if (portal_spawn==0&&boss_disabled==true) {
              boss_disabled=false;
              num_enemies++;
              wave_spawned ++;
              wave_enemies ++;
              chasers.add(new Chaser(new PVector(0, 0), 40, 9, 0, 0));
            }
          }
          if (c.boss_reload3 >= 100) {//Timer for shockwave
            c.shockwave();
            if (dist_between(p.pos, c.pos)>=245) {
              c.boss_reload3=dist_between(p.pos, c.pos)/20;
            } else {
              c.boss_reload3=0;
            }
          }
          if (dist_between(c.pos, p.pos) <=200 && c.reload ==100&&c.cooldown==false) {//If close enough, will barf
            c.shots++;
            c.reload = 96;
            c.barf();
          }
          if (dist_between(c.pos, p.pos)>=220&&c.boss_reload4==100&&c.cooldown2==false) {//Timer for tendrils
            c.shots2++;
            c.tendrils();
            c.boss_reload4=90;
          }
          if (boss_disabled==false) {
            if (c.boss_reload2==100) {//spawning random non-boss zombie from portal @nearby location
              c.boss_reload2=0;
              num_enemies++;
              int chaser_type=int(random(0, 7));
              chasers.add(new Chaser(new PVector(boss_portal_pos.x+random(-50, 50), boss_portal_pos.y+random(-50, 50)), 40, chaser_type, 0, 0));
              wave_spawned++;
              wave_enemies++;
            }
          }
          if (c.boss_reload1<105) {//Reload for shield/portal spawn
            c.boss_reload1++;
          }
          if (c.boss_reload2<100) {//Reload for shield/portal spawn
            c.boss_reload2++;
          }
          if (c.boss_reload3<100) {//Reload for shockwave
            c.boss_reload3++;
          }
          if (c.reload < 100) {
            c.reload ++;
          }
          if (c.boss_reload4<100) {
            c.boss_reload4++;
          }
          if (c.boss_reload4==100) {//Reload for tendrils
            c.cooldown2=false;
          }
          if (c.reload==100) {//Reload for barf
            c.cooldown=false;
          }
          if (c.shots>=18) {//When it shoots 18 barfs, barf goes on cooldown
            c.cooldown=true;
            c.shots=0;
            c.reload=0;
          }
          if (c.shots2>=10) {//When it spawns 10 tendrils, it goes on cooldown
            c.cooldown2=true;
            c.shots2=0;
            c.boss_reload4=90;
          }
        }
        //the Chaser type is a ghost!------------------------------------------------------------------------
      } else if (c.type==14) {
        c.move();
        c.display();
        c.collide(i);
        if (c.health<=0) {
          num_enemies--;
          chasers.remove(i);
        }
      }
    }
    //for loop for turrets------------------------------------------------------------------------
    for (int i=0; i<num_turrets; i++) {
      Turret t = (Turret)turrets.get(i);
      t.display();
      if (t.health <= 0) {
        turrets.remove(i);
        num_turrets --;
        i--;
      }
      //checks to see if a chaser is near a turret------------------------------------------------------------------------
      for (int j=0; j<num_enemies; j++) {
        Chaser c = (Chaser)chasers.get(j);
        //Turret type (0) - normal bullets
        if ((dist_between(t.pos, c.pos)<=200&&t.reload==100&&t.type==0)&&(c.type!=10&&c.type!=11&&c.type!=12)) {
          t.shoot(c.pos, 10);
          t.reload=0;
        } 
        //turret type (7)
        if ((dist_between(t.pos, c.pos)<=200&&t.reload==100&&t.type==2)&&(c.type!=10&&c.type!=11&&c.type!=12)) {      
          t.shoot(c.pos, 7);
          if (reload7<=15) {
            t.reload=80+reload7;
          } else {
            t.reload=95;
          }
        }
        //type (8)
        if ((dist_between(t.pos, c.pos)<=60&&t.reload==100&&t.type==3)&&(c.type!=10&&c.type!=11&&c.type!=12)) {      
          t.shoot(c.pos, 8);
          if (reload8<=15) {
            t.reload=80+reload;
          } else {
            t.reload=95;
          }
        }
      }
      //Turret type (1) - orbitting bullets
      if (t.reload==100&&t.type==1) {
        t.shoot(new PVector(0, 0), 2);
        if (reload2<=195) {
          t.reload=-100+reload2;
        } else {
          t.reload=95 ;
        }
      }
      if (t.reload<100) {
        t.reload++;
      }
    }
    //Player has lost. Go to loss screen------------------------------------------------------------------------
    if (p.health<=0||base_health<=0.5) {
      newScreen = 0;
      LOSING=true;
      PLAYING=false;
      UPGRADE=false;
    }
    //draws nodes and stuff
    drawNodes();
    p.move();
    p.display((int)moveN/8);
    if (charging==true&&p.charge<=15) {
      p.charge+=0.5;
    }
    fill(0);
    //If you have completed the level, display this ------------------------------------------------------------------------
    if (CONTINUE==true) {
      textSize(40);
      text("CONTINUE->", width*.75, height/2);
    }

    /*  text("SCORE: "+score, width/2, 100);
     if (num_waves<=total_waves) {
     text("Wave: "+num_waves+"/3", width/2, 120);
     } else {
     text("Wave: Completed", width/2, 120);
     }
     text("Wave killed: "+wave_killed, width/2, 160);
     text("Wave enemies: "+wave_enemies, width/2, 180);
     text("Wave spawned: "+wave_spawned, width/2, 200);
     text ("This is a sandbox demonstration of the game to give an idea of mechanics/where we're at.", 50, 20);
     text ("Press enter to 'win'.", 50, 50);
     text("Enemies left in wave: "+(wave_enemies-wave_killed), width/2, 140);
     text("Health: "+p.health, 100, 100);
     text("Weapon: "+p.weapon, 100, 120);
     text("Metal: "+p.resource, 100, 140);
     text("Arrow keys to move. 'A' to place turrets.'0' for mines. '1' for bullets", 50, 80);
     */
    //Losing screen------------------------------------------------------------------------
  } else if (LOSING) {
    image(go, width/2, height/2, 1120, 640);
    if (newScreen == 0) {
      playMusic();
      newScreen = 1;
    }
    p.resource = 0;
    if (moveOn == true) {
      nextLevel();
    }
    //Story screen/music------------------------------------------------------------------------
  } else if (STORYS) {
    if (newScreen == 0) {
      playMusic();
      newScreen = 1;
    }
    imageMode(CENTER);
    image(story[storySlide], width/2, height/2, 1120, 640);
    //Upgrade screen
  } else if (UPGRADE) {
    //println("X: "+mouseX, "Y: "+mouseY);
    rectMode(CORNER);
    imageMode(CORNER);
    if (newScreen == 0) {
      playMusic();
      newScreen = 1;
    }
    image(upgrade_screen, 0, 0, 1120, 680);
    if (mouseX>=45&&mouseX<=205) {
      if (mouseY>=103&&mouseY<=133) {
        utext="Damage Upgrade for Pistol(20loonies)";
      } else if (mouseY>=137&&mouseY<=171) {
        utext="Pierce Upgrade for Pistol(25loonies)";
      } else if (mouseY>=330&&mouseY<=361) {
        utext="Pierce Upgrade for SmallFry(40loonies)";
      } else {
        utext="";
      }
    } else if (mouseX>=219&&mouseX<=378) {
      if (mouseY>=76&&mouseY<=96) {
        utext="Unlock Mines(50loonies)";
      } else if (mouseY>=103&&mouseY<=133) {
        utext="Damage Upgrade for Mine(10loonies)";
      } else if (mouseY>=302&&mouseY<=325) {
        utext="Unlock Orbulator(50loonies)";
      } else if (mouseY>=330&&mouseY<=361) {
        utext="Damage Upgrade for Orbulator(20loonies)";
      } else {
        utext="";
      }
    } else if (mouseX>=391&&mouseX<=551) {
      if (mouseY>=76&&mouseY<=96) {
        utext="Unlock Shotgun(50loonies)";
      } else if (mouseY>=103&&mouseY<=133) {
        utext="Damage Upgrade for Shotgun(20loonies)";
      } else if (mouseY>=137&&mouseY<=171) {
        utext="Reload Upgrade for Shotgun(20loonies)";
      } else if (mouseY>=302&&mouseY<=325) {
        utext="Unlock Red Pepper(50loonies)";
      } else if (mouseY>=330&&mouseY<=357) {
        utext="Reload Upgrade for Red Pepper(20loonies)";
      } else {
        utext="";
      }
    } else if (mouseX>=564&&mouseX<=723) {
      if (mouseY>=76&&mouseY<=96) {
        utext="Unlock Chaingun(50loonies)";
      } else if (mouseY>=103&&mouseY<=133) {
        utext="Damage Upgrade for Chaingun(20loonies)";
      } else if (mouseY>=137&&mouseY<=171) {
        utext="Reload Upgrade for Chaingun(20loonies)";
      } else if (mouseY>=302&&mouseY<=325) {
        utext="Unlock THE EMISSIONER(50loonies)";
      } else if (mouseY>=330&&mouseY<=357) {
        utext="Reload Upgrade for THE EMISSIONER(20loonies)";
      } else {
        utext="";
      }
    } else if (mouseX>=736&&mouseX<=897) {
      if (mouseY>=76&&mouseY<=96) {
        utext="Unlock Grenade(50loonies)";
      } else if (mouseY>=103&&mouseY<=133) {
        utext="Damage Upgrade for Grenade(20loonies)";
      } else {
        utext="";
      }
    } else if (mouseX>=909&&mouseX<=1069) {
      if (mouseY>=76&&mouseY<=96) {
        utext="Unlock Webgun(50loonies)";
      } else if (mouseY>=103&&mouseY<=133) {
        utext="Time Upgrade for Webgun(20loonies)";
      } else if (mouseY>=137&&mouseY<=171) {
        utext="Reload Upgrade for Webgun(20loonies)";
      } else {
        utext="";
      }
    } else {
      utext="";
    }
    textFont(credit_font, 30);
    text(utext, 35, 545);
    text("Your loonies: "+p.loonies, 35, 600);
    //credit screen! you win!------------------------------------------------------------------------
  } else if (CREDITS) {
    if (newScreen == 0) {
      playMusic();
      newScreen = 1;
    }
    clear();
    credit();
    for (int i=0; i<100; i++) {
      c[i].display_fetti();
      if (mouseX>=width/2) {
        c[i].move_fetti(random(-1, 4));
      } else {
        c[i].move_fetti(random(-4, 1));
      }
    }
  }
}

//returns a random node------------------------------------------------------------------------
Node getRandomNode() {
  Node n = null;
  while (true) {
    n = (Node)astar.nodes.get((int)random(astar.nodes.size()));
    if (n.walkable) break;
  }
  return n;
}

//sets nodes on screen------------------------------------------------------------------------
void setNodes() {
  //below are level designs for walls. walls must be hardcoded based on node arithmetic. this is not difficult, but time consuming.----------------------------------------
  if (level == 2 || level == 6) {
    for (int i = 280+630; i<325+630; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 280+560; i<325+560; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 280+490; i<325+490; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 2335-350; i<2380-350; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 2335-420; i<2380-420; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 2335-490; i<2380-490; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
  }
  if (level == 5) {
    for (int i = 280; i<335; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 280+70; i<335+70; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 280+140; i<335+140; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
  }

  if (level == 3 || level == 7) {
    for (int i = 293; i < 2464; i+=70) { 
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    } 
    for (int i = 293+1; i < 2464+1; i+=70) { 
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false    ;
    }
    for (int i = 293+14; i < 2464+14; i+=70) { 
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    } 
    for (int i = 293+1+14; i < 2464+1+14; i+=70) { 
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false    ;
    }    
    for (int i = 293+28; i < 2464+28; i+=70) { 
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    } 
    for (int i = 293+1+28; i < 2464+1+28; i+=70) { 
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false    ;
    }    
    for (int i = 293+42; i < 2464+42; i+=70) { 
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    } 
    for (int i = 293+1+42; i < 2464+1+42; i+=70) { 
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 1064-70; i<1071-70; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 1064; i<1071; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 1064+70; i<1071+70; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 1064+630+7; i<1071+630+7; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 1064+700+7; i<1071+700+7; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 1064+770+7; i<1071+770+7; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 1064+630+28; i<1071+630+28; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 1064+700+28; i<1071+700+28; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 1064+770+28; i<1071+770+28; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 1064-70+7+28; i<1071-70+7+28; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 1064+7+28; i<1071+7+28; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 1064+70+7+28; i<1071+70+7+28; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
  }
  if (level == 1 || level == 4 || level == 8) {
    for (int i = 293; i < 993; i+=70) { 
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    } 
    for (int i = 293+1; i < 993+1; i+=70) { 
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false    ;
    }
    for (int i = 1763; i <= 2463; i+=70) { 
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    } 
    for (int i = 1763+1; i <= 2463+1; i+=70) { 
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false    ;
    }
    for (int i = 993+14; i <= 1763+14; i+=70) { 
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    } 
    for (int i = 993+1+14; i <= 1763+1+14; i+=70) { 
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false    ;
    }    
    for (int i = 993+28; i <= 1763+28; i+=70) { 
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    } 
    for (int i = 993+1+28; i <= 1763+1+28; i+=70) { 
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false    ;
    }    
    for (int i = 293+42; i < 993+42; i+=70) { 
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    } 
    for (int i = 293+1+42; i < 993+1+42; i+=70) { 
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 1763+42; i <= 2464+42; i+=70) { 
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    } 
    for (int i = 1763+1+42; i <= 2464+1+42; i+=70) { 
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 294; i<294+41; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 294+70; i<294+41+70; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 294+140; i<294+41+140; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 2324; i<2324+41; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 2324+70; i<2324+70+41; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 2324+140; i<2324+140+41; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 994+14; i<994+14+6; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 994+70+14; i<994+70+14+6; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 994+140+14; i<994+140+14+6; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 994+22; i<994+28; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 994+70+22; i<994+70+28; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 994+140+22; i<994+140+28; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 1624+14; i<1624+14+6; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 1624+70+14; i<1624+70+14+6; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 1624+140+14; i<1624+140+14+6; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 1624+22; i<1624+28; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 1624+70+22; i<1624+70+28; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
    for (int i = 1624+140+22; i<1624+140+28; i++) {
      Node temp = (Node)astar.nodes.get(i); 
      temp.walkable = false;
    }
  }
  astar.radialDisconnectUnwalkables();
}
//display nodes! this is for our testing purposes------------------------------------------------------------------------
void drawNodes() {  
  fill(0); 
  rectMode(CENTER);
  /*if (level == 2 || level == 6) {
   for (int i = 280+490; i<325+490; i++) {
   rect((i%70)*16, ((floor((float)i/70))*16+22), 16, 14);
   }
   for (int i = 2335-490; i<2380-490; i++) {
   rect((i%70)*16+16, ((floor((float)i/70))*16+22), 16, 14);
   }
   }
   if (level == 5) {
   for (int i = 280; i<335; i++) {
   rect((i%70)*16, ((floor((float)i/70))*16+22), 16, 14);
   }
   }
   if (level == 3 || level == 7) {
   for (int i = 293; i < 2324; i+=70) { 
   rect((i%70)*16 + 16, ((floor((float)i/70))*16+24), 12, 16);
   } 
   for (int i = 293+14; i < 2324+14; i+=70) { 
   rect((i%70)*16 + 16, ((floor((float)i/70))*16+24), 12, 16);
   } 
   for (int i = 293+28; i < 2324+28; i+=70) { 
   rect((i%70)*16 + 16, ((floor((float)i/70))*16+24), 12, 16);
   } 
   for (int i = 293+42; i < 2324+42; i+=70) { 
   rect((i%70)*16 + 16, ((floor((float)i/70))*16+24), 12, 16);
   } 
   for (int i = 1064-70; i<1070-70; i++) {
   rect((i%70)*16 + 15, ((floor((float)i/70))*16+22), 16, 14);
   }
   for (int i = 1064+630+7; i<1070+630+7; i++) {
   rect((i%70)*16 + 17, ((floor((float)i/70))*16+22), 17, 14);
   }
   for (int i = 1064+630+28; i<1070+630+28; i++) {
   rect((i%70)*16 + 15, ((floor((float)i/70))*16+22), 16, 14);
   }
   for (int i = 1064-70+7+28; i<1070-70+7+28; i++) {
   rect((i%70)*16 + 17, ((floor((float)i/70))*16+22), 17, 14);
   }
   }
   if (level == 1 || level == 4 || level == 8) {
   for (int i = 1763; i < 2323; i+=70) { 
   rect((i%70)*16 + 16, ((floor((float)i/70))*16+24), 12, 16);
   } 
   for (int i = 293; i < 993-140; i+=70) { 
   rect((i%70)*16 + 16, ((floor((float)i/70))*16+24), 12, 16);
   } 
   for (int i = 993+14; i < 1763+14-140; i+=70) { 
   rect((i%70)*16 + 16, ((floor((float)i/70))*16+24), 12, 16);
   } 
   for (int i = 993+28; i < 1763+28-140; i+=70) { 
   rect((i%70)*16 + 16, ((floor((float)i/70))*16+24), 12, 16);
   } 
   for (int i = 293+42; i < 993-140+42; i+=70) { 
   rect((i%70)*16 + 16, ((floor((float)i/70))*16+24), 12, 16);
   } 
   for (int i = 1763+42; i < 2323+42; i+=70) { 
   rect((i%70)*16 + 16, ((floor((float)i/70))*16+24), 12, 16);
   } 
   for (int i = 293; i<294+42; i++) {
   if (i == 294+41) {
   rect((i%70)*16 + 17, ((floor((float)i/70))*16+22), 10, 14);
   } else {
   rect((i%70)*16 + 17, ((floor((float)i/70))*16+22), 16, 14);
   }
   }
   for (int i = 2323; i<2324+42; i++) {
   if (i == 2324+41) {
   rect((i%70)*16 + 16, ((floor((float)i/70))*16+22), 12, 14);
   } else {
   rect((i%70)*16 + 18, ((floor((float)i/70))*16+22), 16, 14);
   }
   }
   for (int i = 993+14; i<994+14+5; i++) {
   rect((i%70)*16 + 18, ((floor((float)i/70))*16+22), 16, 14);
   }
   for (int i = 993+23; i<994+28; i++) {
   if (i == 994+27) {
   rect((i%70)*16 + 16, ((floor((float)i/70))*16+22), 12, 14);
   } else {
   rect((i%70)*16 + 18, ((floor((float)i/70))*16+22), 16, 14);
   }
   }
   for (int i = 1623+14; i<1624+14+5; i++) {
   rect((i%70)*16 + 18, ((floor((float)i/70))*16+22), 16, 14);
   }
   for (int i = 1623+23; i<1624+28; i++) {
   if (i == 1624+27) {
   rect((i%70)*16 + 16, ((floor((float)i/70))*16+22), 12, 14);
   } else {
   rect((i%70)*16 + 18, ((floor((float)i/70))*16+22), 16, 16);
   }
   }
   }*/
}
/*void drawBackground() {
 for (int i = 0; i <= 1119; i++) {
 image(grass, (i%70)*16+8, ((floor((float)i/70))*16)+8, 16, 16);
 }
 for (int i = 1120; i <= 1679; i++) {
 image(concrete, (i%70)*16+8, ((floor((float)i/70))*16)+8, 16, 16);
 }
 for (int i = 1680; i <= 2799; i++) {
 image(grass, (i%70)*16+8, ((floor((float)i/70))*16)+8, 16, 16);
 }
 }*/
//draw path
void drawPath() {
  strokeWeight(20);
  noFill();
  stroke(40, 230, 40, 150);
  if (path != null) {
    beginShape();
    for (int i = 0; i < path.size (); i++) {
      Node temp = (Node)path.get(i);
      vertex(temp.x, temp.y);
    }
    endShape();
  }
}
//Mouse pressed!
void mousePressed() {
  //moving through story slides
  if (STORYS) {
    if (level == 1) {
      if (storySlide == 18) {
        STORYS = false;
        PLAYING = true;
        newScreen = 0;
      }
    }
    if (level >= 2 && level <= 9) {
      if (storySlide == 34 || storySlide == 48 || storySlide == 58 || storySlide == 67 ||
        storySlide == 79 || storySlide == 96 || storySlide == 111 || level == 129) {
        newScreen = 0;
        STORYS = false;
        UPGRADE = true;
      }
    }
    if (level == 10) {
      if (storySlide == 158) {
        newScreen = 0;
        STORYS = false;
        CREDITS = true;
      }
    }
    storySlide++;
  }
  //shoots the gun!------------------------------------------------------------------------
  if (PLAYING) {
    if (p.weapon==0&&p.reloading>=p.shoot_speed) {
      p.reloading=0;
      num_bullets+=1;
      bullets.add(new Bullet(p.weapon, new PVector(0, 0), new PVector(p.pos.x, p.pos.y), new PVector(mouseX, mouseY), 0));
    }
    if (p.weapon==1&&p.resource>=5&&p.reloading>=p.shoot_speed&&MINE) {
      p.reloading=0;
      num_bullets+=1;
      p.resource-=5;
      bullets.add(new Bullet(p.weapon, new PVector(0, 0), new PVector(p.pos.x, p.pos.y), new PVector(mouseX, mouseY), 0));
    }
    if (p.weapon==3&&p.reloading>=p.shoot_speed&&SHOTGUN) {
      p.reloading=0+reload3;
      for (int i = 0; i<5; i++) {
        num_bullets+=1;
        bullets.add(new Bullet(p.weapon, new PVector(0, 0), new PVector(p.pos.x, p.pos.y), new PVector((mouseX+random(0, dist_between(new PVector(mouseX, mouseY), p.pos)/35)), (mouseY+random(0, dist_between(new PVector(mouseX, mouseY), p.pos)/35))), 0));
      }
    }
    if (p.weapon==4&&p.reloading>=p.shoot_speed&&GRENADE) {
      charging=true;
    }
    if (p.weapon==5&&CHAINGUN) {
      p.machine_gun=true;
    }
    if (p.weapon==6&&p.reloading>=p.shoot_speed&&WEBGUN) {

      p.reloading=0+reload6;
      num_bullets+=1;
      p.charge=25;
      bullets.add(new Bullet(p.weapon, new PVector(21, 21), new PVector(p.pos.x, p.pos.y), new PVector(mouseX+random(0, 20), mouseY+random(0, 20)), 0));
    }
  }
  //allows you to purchase things------------------------------------------------------------------------
  if (UPGRADE) {
    if (mouseX>=45&&mouseX<=205) {
      if (mouseY>=103&&mouseY<=133&&p.loonies>=20) {
        damage0+=3;
        p.loonies-=20;
      } else if (mouseY>=137&&mouseY<=171&&p.loonies>=25) {
        pierce0+=1;
        p.loonies-=25;
      } else if (mouseY>=330&&mouseY<=361&&p.loonies>=40) {
        pierce10+=1;
        p.loonies-=40;
      }
    } else if (mouseX>=219&&mouseX<=378) {
      if (mouseY>=76&&mouseY<=96&&MINE==false&&p.loonies>=50) {
        MINE=true;
        p.loonies-=50;
      } else if (mouseY>=103&&mouseY<=133&&p.loonies>=20&&MINE) {
        damage1+=10;
        p.loonies-=20;
      } else if (mouseY>=302&&mouseY<=325&&ORBULATOR==false&&p.loonies>=50) {
        ORBULATOR=true;
        p.loonies-=50;
      } else if (mouseY>=330&&mouseY<=361&&p.loonies>=20&&ORBULATOR) {
        damage2+=3;
        p.loonies-=20;
      }
    } else if (mouseX>=391&&mouseX<=551) {
      if (mouseY>=76&&mouseY<=96&&SHOTGUN==false&&p.loonies>=50) {
        SHOTGUN=true;
        p.loonies-=50;
      } else if (mouseY>=103&&mouseY<=133&&p.loonies>=20&&SHOTGUN) {
        damage3+=1;
        p.loonies-=20;
      } else if (mouseY>=137&&mouseY<=171&&p.loonies>=20&&SHOTGUN) {
        reload3+=4;
        p.loonies-=20;
      } else if (mouseY>=302&&mouseY<=325&&REDPEPPER==false&&p.loonies>=50) {
        REDPEPPER=true;
        p.loonies-=50;
      } else if (mouseY>=330&&mouseY<=357&&p.loonies>=20&&REDPEPPER) {
        p.loonies-=20;        
        reload7+=.5;
      }
    } else if (mouseX>=564&&mouseX<=723) {
      if (mouseY>=76&&mouseY<=96&&CHAINGUN==false&&p.loonies>=50) {
        CHAINGUN=true;
        p.loonies-=50;
      } else if (mouseY>=103&&mouseY<=133&&p.loonies>=20&&CHAINGUN) {
        p.loonies-=20;
        damage5+=1;
      } else if (mouseY>=137&&mouseY<=171&&p.loonies>=20&&CHAINGUN) {
        p.loonies-=20;
        reload5+=0.15;
      } else if (mouseY>=302&&mouseY<=325&&EMISSIONER==false&&p.loonies>=50) {
        EMISSIONER=true;
        p.loonies-=50;
      } else if (mouseY>=330&&mouseY<=357&&p.loonies>=20&&EMISSIONER) {
        p.loonies-=20;
        reload8+=3;
      }
    } else if (mouseX>=736&&mouseX<=897) {
      if (mouseY>=76&&mouseY<=96&&GRENADE==false&&p.loonies>=50) {
        GRENADE=true;
        p.loonies-=50;
      } else if (mouseY>=103&&mouseY<=133&&p.loonies>=40&&GRENADE) {
        p.loonies-=40;
        damage4+=2;
      }
    } else if (mouseX>=909&&mouseX<=1069) {
      if (mouseY>=76&&mouseY<=96&&WEBGUN==false&&p.loonies>=50) {
        p.loonies-=50;
        WEBGUN=true;
      } else if (mouseY>=103&&mouseY<=133&&p.loonies>=20&&WEBGUN) {
        time6+=50;
        p.loonies-=20;
      } else if (mouseY>=137&&mouseY<=171&&p.loonies>=20&&WEBGUN) {
        reload6+=4;
        p.loonies-=20;
      } else if (mouseY>=527&&mouseY<=621) {
        rectMode(CENTER);
        imageMode(CENTER);
        newScreen = 0;
        UPGRADE=false;
        PLAYING=true;
      }
    }
  }
}
void mouseReleased() {  
  //Shoots grenade launcher
  if (p.weapon==4&&p.reloading>=p.shoot_speed) {
    p.reloading=0;
    charging=false;
    num_bullets+=1;
    bullets.add(new Bullet(p.weapon, new PVector(p.charge, p.charge), new PVector(p.pos.x, p.pos.y), new PVector(mouseX, mouseY), 0));
    p.charge=8;
  }
  //stops shooting the machinegun
  if (p.weapon==5) {
    p.machine_gun=false;
  }
}
//movement!
void keyPressed() { 
  //up------------------------------------------------------------------------
  if (keyCode=='W') { 
    buttonUp = 1;
  } 
  //down------------------------------------------------------------------------
  if (keyCode=='S') { 
    buttonDown = 1;
  } 
  //left------------------------------------------------------------------------
  if (keyCode=='A') { 
    buttonLeft = 1;
  } 
  //right------------------------------------------------------------------------
  if (keyCode=='D') { 
    buttonRight =1;
  }
  if (keyCode==ENTER) { 
    if (screen ==0) {
      newScreen = 0;
      STORYS = true;
      TITLE=false;
      screen++;
    } else if (level == 2) {
      if (p.resource >= 300) {
        moveOn = true;
      } else {
        moveOn = false;
      }
    } else if (level == 7) {
      if (p.resource >= 600) {
        moveOn = true;
      } else {
        moveOn = false;
      }
    }
    if (LOSING) {
      moveOn = true;
    }
  }
  //placing turrets/choosing weapon------------------------------------------------------------------------
  if (keyCode=='Z'&&p.resource>=10) { 
    p.resource-=10;
    num_turrets++;
    turrets.add(new Turret(new PVector(p.pos.x, p.pos.y), 0, 10, 40, 0));
  }
  if (keyCode=='X'&&p.resource>=10&&ORBULATOR) { 
    p.resource-=10;
    num_turrets++;
    turrets.add(new Turret(new PVector(p.pos.x, p.pos.y), 0, 10, 40, 1));
  }
  if (keyCode=='C'&&p.resource>=10&&REDPEPPER) { 
    p.resource-=10;
    num_turrets++;
    turrets.add(new Turret(new PVector(p.pos.x, p.pos.y), 0, 10, 40, 2));
  }
  if (keyCode=='V'&&p.resource>=10&&EMISSIONER) { 
    p.resource-=10;
    num_turrets++;
    turrets.add(new Turret(new PVector(p.pos.x, p.pos.y), 0, 10, 40, 3));
  }
  if (key == 'r') {
    bullets_remaining = 0;
  }
  if (key == 'i') {
    if (PLAYING) {
      PLAYING = false;
      INSTRUCTIONS = true;
    } else if (INSTRUCTIONS) {
      PLAYING = true;
      INSTRUCTIONS = false;
    }
  }
  if (key == '0') {
    p.weapon=0;
    p.shoot_speed=15;
    p.machine_gun=false;
  }
  if (key == '1'&&MINE) {
    p.weapon=1;
    p.shoot_speed=50;
    p.machine_gun=false;
  }
  if (key == '2'&&SHOTGUN) {
    p.weapon=3;
    p.shoot_speed=80;
    p.machine_gun=false;
  }
  if (key == '3'&&GRENADE) {
    p.weapon=4;
    p.shoot_speed=50;
    p.machine_gun=false;
  }
  if (key == '4'&&CHAINGUN) {
    p.weapon=5;
    p.shoot_speed=5;
  }
  if (key == '5'&&WEBGUN) {
    p.weapon=6;
    p.shoot_speed=50;    
    p.machine_gun=false;
  }
} 
//resets value to 0 of player movement
void keyReleased() { 
  if (keyCode=='W') { 
    buttonUp = 0;
  } 
  if (keyCode=='S') { 
    buttonDown =0;
  } 
  if (keyCode=='A') { 
    buttonLeft = 0;
  } 
  if (keyCode=='D') { 
    buttonRight = 0;
  }
}
void keyCheck() {
  if (buttonUp == 1) {    
    p.v.y = -3;
  }
  if (buttonDown == 1) {
    p.v.y = 3;
  } 
  if (buttonLeft == 1) {
    p.v.x = -3;
  } 
  if (buttonRight == 1) {
    p.v.x = 3;
  }
  if (buttonRight == buttonLeft ) {
    p.v.x = 0;
  }
  if (buttonDown == buttonUp) {
    p.v.y = 0;
  }
  if (buttonUp ==1 || buttonDown ==1 || buttonLeft == 1|| buttonRight ==1) {
    moveN ++;      
    if (moveN == 32) {
      moveN = 0;
    }
  }
}

//Play Music based on screen
void playMusic() {
  if (TITLE) {
    titleMusic.loop();
  } else if (PLAYING) {
    if (level == 3) {
      bossMusic1.rewind();
      bossMusic1.loop();
      loseMusic.pause();
      upgradeMusic.pause();
    } else if (level == 6) {
      bossMusic2.rewind();
      bossMusic2.loop();
      loseMusic.pause();
      upgradeMusic.pause();
    } else if (level == 9) {
      bossMusic3.rewind();
      bossMusic3.loop();
      loseMusic.pause();
      upgradeMusic.pause();
    } else {
      levelMusic.rewind();
      levelMusic.loop();
      loseMusic.pause();
      upgradeMusic.pause();
      storyMusic.pause();
    }
  } else if (LOSING) {
    loseMusic.rewind();
    loseMusic.loop();
    levelMusic.pause();
    bossMusic1.pause();
    bossMusic2.pause();
    bossMusic3.pause();
  } else if (UPGRADE) {
    upgradeMusic.rewind();
    upgradeMusic.loop();
    loseMusic.pause();
    storyMusic.pause();
  } else if (CREDITS) {
    creditMusic.loop();
    levelMusic.pause();
    bossMusic3.pause();
    storyMusic.pause();
  } else {
    storyMusic.rewind();
    storyMusic.loop();
    titleMusic.close();
    levelMusic.pause();
    bossMusic1.pause();
    bossMusic2.pause();
    bossMusic3.pause();
    upgradeMusic.pause();
  }
}

