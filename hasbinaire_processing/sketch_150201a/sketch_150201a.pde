import processing.video.*;
Movie mov;
Movie neige;

//défécation
//wesh tu vas bien ?
//variable definissant le n° de la video en train d'être jouée et le nb de video
int movSel=1;
int nb_video=3;

// variable definissant la taille en px de la video
int largeur=1280 ;
int hauteur=960;

//time 1&2&3 définnissent les intants ou l'on change de vidéos
float[] times = { 
  0.0, 21.28, 34.2,
};
float time1=0, time2=21.28, time3=34.2 ;

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

  //instruction permettant de revenir au debut de la video choisie un fois la fin atteinte
  /*
  if (mov.time()>=time2 && movSel==1) mov.jump(time1);
   else {
   if (mov.time()>=time3 && movSel==2) mov.jump(time2);
   else {
   if (mov.time()>=mov.duration() && movSel==nb_video) mov.jump(time3);
   }
   }*/
}

//permet de supprimer les bords de la fenetre processing
//boolean sketchFullScreen() {
//return true;
///}


//instruction permettant de choisir sa video
void keyPressed() {
  if (key == ' ') {
    int tmp = int( random( times.length ) );

    while (movSel == tmp) {
      tmp = int( random( times.length ) );
    }

    movSel = tmp;
    mov.jump( times[ movSel ] );
  }
  // si on appuie sur w on va au debut de la premiere video
  if (key == 'w') {
    mov.jump(time1);
    movSel=1;
  }
  //si on appuie sur x on va au debut de la premiere video 2
  if (key == 'x') {
    mov.jump(time2);
    movSel=2;
  }
  // si on appuie sur c on va au debut de la troisieme video 3
  if (key == 'c') {
    mov.jump(time3);
    movSel=3;
  }

}
