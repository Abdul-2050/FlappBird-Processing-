

/**
 * Author: Abdul
 * Codevirsion: 1.1
 * For: Bruder Ahmed Can
 * codewritten: 18/02/2022
 *
 * mit Enter geht der Bird nach oben
 * mit s kann man das spielen restarten
 */


// referenz von Bird class
Bird bird;
int bx, by, bw, bh;

// globale varibalen
int gravity=1;
int lift= 15;

// ArrayList fur speichern von Bird
ArrayList<Piler> piler= new ArrayList<Piler>();

// wenn das true ist nur dann wird das spiel gehen sonst nihct
boolean play= true;


// setup methode du weisst ja das wird nur einmal geführt 
void setup() {
  size(600, 600);
  surface.setResizable(true);
  bx= width/2-120;
  by= height/2;
  bw= 30;
  bh= 30;

  //frameRate(60);
  piler.add(new Piler());
}


// draw methide wird immer unendlich mal laufen (oder gibst da ein condition oder du machst noLoop)
void draw() {
  background(0);
  // hier wird ensteht der Object
  bird= new Bird(bx, by, bw, bh);

  // check, ob der boden berührt . Wenn ja mach den bei height
  if (by>= height) {
    by=height;
  }


  // lasse den Bird immer fallen
  by+=gravity;
  // adde immer wenn frame % 120 ist ein piler in ArrayList (ArrayList ist wie ein Normales Array. Nur du kannst bei ArrayList bei Runtime piler adden oder entfernen) (also das ist ein Datatype)
  if (play) {
    if (frameCount%120 == 0) {
      piler.add(new Piler());
    }
  }


  // hier in dieser for loop machst du jedes object show und update methode
  for (int a=0; a<piler.size()-1; a++) {
    piler.get(a).show();
    piler.get(a).update();

    if (piler.get(a).isDead()) {
      piler.remove(a);
    }

    if (piler.get(a).intersects(by, bx)) {
      play= false;
      println("out");
    }

    // und hier wenn spiel zu ende ist
    if (play==false) {
      by= height/2;
      piler.get(a).stop();
      fill(255);
      textSize(24);
      textAlign(CENTER);
      text("Game Over", height/2 , height/2);
    }
  }
}


// und das halt keyPressed kennst du ja
void keyPressed() {
  if (play) {
    if (key == ENTER) {
      by-= lift;
    }
  }
  
  // restarte das spiel
  if(key == 's'|| key =='S'){
    play=true;
  }
}
