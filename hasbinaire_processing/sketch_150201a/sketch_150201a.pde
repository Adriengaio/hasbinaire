import processing.video.*;
import processing.opengl.*;
import gifAnimation.*;
Gif gif1;
Movie mov;
//variable definissant le n° de la video en train d'être jouée et le nb de video
int movSel;
boolean gifloaded;
boolean notloaded;
boolean[] keys = new boolean [1];
final int S = 0;
Gif[] gifs = new Gif [3];
 
 
// variable definissant la taille en px de la video
int largeur=1080 ;
int hauteur=720;
 
//time 1&2&3 définnissent les intants ou l'on change de vidéos
float[] times = {
  0.0, 21.28, 34.2,
};
float time1=0, time2=21.28, time3=34.2;
 
void setup() {
  size(1080, 720);
  background(0);
  fill(255, 0, 0);
  mov = new Movie(this, "hasbinaire.mov");
  mov.loop();
  gif1=null;
  gifs[0] = new Gif(this, "alphar.gif");
  gifs[1] = new Gif(this, "alphaj.gif");
  gifs[2] = new Gif(this, "alphav.gif");
  notloaded = true;
}
void draw()
{
  mov.read();
  if(keys[S]){
  image(mov, 0, 0, 1080, 720);
  print(gif1);
  print(notloaded);
   if(gifloaded){
    print(1);
    gif1.loop();
    image(gif1,0,0,1080,720);
    tint(255, 126);
    }else 
    if(gif1==null&&notloaded){
    print(2);
    gifloaded = loadGif();
    }
  }
  else{
   if(gif1!=null){
     gif1.stop();
     gif1 = null;
     gifloaded = false;
     notloaded = true;
   }
   image(mov, 0, 0, 1080, 720);
  }
}
 
//permet de supprimer les bords de la fenetre processing
//boolean sketchFullScreen() {
//return true;
///}
 
 
void keyPressed() {
  if (key == ' ') {
    int tmp = int( random( times.length ) );
 
    while (movSel == tmp) {
      tmp = int( random( times.length ) );
    }
 
    movSel = tmp;
    mov.jump( times[ movSel ] );
  }
  if (key == 's'||key == 'S') {
    keys[S] = true;
  }
}
void keyReleased() {
  if (key == 's'||key == 'S'){
    keys[S] = false;
  } 
}
boolean loadGif(){
    notloaded = false;
    int nm = int(random(3));
    gif1 = gifs[nm];
    return true;
}
