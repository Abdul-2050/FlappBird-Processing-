
import java.util.Random;

// class Piler damit du Säulen erzeugen kannst 
public class Piler {

  Random ran1;
  Random ran2;

  int random1;
  int random2;

  int x;

  Random random3;
  int w;

// Construcktor
  Piler() {

    ran1= new Random();
    ran2= new Random();

    random1= ran1.nextInt(300);
    random2= ran2.nextInt(300);

    random3= new Random();
    w= random3.nextInt(30);

    x=450;
  }



// methode für um saülen zu zeigen
  void show() {

    if (w < 10) w=20;
    fill(154, 205, 50);

    rect(x, 0, 20, random1);
    rect(x, height- random2, 20, random2);
  }

// methode für bewegen der säulen
  void update() {
    x-=2;
  }

// methode für checken ob der der Bird tot ist oder nicht (wenn ja dann returnt er true else false)
  boolean isDead() {
    if (x< -30) {
      return true;
    } else {
      return false;
    }
  }

// methode für checken, ob der bird mit s´diese säulen berührt oder nicht  (wenn ja returnt er true else false)
  boolean intersects(int y, int x) {
    if (y < random1 || y> height-random2) {
      if (x > this.x && x < this.x +30) {
        //changeCol= true;
        return true;
      }
    }

    return false;
  }
  
  // methode um saülen zu stoppen
  void stop(){
    x=0;
  }
}
