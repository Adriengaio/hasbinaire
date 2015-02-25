import processing.video.*;
import gifAnimation.*;
//Initialisation d'un gif comme pour une video
Gif gif1;
Movie mov;
//variable definissant le n° de la video en train d'être jouée et le nb de video
int movSel;
//booleen pour savoir si on as completement finit de loader le gif
boolean gifloaded;
//booleen pour savoir si on as lancer le chargement d'un gif
boolean notloaded;
//booleen permettant de savoir si on as déjà augmenté ou inversé la vitesse de lecture
boolean speed;
//Tableau de booleen pour savoir quelles touche sont actuellement enfoncé et pas relachées 
boolean[] keys = new boolean [1];
//Initialisation du nom de la touche avec l'index dans le tableau correspondant 
final int S = 0;
//Tableau de gif pour la gestion aléatoire au click 3 gifs donc 3 case
Gif[] gifs = new Gif [3];
// variable definissant la taille en px de la video ----------???-------- On les utilisent pas celles là ??
//int largeur=1280 ;
//int hauteur=960;
//time 1&2&3 définnissent les intants ou l'on change de vidéos
float[] times = {
  0.0, 21.28, 34.2,
};
float time1=0, time2=21.28, time3=34.2;
 
void setup() {
  size(1280,960);
  background(0);
  fill(255, 0, 0);
  mov = new Movie(this, "hasbinaire.mov");
  mov.loop();
  gif1=null;
  //On charge les gifs dans le tableau de gif
  gifs[0] = new Gif(this, "alphar.gif");
  gifs[1] = new Gif(this, "alphaj.gif");
  gifs[2] = new Gif(this, "alphav.gif");
  notloaded = true;
}
void draw()
{
 //Quand le film est accessible
if(mov.available()){
  //On lit la frame actuelle
   mov.read();
   //Si la touche S est appuyer 
  if(keys[S]){
    //On affiche l'image du film en background
  image(mov, 0, 0, 1280, 960);
  //Si le gif est completement charger
   if(gifloaded){
     //On loop on l'affiche et on l'opacifie a 55.23%
    gif1.loop();
    image(gif1,0,0,1280,960);
    tint(255, 126);
    }
    else if(gif1==null&&notloaded){
      //Si le gif n'est pas charger et qu'on as pas commencer à le charger alors on suce des bites et on lance le chargement 
      gifloaded = loadGif();
    }
  }
  //Si y'as pas de gif à mettre et que le gif est toujours chargé 
  else{
   if(gif1!=null){
     //On libere un peu de mémoireen stoppant la boucle de gif et en vidant la variable et on réinitialise les booleen de controle
     gif1.stop();
     gif1 = null;
     gifloaded = false;
     notloaded = true;
   }
   //Et on affiche la vidéo
   image(mov, 0, 0, 1280,960);
  }
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
  if (key == 'W'||key == 'w') {
    //Au moment prescis ou on appuis sur la touche speed =true
   if(speed&&mov.available()){
     //On inverse la vitesse de lecture 
       mov.speed(-2);
       //et on passe le booléen de controle a false comme ça on change pas la vitesse a chaque frame uniquement quand on appuis
       speed = false;
     }
  }
  if (key == 'X'||key == 'x') {
    //on fait pareil 
    if(speed&&mov.available()){
       mov.speed(2);
       speed = false;
     }
  }
}
void keyReleased() {
  //quand on relache les touches on réintilise toutes les variables 
  if (key == 's'||key == 'S'){
    keys[S] = false;
  } 
   if (key == 'W'||key == 'w') {
    mov.speed(1);
    speed = true;
  }
  if (key == 'X'||key == 'x') {
    mov.speed(1);
    speed = true;
  }
}
//function qui renvois true quand elle as finis de taffer
boolean loadGif(){
  //Le boolen de controle si on et entrain de charger passe à false
    notloaded = false;
    //On choisis un gif au "hasard" (random est une érésie) 
    int nm = int(random(3));
    //on charge le gif
    gif1 = gifs[nm];
    return true;
}
//On as finis MAIS y'as pas mal de bug nottament quand tu fais avance rapide et tout de suite aprés avance en inversée 
//Des fois la vidéos frease avec l'activation du gif pardessus et ça "désentrelace la vidéo on as donc un joli petit glitch"
//Sans doutes la mémoire ou les libs qui sont pas bien comprises ou les steps qui sont pas respectés enfin je sais pas trop en vrai si t'as une idée ...

