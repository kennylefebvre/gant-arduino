import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

ArrayList pix;
PShape papier, ciseau, roche, jaime, fy, interr, overwriteShape, joueur, robot, crown, reset;
int marge;

int attente, countdown, resultat, cpuSigne, playerSigne, evilModeType, overwriteSigne;

boolean attenteBoo, countdownBoo;

int timeStamp, intervalle;

color couleurGauche, couleurDroite, couleurGaucheFoncee, couleurDroiteFoncee;

PFont courrier;

PVector posDoublon, vitDoublon, accDoublon;

int scorePlayer, scoreCPU;



void setup() {
  size(1280, 720);
  noSmooth();
  frameRate(30);

  oscP5 = new OscP5(this, 12121);
  myRemoteLocation = new NetAddress("127.0.0.1", 12122);

  shapeMode(CORNER);
  rectMode(CORNER);

  papier = loadShape("papier.svg");
  ciseau = loadShape("ciseau.svg");
  roche = loadShape("roche.svg");
  jaime = loadShape("jaime.svg");
  fy = loadShape("fy.svg");
  interr = loadShape("interr.svg");
  joueur = loadShape("joueur.svg");
  robot = loadShape("robot.svg");
  crown = loadShape("crown.svg");
  reset = loadShape("reset.svg");
  courrier = loadFont("Courier-Bold-48.vlw");
  textFont(courrier, 48);
  overwriteShape = new PShape();

  marge = 150;
  pix = new ArrayList();

  // scoreCPU = 0;
  // scorePlayer = 0;

  cpuSigne = 5;
  playerSigne = 5;
  attenteBoo = true;
  countdownBoo = false;
  timeStamp =0;
  intervalle = 3000;
  resultat = 0;
  resultatFct(resultat);

  posDoublon = new PVector();
  vitDoublon = new PVector();
  accDoublon = new PVector();

  noStroke();
}

void draw() {
  background(255, 50, 70);

  /* if (!attenteBoo) {
   } else {
   cpuSigne = 6;
   playerSigne = 6;
   } */



  if (attenteBoo) {
    backgroundEffet();
    afficheImage(cpuSigne, false);

    /*  if (evilModeType == 3 && attente == 2) {
     afficheImage(overwriteSigne, true);
     } else { */
    /*  if (evilModeType == 3 && attente <= 2 ) {
     // afficheImage(overwriteSigne, true);
     } else { */
    //  println("else " + playerSigne);
    if (evilModeType != 3) {
      afficheImage(playerSigne, true);
    }
    // }
    // }
  } else {
    shape(reset, width/2-826*0.9/2, height-56*0.9, 826*0.9, 56*0.9);
    if (countdown == 2) {
      afficheImage(6, false);
    } else {

      afficheImage(6, true);
    }
  }

  if (evilModeType == 1) {
    tricherie();
  } else if (evilModeType == 3) {
    overwrite();
  }

  fill(255);
  text(str(scoreCPU), 0, height-50, 250, 250);
  text(str(scorePlayer), width-100, height-50, 250, 250);

  shape(robot, width/9, height-200);
  shape(joueur, 5*width/9, height-200);

  if (attenteBoo) {
    if (resultat == 1) {
      if (attente == 1 || attente == 3) {
        shape(crown, 3*width/9+50, 30, 117, 90);
      }
    } else if (resultat == 2) {
      if (attente == 1 || attente == 3) {
        shape(crown, 5*width/9, 30, 117, 90);
      }
    }
  }

  // fill(0);
  // text(str(millis()), 0, 500, 250, 250);
}

void keyPressed() {
  if (key == 'Q' || key == 'q') {

    if (!attenteBoo) {
      if (cpuSigne < 5) {
        cpuSigne++;
      } else {
        cpuSigne = 1;
      }
    }
  }

  if (key == 'W' || key == 'w') {
    if (!attenteBoo) {
      if (playerSigne < 5) {
        playerSigne++;
      } else {
        playerSigne = 1;
      }
    }
  }

  if (key == 'E' || key == 'e') {
    if (resultat < 2) {
      resultat++;
    } else {
      resultat = 0;
    }
  }

  if (key == 'R' || key == 'r') {
    if (evilModeType < 3) {
      evilModeType++;
    } else {
      evilModeType = 1;
    }
    //  println("clavierEMT : "+evilModeType);
  }
  
if (key == 32) {
  
  OscMessage myMessage = new OscMessage("espace");
  oscP5.send(myMessage, myRemoteLocation);
  println("lolz");
}
  
  
}

