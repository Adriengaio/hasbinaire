import processing.video.*;
Movie mov;
 
 
 
//variable definissant le n° de la video en train d'être jouée et le nb de video
int movSel;
 
 
// variable definissant la taille en px de la video
int largeur=1280 ;
int hauteur=960;
 
//time 1&2&3 définnissent les intants ou l'on change de vidéos
float[] times = {
  0.0, 21.28, 34.2,
};
int time1=0, time2=24, time3=36;
 
void setup() {
  size(displayWidth, displayHeight);
  background(0);
  fill(255, 0, 0);
  mov = new Movie(this, "hasbinaire.mov");
  mov.loop();
}
void draw()
{
  if (mov.available()) {
    mov.read();
  }
  image(mov, 0, 0, 1280, 960);
  tint(255);
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
}
