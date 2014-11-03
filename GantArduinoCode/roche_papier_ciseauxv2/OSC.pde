void oscEvent(OscMessage theOscMessage) {
  
      if (theOscMessage.checkAddrPattern("overwriteSigne")==true) {
      
      overwriteSigne = theOscMessage.get(0).intValue();
   //   if (attente == 1) {
       if (overwriteSigne == 1) {
         overwriteShape = papier;
       } else if (overwriteSigne == 2){
         overwriteShape = roche;
       } else if (overwriteSigne == 3) {
         overwriteShape = ciseau;
       } else {
         overwriteShape = jaime;
       }
   /*    if (playerSigne == 1) {
         println("je devrais êtrepapier");
       } else if (playerSigne == 2) {
                  println("je devrais êtreroche");
       } else {
         println("je devrais être ciseau");
       } */  
     // }
    // if (attente == 2) {
     //  if (evilModeType == 3) {
      //  playerSigne = overwriteSigne;
    //   }
    //  }
    /*  1= papier
     2 = roche
     3= ciseau
     4 = tumbs up
     5 = fy*/
    println("overwriteSigne : " + overwriteSigne);
  }

  if (theOscMessage.checkAddrPattern("attente")==true) {
    attente = theOscMessage.get(0).intValue();
    attenteBoo = true;
    countdownBoo = false;

    if (attente == 1) {
      //  cpuSigne = int(floor(random(1, 6)));
      // playerSigne = int(floor(random(1, 6)));
    } else if ( attente == 2 && evilModeType == 3) {
      accDoublon = new PVector(0.2, -0.3);
    } else if ( attente == 3 && evilModeType == 3) {
      accDoublon = new PVector(0.7, 3);
    }
    //  println("attenteBoo : " + attenteBoo);
    //  println("attente : " + attente);
  }

  if (theOscMessage.checkAddrPattern("countdown")==true) {
    countdown = theOscMessage.get(0).intValue();
    countdownBoo = true;
    attenteBoo = false;
    if (countdown == 1) {
      // cpuSigne = 6;
      //  playerSigne = 6;
    }
    //  println("countdownBoo" + countdownBoo);
  //     println("countdown : " + countdown);
  }

  if (theOscMessage.checkAddrPattern("cpuSigne")==true) {
    /*  1= papier
     2 = roche
     3= ciseau
     4 = tumbs up
     5 = fy*/
     if (!attenteBoo) {
    cpuSigne = theOscMessage.get(0).intValue();
     }
    println("cpuSigne : " + cpuSigne);
  }

  if (theOscMessage.checkAddrPattern("playerSigne")==true) {
    if (!attenteBoo) {
      playerSigne = theOscMessage.get(0).intValue();
      println("playerSigne : " + playerSigne);
    }
  }

  if (theOscMessage.checkAddrPattern("resultat")==true) {
    
    /*
      0 = égalité
     1 = cpu wins
     2 = cpu loses
     
     */
    resultat = theOscMessage.get(0).intValue();
    println("resultat : " + resultat);
  }

  if (theOscMessage.checkAddrPattern("evilModeType")==true) {
    /*  1 = cheating
     2 = analyse
     3 = overWrite*/
    evilModeType = theOscMessage.get(0).intValue();
    if (evilModeType == 3) {
      posDoublon = new PVector(0, 0);
      vitDoublon = new PVector(0, 0);
      accDoublon = new PVector(0, 0);
    }
    println("evilModeType : " + evilModeType);
  }

  if (theOscMessage.checkAddrPattern("scoreCPU")==true) {
    /*
      0 = égalité
     1 = cpu wins
     2 = cpu loses
     
     */
    scoreCPU = theOscMessage.get(0).intValue();
  //  println("scoreCPU : " + scoreCPU);
  }

  if (theOscMessage.checkAddrPattern("scorePlayer")==true) {
    /*
      0 = égalité
     1 = cpu wins
     2 = cpu loses
     
     */
    scorePlayer = theOscMessage.get(0).intValue();
  //  println("scorePlayer : " + scorePlayer);
  }
  

}