PShape afficheImage(int id, boolean droite) {
  PShape shape = new PShape();
  switch(id) {
  case 1 : 
    shape = papier;
    break;
  case 2 : 
    shape = roche;
    break;
  case 3 : 
    shape = ciseau;
    break;
  case 4 : 
    shape = jaime;
    break;
  case 5 : 
    shape = fy;
    break;
  case 6 : 
    shape = interr;
    break;
  }
  if (droite) {
    retourneImage(shape, new PVector(0, 0));
  } else {
    shape(shape, marge, 100, 300, 400);
  }
  return shape;
}

PShape retourneImage(PShape shape, PVector pos) {
  pushMatrix();
  scale(-1.0, 1.0);
  shape(shape, -width/2 - (marge-400) + pos.x + -shape.width, 100+ pos.y, 300, 400);
  popMatrix();
  return shape;
}

void backgroundEffet() {
  resultatFct(resultat);

  fill(couleurGauche);
  rect(0, 0, width/2, height);
  fill(couleurDroite);
  rect(width/2, 0, width/2, height);

  fill(couleurGaucheFoncee); //couleur gauche
  rect(0, 0, width/2, 20);
  rect(0, 0, 20, height);
  rect(0, height-20, width/2, 20);

  fill(couleurDroiteFoncee); //couleur droite
  rect(width/2, 0, width/2, 20);
  rect(width-20, 0, 20, height);
  rect(width/2, height-20, width/2, 20); 

  fill(0);
  rect(width/2-10, 0, 20, height);
}

void resultatFct(int resultat ) {
  if (resultat == 0) {
    couleurGauche = color(127);
    couleurDroite = color(127);
    couleurGaucheFoncee = color(0);
    couleurDroiteFoncee= color(0);
  } else if (resultat == 1) {
    couleurGauche = color(0, 255, 0);
    couleurGaucheFoncee = color(0, 200, 0);
    couleurDroite = color(255, 0, 0);
    couleurDroiteFoncee = color(200, 0, 0);
  } else {
    couleurGauche = color(255, 0, 0);
    couleurGaucheFoncee = color(200, 0, 0);
    couleurDroite = color(0, 255, 0);
    couleurDroiteFoncee = color(0, 200, 0);
  }
}

void tricherie () {
  if (attenteBoo && attente == 1) {
    fill(0, 200);
    rect(0, 0, width/2, height);
    fill(255);
    text("Tricherie!", marge, height/2, 500, 500);
  }
}

void overwrite () {
  if (attenteBoo) {

    vitDoublon.add(accDoublon);
    posDoublon.add(vitDoublon);
    /*quand overWrite est envoyé, enregistrer ancienSigne avant de regarder le nouveau */
    fill (0);
    pushMatrix();
    //translate(posDoublon.x-ciseau.width, posDoublon.y-ciseau.height);

    /*   if (overwriteShape == 1) {
     retourneImage(papier, posDoublon);
     } else if (overwriteShape == 3) {
     retourneImage(ciseau, posDoublon);
     } else if (overwriteShape == 2) {
     retourneImage(roche, posDoublon);
     } else {
     ellipse(0, 0, 50, 50);
     } */

    if (playerSigne == 1) {
      retourneImage(papier, posDoublon);
    } else if (playerSigne == 2) {
      retourneImage(roche, posDoublon);
    } else if (playerSigne == 3) {
      retourneImage(ciseau, posDoublon);
    } else {
      retourneImage(jaime, posDoublon);
    }

    popMatrix();
    if (attente >= 2) {
      retourneImage(overwriteShape, new PVector(0, 0));
      text("Ha ha!", width-200, 150, 500, 500);
    }
  }
}

