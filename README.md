<b>Gant Arduino + Capteurs de Flexion + Roche/papier/ciseaux</b>
============

Gant arduino réalisé avec des senseurs de flexion pour capter les mouvements de la main.

Réalisé par Dominique Charbonneau et Kenny Lefebvre

============

Notre projet consiste en un gant Arduino contenant des senseurs de flexibilité et qui permet de jouer à roche-papier-ciseau avec un programme. Dans notre scénarisation, le programme est susceptible et ne veut pas perdre. Ainsi, lorsque son pointage est supérieur, l'ordinateur consent à ne pas tricher (alors qu'il le pourrait) et à jouer selon les règles. Par contre, lorsqu'il perd, il décide de lire le mouvement de l'utilisateur avant de choisir le sien pour ainsi être certain de gagner.

Voici notre processus de construction du gant, ainsi que les codes que nous avons utilisés pour notre scénarisation. Si vous les utilisez à votre tour, n'oubliez pas de nous citer!

============

<b>Matériel</b>

<img src="http://i.imgur.com/77cH7f3.jpg" title="Materiel" />

Électronique
- 1 Arduino Leonardo
- Câble micro-usb et rallonge USB
- 5 senseurs de flexibilité (flex sensors) de 4.5"
- 5 résistances 10k Ohm
- 7 Headers (pour insérer dans le Arduino pour faciliter le montage)
- Planche de prototypage (breadboard)

Autres
- Câbles
- Étain
- Fer à souder
- Fil et aiguille à coudre
- Paire de gants (relativement grands de préférence)
- Ruban adhésif électrique

============

<b> Faire le circuit </b>

Il est (toujours) conseillé de prototyper un circuit avant de le souder pour s'assurer que les pièces fonctionnent bien et qu'il n'y a aucune erreur. L'image ci-dessous montre le montage sur le breadboard d'un senseur de flexibilité avec sa résistance associée. Pour monter le gant en entier, il suffit de refaire le circuit avec les 4 autres senseurs.

<img src="http://i.imgur.com/k5bZAE6.jpg" title="Circuit" />
<img src="http://i.imgur.com/TPCOCM1.jpg" title="Circuit 2" />

Vous aurez peut-être besoin de souder des câbles aux senseurs de flexibilité afin de les insérer dans la planche de prototypage. Sinon, il faudra de toute façon en souder au moment de fixer les senseurs sur le gant. Assurez-vous cependant d'avoir une longueur suffisante pour que le câble se rende jusqu'à la base du gant une fois le senseur fixé.

N'oubliez pas de vérifier la sensibilité de chaque senseur!

============

<b> Fixer les senseurs au gant </b>

Si vous n'avez pas encore soudé des câbles aux senseurs, assurez-vous de le faire avant de les coudre sur le gant. Encore une fois, veillez à avoir une longueur suffisante pour que le câble se rende jusqu'à la base du gant une fois le senseur fixé.

<img src="http://i.imgur.com/MG8gzZb.jpg" title= "Trou" />

Nous avons percé un trou au commencement du senseur de flexibilité, en s'assurant de ne rien détruire là où il y a la résistance, afin de fixer le haut du senseur à chaque doigt. Puis, nous avons fait des points autour de chaque senseur afin de bien le tenir en place. Assurez-vous également de bien fixer les points de soudure, car vous ne voulez surtout pas qu'il y ait des plis à cet endroit!

<img src="http://i.imgur.com/LZz35SW.jpg" title= "Gant 1 senseur" />
<img src="http://i.imgur.com/1Wxesfr.jpg" title= "Gant 1 senseur, proche" />
<img src="http://i.imgur.com/5It8lZZ.jpg" title= "Gant 5 senseurs" />

<b> Fixer le Arduino au gant et finitions </b>

Une fois les senseurs fixés sur le gant, il faut souder le circuit en se fiant au schéma. Nous avons décidé de mettre le deuxième gant par-dessus le premier afin de cacher les senseurs. Nous avons donc fait remonter le fils par-dessus le gant et fixé le arduino (en cousant les petits trous de la plaque) sur le gant. Nous avons aussi utilisé des headers pour souder le bout des fils et fixer au Arduino.

Nous avons aussi cousu un point au bout de chaque doigt afin de maintenir les deux gants l'un dans l'autre.
<img src="http://i.imgur.com/m3jxX2u.jpg" title= "Coudre les 2 gants ensemble" />

<b> Codes </b>

Vous trouverez aussi dans le master tous les codes (Max/MSP, Processing, Arduino) permettant de jouer à notre version de roche/papier/ciseau. La discrimination des données se fait dans Max, le code Processing recevant des signaux par OSC de Max et ne s'occupant que de l'affichage.

<b>Et voilà!</b>

Vous avez maintenant un gant interactif qui permet d'interagir avec ce que vous voulez!

<img src="http://i.imgur.com/XiYgybz.jpg" title= "Gant final de haut" />
<img src="http://i.imgur.com/l868Nf7.jpg" title= "Gant final de côté" />

