local code = 'fr_FR' -- Add/replace the xx_XX here with your language code (like de_DE, en_US, or other)! 

-- GENERAL 
Language:add(code, "Bot Weapon", "Arme robot")
Language:add(code, "Select the weapon the bots use", "Sélectionnez l arme utilisée par les bots")
Language:add(code, "Bot Kit", "Kit robot")
Language:add(code, "The Kit of the Bots", "Le kit des bots")
Language:add(code, "Bot Color", "Couleur du robot")
Language:add(code, "The Color of the Bots", "La couleur des robots")
Language:add(code, "Zombie Mode", "Mode zombie")
Language:add(code, "Zombie Bot Mode", "Mode robot zombie")

-- DIFFICULTY 
Language:add(code, "Bot Aim Worsening", "Aggravation de la visée du bot")
Language:add(code, "Make bots aim worse: for difficulty: 0 = no offset (hard), 1 or even greater = more sway (easy)", "Faites en sorte que les bots visent moins bien : pour la difficulté : 0 = pas de décalage (difficile), 1 ou même plus = plus de balancement (facile)")
Language:add(code, "Bot Aim Worsening of Snipers", "Bot Aim Aggravation des tireurs d élite")
Language:add(code, "See botAimWorsening, only for Sniper-rifles", "Voir botAimWorsening, uniquement pour les fusils de précision")
Language:add(code, "Bot Aim Worsening of Support", "Bot Aim Aggravation du support")
Language:add(code, "See botAimWorsening, only for LMGs", "Voir botAimWorsening, uniquement pour les LMG")
Language:add(code, "Bot Worsening Skill", "Compétence d aggravation du bot")
Language:add(code, "Variation of the skill of a single bot. The higher, the worse the bots can get compared to the original settings", "Variation de la compétence d un seul bot. plus ils sont élevés, plus les bots peuvent s aggraver par rapport aux paramètres d origine")
Language:add(code, "Bot Sniper Worsening Skill", "Bot Sniper Aggravation de la compétence")
Language:add(code, "See BotWorseningSkill - only for BOTs using sniper bolt-action rifles", "Voir BotWorseningSkill - uniquement pour les BOT utilisant des fusils à verrou de sniper")
Language:add(code, "Damage Factor Assault", "Assaut de facteur de dégâts")
Language:add(code, "Original Damage from bots gets multiplied by this", "Les dégâts d origine des bots sont multipliés par cela")
Language:add(code, "Damage Factor Carabine", "Carabine à facteur de dégâts")
Language:add(code, "Original Damage from bots gets multiplied by this", "Les dégâts d origine des bots sont multipliés par cela")
Language:add(code, "Damage Factor LMG", "Facteur de dégâts LMG")
Language:add(code, "Original Damage from bots gets multiplied by this", "Les dégâts d origine des bots sont multipliés par cela")
Language:add(code, "Damage Factor PDW", "Facteur de dégâts PDW")
Language:add(code, "Original Damage from bots gets multiplied by this", "Les dégâts d origine des bots sont multipliés par cela")
Language:add(code, "Damage Factor Sniper", "Sniper Facteur de Dégâts")
Language:add(code, "Original Damage from bots gets multiplied by this", "Les dégâts d origine des bots sont multipliés par cela")
Language:add(code, "Damage Factor Shotgun", "Fusil de chasse à facteur de dégâts")
Language:add(code, "Original Damage from bots gets multiplied by this", "Les dégâts d origine des bots sont multipliés par cela")
Language:add(code, "Damage Factor Pistol", "Pistolet à facteur de dégâts")
Language:add(code, "Original Damage from bots gets multiplied by this", "Les dégâts d origine des bots sont multipliés par cela")
Language:add(code, "Damage Factor Knife", "Couteau facteur de dégâts")
Language:add(code, "Original Damage from bots gets multiplied by this", "Les dégâts d origine des bots sont multipliés par cela")

-- SPAWN 
Language:add(code, "Spawn Mode", "Mode d apparition")
Language:add(code, "Mode the bots spawn with", "Mode avec lequel les bots apparaissent")
Language:add(code, "Balance Players Ignoring Bots", "Équilibrer les joueurs ignorant les bots")
Language:add(code, "Counts players in each team to decide which team a player joins", "Compte les joueurs de chaque équipe pour décider quelle équipe un joueur rejoint")
Language:add(code, "Team Switch Mode", "Mode de changement d équipe")
Language:add(code, "Mode to switch the team", "Mode pour changer d équipe")
Language:add(code, "Spawn Bots in all teams", "Faire apparaître des bots dans toutes les équipes")
Language:add(code, "Bots spawn in both teams", "Les bots apparaissent dans les deux équipes")
Language:add(code, "Start Number of Bots", "Nombre de départ de bots")
Language:add(code, "Bots for spawnmode", "Bots pour spawnmode")
Language:add(code, "New Bots per Player", "Nouveaux robots par joueur")
Language:add(code, "Number to increase Bots by when new players join", "Nombre de bots à augmenter lorsque de nouveaux joueurs rejoignent")
Language:add(code, "Factor Player Team Count", "Nombre d équipes de joueurs factoriels")
Language:add(code, "Reduce player team in balanced_teams or fixed_number mode", "Réduire l équipe de joueurs en mode balancing_teams ou fixed_number")
Language:add(code, "Team of the Bots", "L équipe des robots")
Language:add(code, "Default bot team (0 = neutral / auto, 1 = US, 2 = RU) TeamId.Team2", "Équipe de bot par défaut (0 = neutre/auto, 1 = US, 2 = RU) TeamId.Team2")
Language:add(code, "New Loadout on Spawn", "Nouveau chargement à l apparition")
Language:add(code, "Bots get a new kit and color, if they respawn", "Les bots reçoivent un nouveau kit et une nouvelle couleur, s ils réapparaissent")
Language:add(code, "Max Assault Bots", "Robots d assaut maximum")
Language:add(code, "Maximum number of Bots with Assault Kit. -1 = no limit", "Nombre maximum de bots avec kit d assaut. -1 = pas de limite")
Language:add(code, "Max Engineer Bots", "Robots Max Ingénieur")
Language:add(code, "Maximum number of Bots with Engineer Kit. -1 = no limit", "Nombre maximum de bots avec kit d ingénieur. -1 = pas de limite")
Language:add(code, "Max Support Bots", "Robots d assistance maximum")
Language:add(code, "Maximum number of Bots with Support Kit. -1 = no limit", "Nombre maximum de Bots avec Support Kit. -1 = pas de limite")
Language:add(code, "Max Recon Bots", "Robots Max Recon")
Language:add(code, "Maximum number of Bots with Recon Kit. -1 = no limit", "Nombre maximum de Bots avec Recon Kit. -1 = pas de limite")
Language:add(code, "Additional Spawn Delay", "Délai d apparition supplémentaire")
Language:add(code, "Additional time a bot waits to respawn", "Temps supplémentaire qu un bot attend pour réapparaître")
Language:add(code, "Bot Health at spawn", "Santé du bot à l apparition")
Language:add(code, "Max health of bot (default 100.0)", "Santé maximale du bot (100,0 par défaut)")

-- SPAWN LIMITS 
Language:add(code, "Max Bots Per Team (default)", "Max Bots par équipe (par défaut)")
Language:add(code, "Max number of bots in one team, if no other mode fits", "Nombre maximum de bots dans une équipe, si aucun autre mode ne convient")
Language:add(code, "Max Bots Per Team (TDM)", "Max Bots par équipe (TDM)")
Language:add(code, "Max number of bots in one team for TDM", "Nombre maximum de bots dans une équipe pour TDM")
Language:add(code, "Max Bots Per Team (TDM-CQ)", "Max Bots par équipe (TDM-CQ)")
Language:add(code, "Max number of bots in one team for TDM-CQ", "Nombre maximum de bots dans une équipe pour TDM-CQ")
Language:add(code, "Max Bots Per Team (Squad-DM)", "Max Bots par équipe (Squad-DM)")
Language:add(code, "Max number of bots in one team for Squad-DM", "Nombre maximum de bots dans une équipe pour Squad-DM")
Language:add(code, "Max Bots Per Team (CQ-Large)", "Max Bots par équipe (CQ-Large)")
Language:add(code, "Max number of bots in one team for CQ-Large", "Nombre maximum de bots dans une équipe pour CQ-Large")
Language:add(code, "Max Bots Per Team (CQ-Small)", "Max Bots par équipe (CQ-Small)")
Language:add(code, "Max number of bots in one team for CQ-Small", "Nombre maximum de bots dans une équipe pour CQ-Small")
Language:add(code, "Max Bots Per Team (CQ-Assault-Large)", "Max Bots par équipe (CQ-Assault-Large)")
Language:add(code, "Max number of bots in one team for CQ-Assault-Large", "Nombre maximum de bots dans une équipe pour CQ-Assault-Large")
Language:add(code, "Max Bots Per Team (CQ-Assault-Small)", "Max Bots par équipe (CQ-Assault-Small)")
Language:add(code, "Max number of bots in one team for CQ-Assault-Small", "Nombre maximum de bots dans une équipe pour CQ-Assault-Small")
Language:add(code, "Max Bots Per Team (Rush)", "Max Bots par équipe (Rush)")
Language:add(code, "Max number of bots in one team for Rush", "Nombre maximum de bots dans une équipe pour Rush")
Language:add(code, "Max Bots Per Team (CTF)", "Max Bots par équipe (CTF)")
Language:add(code, "Max number of bots in one team for CTF", "Nombre maximum de bots dans une équipe pour CTF")
Language:add(code, "Max Bots Per Team (Domination)", "Max Bots par équipe (Domination)")
Language:add(code, "Max number of bots in one team for Domination", "Nombre maximum de bots dans une équipe pour Domination")
Language:add(code, "Max Bots Per Team (Gunmaster)", "Max Bots par équipe (Gunmaster)")
Language:add(code, "Max number of bots in one team for Gunmaster", "Nombre maximum de bots dans une équipe pour Gunmaster")
Language:add(code, "Max Bots Per Team (Scavenger)", "Max Bots par équipe (récupérateur)")
Language:add(code, "Max number of bots in one team for Scavenger", "Nombre maximum de bots dans une équipe pour Scavenger")

-- BEHAVIOUR 
Language:add(code, "FOV of Bots", "Champ de vision des robots")
Language:add(code, "Degrees of FOV of Bot", "Degrés de FOV du Bot")
Language:add(code, "FOV of Bots Verticle", "Champ de vision des robots Verticle")
Language:add(code, "Degrees of FOV of Bot in vertical direction", "Degrés de FOV du Bot dans la direction verticale")
Language:add(code, "Max Shoot-Distance No Sniper", "Distance de tir maximale sans tireur d élite")
Language:add(code, "Meters before bots (not sniper) will start shooting at players", "Mètres avant que les robots (pas les tireurs d élite) ne commencent à tirer sur les joueurs")
Language:add(code, "Max Shoot Distance Sniper", "Tireur d élite à distance de tir maximale")
Language:add(code, "Meters before bots will start shooting at players", "Mètres avant que les bots ne commencent à tirer sur les joueurs")
Language:add(code, "Max Distance a normal soldier shoots back if Hit", "Distance maximale à laquelle un soldat normal riposte s il est touché")
Language:add(code, "Meters until bots (not sniper) shoot back if hit", "Mètres jusqu à ce que les robots (pas les tireurs d élite) ripostent s ils sont touchés")
Language:add(code, "Max Distance a sniper soldier shoots back if Hit", "Distance maximale qu un soldat tireur d élite riposte s il est touché")
Language:add(code, "Meters until snipers shoot back if hit", "Mètres jusqu à ce que les tireurs d élite ripostent s ils sont touchés")
Language:add(code, "Max Shoot-Distance Pistol", "Pistolet à distance de tir maximale")
Language:add(code, "The distance before a bot switches to pistol if his magazine is empty (Only in auto-weapon-mode)", "La distance avant qu un bot ne passe au pistolet si son chargeur est vide (uniquement en mode arme automatique)")
Language:add(code, "Bot Attack Mode", "Mode d attaque de bot")
Language:add(code, "Mode the Bots attack with. Random, Crouch or Stand", "Mode avec lequel les Bots attaquent. Aléatoire, accroupi ou debout")
Language:add(code, "Shoot Back if Hit", "Tirer en arrière si touché")
Language:add(code, "Bot shoots back if hit", "Le robot riposte s il est touché")
Language:add(code, "Bots Attack Bots", "Les bots attaquent les bots")
Language:add(code, "Bots attack bots from other team", "Les bots attaquent les bots d une autre équipe")
Language:add(code, "Melee Attack If Close", "Attaque de mêlée si proche")
Language:add(code, "Bot attacks with melee if close", "Le bot attaque au corps à corps si proche")
Language:add(code, "Bots can kill themselves", "Les robots peuvent se tuer")
Language:add(code, "Bot takes fall damage or explosion-damage from own frags", "Le bot subit des dégâts de chute ou d explosion de ses propres frags")
Language:add(code, "Bots teleport them when stuck", "Les robots les téléportent lorsqu ils sont bloqués")
Language:add(code, "Bot teleport to their target if they are stuck", "Le bot se téléporte vers sa cible s il est bloqué")
Language:add(code, "Bots revive players", "Les bots font revivre les joueurs")
Language:add(code, "Bots revive other players", "Les bots font revivre d autres joueurs")
Language:add(code, "Bots throw grenades", "Les bots lancent des grenades")
Language:add(code, "Bots deploy bags", "Les bots déploient des sacs")
Language:add(code, "Bots deploy ammo and medkits", "Les bots déploient des munitions et des kits médicaux")
Language:add(code, "Deploy Cycle", "Cycle de déploiement")
Language:add(code, "Time between deployment of bots in seconds", "Délai entre le déploiement des bots en secondes")
Language:add(code, "Move Sidewards", "Se déplacer latéralement")
Language:add(code, "Bots move sidewards", "Les robots se déplacent latéralement")
Language:add(code, "Max straight Cycle", "Cycle droit maximum")
Language:add(code, "Max time bots move straight, before sidewards-movement (in sec)", "Durée maximale pendant laquelle les bots se déplacent en ligne droite, avant le mouvement latéral (en secondes)")
Language:add(code, "Max Side Cycle", "Cycle latéral maximum")
Language:add(code, "Max time bots move sidewards, before straight-movement (in sec)", "Temps maximum pendant lequel les bots se déplacent latéralement, avant le mouvement droit (en secondes)")
Language:add(code, "Min Move Cycle", "Cycle de déplacement minimum")
Language:add(code, "Min time bots move sidewards or straight before switching (in sec)", "Temps minimum pendant lequel les bots se déplacent latéralement ou droit avant de changer (en secondes)")

-- VEHICLE 
Language:add(code, "Use vehicles", "Utiliser des véhicules")
Language:add(code, "Bots can use vehicles", "Les bots peuvent utiliser des véhicules")
Language:add(code, "Use air vehicles", "Utiliser des véhicules aériens")
Language:add(code, "Bots can use air-vehicles", "Les robots peuvent utiliser des véhicules aériens")
Language:add(code, "FOV of Vehicles", "Champ de vision des véhicules")
Language:add(code, "FOV of Vehicles Verticle", "FOV des véhicules Verticle")
Language:add(code, "Degrees of FOV of Non AA - Vehicles", "Degrés de FOV des véhicules non AA")
Language:add(code, "FOV of Chopper Verticle", "FOV de Chopper Verticle")
Language:add(code, "Degrees of pitch a chopper attacks", "Degrés de hauteur d attaque d un hélicoptère")
Language:add(code, "FOV of AA-Vehicles", "Champ de vision des véhicules AA")
Language:add(code, "Degrees of FOV of AA - Vehicles", "Degrés de FOV de AA - Véhicules")
Language:add(code, "FOV of AA-Vehicles Verticle", "FOV des véhicules AA Verticle")
Language:add(code, "Degrees of FOV of AA - Vehicles", "Degrés de FOV de AA - Véhicules")
Language:add(code, "Max Raycast Distance for Vehicles", "Max Raycast Distance pour les véhicules")
Language:add(code, "Meters bots in Vehicles start shooting at players", "Les bots de compteurs dans les véhicules commencent à tirer sur les joueurs")
Language:add(code, "Max Shoot-Distance No Anti Air", "Distance de prise de vue maximale sans anti-air")
Language:add(code, "Meters bots in vehicle (no Anti-Air) starts shooting at players", "Les bots de compteurs dans le véhicule (pas d anti-aérien) commencent à tirer sur les joueurs")
Language:add(code, "Time a vehicle driver waits for passengers", "Temps d attente d un conducteur de véhicule pour les passagers")
Language:add(code, "Seconds to wait for other passengers", "Quelques secondes pour attendre les autres passagers")
Language:add(code, "Choppers Attack", "Attaque des hacheurs")
Language:add(code, "If false, choppers only attack without gunner on board", "Si les faux hélicoptères n attaquent que sans mitrailleur à bord")
Language:add(code, "Activate Auto-AA", "Activer Auto-AA")
Language:add(code, "Enable Auto-AA by NyScorpy", "Activer Auto-AA par NyScorpy")
Language:add(code, "Max Distance Auto-AA", "Max Distance Auto-AA")
Language:add(code, "Max Range of Stationary AA", "Portée maximale des AA stationnaires")

-- WEAPONS 
Language:add(code, "Random Weapon usage", "Utilisation aléatoire des armes")
Language:add(code, "Use a random weapon out of the Weapon Set", "Utiliser une arme aléatoire hors de l ensemble d armes")
Language:add(code, "Weapon Set Assault", "Ensemble d armes Assaut")
Language:add(code, "Weaponset of Assault class. Custom uses the Shared/WeaponLists", "Ensemble d armes de la classe Assaut. Custom utilise les Shared/WeaponLists")
Language:add(code, "Weapon Set Engineer", "Ingénieur de jeu d armes")
Language:add(code, "Weaponset of Engineer class. Custom uses the Shared/WeaponLists", "Ensemble d armes de la classe Ingénieur. Custom utilise les Shared/WeaponLists")
Language:add(code, "Weapon Set Support", "Prise en charge des ensembles d armes")
Language:add(code, "Weaponset of Support class. Custom uses the Shared/WeaponLists", "Ensemble d armes de la classe Support. Custom utilise les Shared/WeaponLists")
Language:add(code, "Weapon Set Recon", "Reconnaissance d ensemble d armes")
Language:add(code, "Weaponset of Recon class. Custom uses the Shared/WeaponLists", "Ensemble d armes de la classe Recon. Custom utilise les Shared/WeaponLists")
Language:add(code, "Primary Weapon Assault", "Assaut à l arme principale")
Language:add(code, "Primary weapon of Assault class, if random-weapon == false", "Arme principale de la classe Assault, si random-weapon == false")
Language:add(code, "Primary Weapon Engineer", "Ingénieur d armes principal")
Language:add(code, "Primary weapon of Engineer class, if random-weapon == false", "Arme principale de la classe Ingénieur, si random-weapon == false")
Language:add(code, "Primary Weapon Support", "Support d arme principal")
Language:add(code, "Primary weapon of Support class, if random-weapon == false", "Arme principale de la classe Support, si random-weapon == false")
Language:add(code, "Primary Weapon Recon", "Reconnaissance d arme principale")
Language:add(code, "Primary weapon of Recon class, if random-weapon == false", "Arme principale de la classe Recon, si random-weapon == false")
Language:add(code, "Pistol of Bots", "Pistolet de Bots")
Language:add(code, "Pistol of Bots, if random-weapon == false", "Pistolet de Bots, si random-weapon == false")
Language:add(code, "Knife of Bots", "Couteau des robots")
Language:add(code, "Knife of Bots, if random-weapon == false", "Couteau de Bots, si arme-aléatoire == faux")

-- TRACE 
Language:add(code, "Debug Trace Paths", "Chemins de trace de débogage")
Language:add(code, "Waypoint Range", "Plage de points de cheminement")
Language:add(code, "Set how far away waypoints are visible (meters)", "Définir à quelle distance les waypoints sont visibles (mètres)")
Language:add(code, "Draw Waypoint Lines", "Dessiner des lignes de points de cheminement")
Language:add(code, "Draw waypoint connection lines", "Dessiner des lignes de connexion de waypoint")
Language:add(code, "Line Range", "Gamme de lignes")
Language:add(code, "Set how far away waypoint lines are visible (meters)", "Définir à quelle distance les lignes de waypoint sont visibles (mètres)")
Language:add(code, "Draw Waypoint IDs", "Dessiner des identifiants de points de cheminement")
Language:add(code, "Text Range", "Plage de texte")
Language:add(code, "Set how far away waypoint text is visible (meters)", "Définir à quelle distance le texte du waypoint est visible (mètres)")
Language:add(code, "Draw Spawn Points", "Dessiner des points d apparition")
Language:add(code, "Range of Spawn Points", "Gamme de points d apparition")
Language:add(code, "Set how far away spawn points are visible (meters)", "Définir à quelle distance les spawnpoints sont visibles (mètres)")
Language:add(code, "Shows the trace line and search area from Commo Rose selection", "Affiche la ligne de tracé et la zone de recherche de la sélection Commo Rose")
Language:add(code, "Trace Delta Points", "Tracer les points delta")
Language:add(code, "Update interval of trace", "Intervalle de mise à jour de la trace")
Language:add(code, "Nodes that are drawn per cycle", "Nœuds dessinés par cycle")
Language:add(code, "Set how many nodes get drawn per cycle. Affects performance", "Définissez le nombre de nœuds dessinés par cycle. Affecte les performances")

-- ADVANCED 
Language:add(code, "Distance for direct attack", "Distance d attaque directe")
Language:add(code, "Distance bots can hear you at", "Les robots à distance peuvent vous entendre à")
Language:add(code, "Bot melee attack cool-down", "Temps de recharge des attaques de mêlée du bot")
Language:add(code, "The time a bot waits before attacking with melee again", "Le temps qu un bot attend avant d attaquer à nouveau au corps à corps")
Language:add(code, "Bots without sniper aim for head", "Les robots sans tireur d élite visent la tête")
Language:add(code, "Bots without sniper aim for the head. A more experimental config", "Les robots sans tireur d élite visent la tête. Plus une configuration expérimentale")
Language:add(code, "Bots with Sniper aim for head", "Bots avec Sniper viser la tête")
Language:add(code, "Bots with sniper aim for the head. A more experimental config", "Les robots avec un tireur d élite visent la tête. Plus une configuration expérimentale")
Language:add(code, "Bots with Support LMGs aim for head", "Les robots avec support LMG visent la tête")
Language:add(code, "Bots with support LMGs aim for the head. A more experimental config", "Les bots avec support LMG visent la tête. Plus une configuration expérimentale")
Language:add(code, "Jump while shooting", "Sauter pendant le tir")
Language:add(code, "Bots jump over obstacles while shooting if needed", "Les robots sautent par-dessus les obstacles pendant le tir si nécessaire")
Language:add(code, "Jump while moving", "Sauter en se déplaçant")
Language:add(code, "Bots jump while moving. If false, only on obstacles!", "Les robots sautent en se déplaçant. Si faux, uniquement sur les obstacles !")
Language:add(code, "Overwrite speed mode", "Écraser le mode de vitesse")
Language:add(code, "0 = no overwrite. 1 = prone, 2 = crouch, 3 = walk, 4 = run", "0 = pas d écrasement. 1 = couché, 2 = accroupi, 3 = marcher, 4 = courir")
Language:add(code, "Overwrite attack speed mode", "Écraser le mode de vitesse d attaque")
Language:add(code, "Affects Aiming!!! 0 = no overwrite. 1 = prone, 2 = crouch (good aim), 3 = walk (good aim), 4 = run", "Affecte la visée !!! 0 = pas d écrasement. 1 = couché, 2 = accroupi (bien viser), 3 = marcher (bien viser), 4 = courir")
Language:add(code, "Speed factor", "Facteur de vitesse")
Language:add(code, "Reduces the movement speed. 1 = normal, 0 = standing", "Réduit la vitesse de déplacement. 1 = normal, 0 = debout")
Language:add(code, "Speed factor attack", "Attaque de facteur de vitesse")
Language:add(code, "Reduces the movement speed while attacking. 1 = normal, 0 = standing", "Réduit la vitesse de déplacement pendant l attaque. 1 = normal, 0 = debout")
Language:add(code, "Use Random Names", "Utiliser des noms aléatoires")
Language:add(code, "Changes names of the bots on every new round. Experimental right now...", "Change les noms des robots à chaque nouveau tour. Expérimental en ce moment..")

-- EXPERT 
Language:add(code, "Bot first shot delay", "Retard du premier tir du bot")
Language:add(code, "Delay for first shot. If too small, there will be great spread in first cycle because it is not compensated yet", "Délai pour le premier coup. S il est trop petit, il y aura une grande propagation au premier cycle car il n est pas encore compensé")
Language:add(code, "Bot min time shoot at player", "Bot min time shoot at player")
Language:add(code, "The minimum time a bot shoots at one player for - recommended minimum 1.5, below this you will have issues", "Le temps minimum pendant lequel un bot tire sur un joueur - minimum recommandé 1,5, en dessous de cela, vous aurez des problèmes")
Language:add(code, "Bot min time shoot at player in vehicle", "Bot min time shoot at player in vehicle")
Language:add(code, "The minimum time a bot shoots at one player if in vehicle - recommended minimum 2.5, below this you will have issues", "Le temps minimum qu un bot tire sur un joueur s il est dans un véhicule - minimum recommandé 2,5, en dessous de cela, vous aurez des problèmes")
Language:add(code, "Bot fire mode duration", "Durée du mode de tir du bot")
Language:add(code, "The minimum time a bot tries to shoot a player - recommended minimum 3.0, below this you will have issues", "Le temps minimum qu un bot essaie de tirer sur un joueur - minimum recommandé 3.0, en dessous de cela, vous aurez des problèmes")
Language:add(code, "Bot fire mode duration in vehicle", "Durée du mode de tir du robot dans le véhicule")
Language:add(code, "The minimum time a bot tries to shoot a player or vehicle, when in a vehicle - recommended minimum 7.0", "Le temps minimum qu un bot essaie de tirer sur un joueur ou un véhicule, lorsqu il est dans un véhicule - minimum recommandé 7.0")
Language:add(code, "Maximum yaw per sec", "Lacet maximal par seconde")
Language:add(code, "In Degrees. Rotation Movement per second", "en Degrés. Rotaion-Mouvement par seconde")
Language:add(code, "Target distance waypoint", "Point de cheminement à distance cible")
Language:add(code, "The distance the bots have to reach to continue with the next Waypoint", "Distance que les bots doivent atteindre pour continuer avec le prochain Waypoint")
Language:add(code, "Keep one slot for players", "Gardez un emplacement pour les joueurs")
Language:add(code, "Always keep one slot for free new Players to join", "Gardez toujours un créneau pour que de nouveaux joueurs puissent rejoindre gratuitement")
Language:add(code, "Distance to spawn", "Distance jusqu au frai")
Language:add(code, "Distance to spawn Bots away from players", "Distance pour faire apparaître des bots loin des joueurs")
Language:add(code, "Height distance to spawn", "Distance de hauteur pour frayer")
Language:add(code, "Distance vertically, Bots should spawn away, if closer than distance", "Distance verticalement, les bots devraient apparaître plus loin, s ils sont plus proches que la distance")
Language:add(code, "Distance to spawn reduction", "Réduction de la distance jusqu au frai")
Language:add(code, "Reduce distance if not possible", "Réduire la distance si ce n est pas possible")
Language:add(code, "Max tries to spawn at distance", "Max essaie de se reproduire à distance")
Language:add(code, "Try this often to spawn a bot away from players", "Essayez ceci souvent pour faire apparaître un bot loin des joueurs")
Language:add(code, "Attack way Bots", "Bots de manière d attaque")
Language:add(code, "Bots on paths attack player", "Les bots sur les chemins attaquent le joueur")
Language:add(code, "Respawn way Bots", "Respawn Way Bots")
Language:add(code, "Bots on paths respawn if killed", "Les robots sur les chemins réapparaissent s ils sont tués")
Language:add(code, "Spawn Method", "Spawn Method")
Language:add(code, "Method the bots spawn with. Careful, not supported on most of the maps!!", "Méthode avec laquelle les bots apparaissent. Attention, non pris en charge sur la plupart des maps !!")

-- OTHER 
Language:add(code, "Disable UI", "Désactiver l interface utilisateur")
Language:add(code, "If true, the complete UI will be disabled (not available in the UI)", "Si vrai, l UI complète sera désactivée (non disponible dans l UI)")
Language:add(code, "Allow Comm-UI for all", "Autoriser Comm-UI pour tous")
Language:add(code, "If true, all Players can access the Comm-Screen", "Si vrai, tous les joueurs peuvent accéder à l écran de communication")
Language:add(code, "Disable chat-commands", "Désactiver les commandes de chat")
Language:add(code, "If true, no chat commands can be used", "Si vrai, aucune commande de chat ne peut être utilisée")
Language:add(code, "Disable RCON-commands", "Désactiver les commandes RCON")
Language:add(code, "If true, no RCON commands can be used", "Si vrai, aucune commande RCON ne peut être utilisée")
Language:add(code, "Ignore Permissions", "Ignorer les autorisations")
Language:add(code, "If true, all permissions are ignored --> everyone can do everything", "Si vrai, toutes les autorisations sont ignorées --> tout le monde peut tout faire")
Language:add(code, "Language", "Langue")
Language:add(code, "de_DE as sample (default is English, when language file does not exist)", "de_DE comme exemple (la valeur par défaut est l anglais, lorsque le fichier de langue n existe pas)")

-- Strings of ./../../ext/Client/ClientNodeEditor.lua 

-- Strings of ./../../ext/Server/BotSpawner.lua 
Language:add(code, "CANT_JOIN_BOT_TEAM", "CANT_JOIN_BOT_TEAM")

-- Strings of ./../../ext/Server/UIServer.lua 
Language:add(code, "A", "UN")
Language:add(code, "B", "B")
Language:add(code, "C", "C")
Language:add(code, "D", "ré")
Language:add(code, "Attack", "Attaque")
Language:add(code, "E", "E")
Language:add(code, "F", "F")
Language:add(code, "G", "g")
Language:add(code, "H", "H")
Language:add(code, "Back", "Retour")
Language:add(code, "Defend", "Défendre")
Language:add(code, "Bot respawn activated!", "Réapparition du bot activée !")
Language:add(code, "Bot respawn deactivated!", "Réapparition du bot désactivée !")
Language:add(code, "Bots will attack!", "Les robots attaqueront !")
Language:add(code, "Bots will not attack!", "Les robots n attaqueront pas !")
Language:add(code, "%s is currently not implemented", "%s n est actuellement pas implémenté")
Language:add(code, "Exit Vehicle", "Sortir du véhicule")
Language:add(code, "Enter Vehicle", "Entrez le véhicule")
Language:add(code, "Drop Ammo", "Larguer des munitions")
Language:add(code, "Drop Medkit", "Laisser tomber le kit médical")
Language:add(code, "Commands", "Commandes")
Language:add(code, "Attack Objective", "Objectif d attaque")
Language:add(code, "Defend Objective", "Défendre l objectif")
Language:add(code, "Repair Vehicle", "Véhicule de réparation")
Language:add(code, "Settings has been saved temporarily", "Les paramètres ont été enregistrés temporairement")
Language:add(code, "Settings has been saved", "Les paramètres ont été enregistrés")

-- Strings of ./../../ext/Server/NodeCollection.lua 
Language:add(code, "Loaded %d paths with %d waypoints for map %s", "%d chemins chargés avec %d waypoints pour la carte %s")
Language:add(code, "Save in progress...", "Sauvegarde en cours...")
Language:add(code, "Failed to execute query: %s", "Échec de l exécution de la requête : %s")
Language:add(code, "Saved %d paths with %d waypoints for map %s", "%d chemins enregistrés avec %d waypoints pour la carte %s")
Language:add(code, "Bots throw grenades at enemies", "Les bots lancent des grenades sur les ennemis")
Language:add(code, "Degrees of vertical FOV of Non AA - Vehicles", "Degrés de champ de vision vertical des véhicules non AA")
Language:add(code, "Draw the IDs of the waypoints", "Dessinez les identifiants des waypoints")
Language:add(code, "Draw the Points where players can spawn", "Dessinez les points où les joueurs peuvent apparaître")
Language:add(code, "Snipers attack choppers", "Les tireurs d élite attaquent les hélicoptères")
Language:add(code, "Bots with sniper-rifels attack choppers", "Des bots avec des fusils de sniper attaquent des hélicoptères")
Language:add(code, "Max Bots per vehicle", "Max Bots par véhicule")
Language:add(code, "Maximum number of Bots in a vehicle", "Nombre maximum de Bots dans un véhicule")
Language:add(code, "Bots Attack Players", "Les bots attaquent les joueurs")
Language:add(code, "Bots attack Players from other team", "Les robots attaquent les joueurs d une autre équipe")
Language:add(code, "Add Mcom-Action", "Ajouter Mcom-Action")
Language:add(code, "Overwrite: Loop-Path", "Écraser : chemin de boucle")
Language:add(code, "Overwrite: Reverse-Path", "Écraser : chemin inverse")
Language:add(code, "Remove Data", "Supprimer les données")
Language:add(code, "Add Label / Objective", "Ajouter un libellé/objectif")
Language:add(code, "Remove Label / Objective", "Supprimer l'étiquette/l'objectif")
Language:add(code, "Vehicles", "Véhicules")
Language:add(code, "Remove all Labels / Objectives", "Supprimer tous les libellés/objectifs")
Language:add(code, "Paths", "Chemins")
Language:add(code, "Exit", "Sortir")
Language:add(code, "Land", "Terrain")
Language:add(code, "Water", "Eau")
Language:add(code, "Air", "Air")
Language:add(code, "Clear Path-Type", "Effacer le type de chemin")
Language:add(code, "Path-Type", "Type de chemin")
Language:add(code, "Exit Vehicle Passengers", "Passagers du véhicule de sortie")
Language:add(code, "Exit Vehicle All", "Quitter le véhicule tout")
Language:add(code, "Remove Vehicle Data", "Supprimer les données du véhicule")
Language:add(code, "Vehicle", "Véhicule")
Language:add(code, "Add Vehicle", "Ajouter un véhicule")
Language:add(code, "Set Vehicle Path-Type", "Définir le type de chemin du véhicule")
Language:add(code, "Remove Vehicle", "Supprimer le véhicule")
Language:add(code, "Add Tank", "Ajouter un réservoir")
Language:add(code, "Add Chopper", "Ajouter un hachoir")
Language:add(code, "Add Plane", "Ajouter un avion")
Language:add(code, "Add Other Vehicle", "Ajouter un autre véhicule")
Language:add(code, "Set Vehicle Spawn-Path", "Définir le chemin d'apparition du véhicule")
Language:add(code, "US", "NOUS")
Language:add(code, "Team", "Équipe")
Language:add(code, "RU", "RU")
Language:add(code, "Vehicle 1", "Véhicule 1")
Language:add(code, "Vehicle 2", "Véhicule 2")
Language:add(code, "Vehicle 3", "Véhicule 3")
Language:add(code, "Vehicle 4", "Véhicule 4")
Language:add(code, "Vehicle 5", "Véhicule 5")
Language:add(code, "Index", "Indice")
Language:add(code, "Vehicle 6", "Véhicule 6")
Language:add(code, "Vehicle 7", "Véhicule 7")
Language:add(code, "Vehicle 8", "Véhicule 8")
Language:add(code, "Vehicle 9", "Véhicule 9")
Language:add(code, "Vehicle 10", "Véhicule 10")
Language:add(code, "Add", "Ajouter")
Language:add(code, "Remove", "Retirer")
Language:add(code, "Base", "Base")
Language:add(code, "MCOM", "MCOM")
Language:add(code, "MCOM Interact", "Interaction MCOM")
Language:add(code, "Set Spawn-Path", "Définir le chemin d'apparition")
Language:add(code, "Base US", "États-Unis de base")
Language:add(code, "Base RU", "Base RU")
Language:add(code, "Capture Point", "Point de capture")
Language:add(code, "MCOM 1", "MCOM 1")
Language:add(code, "MCOM 2", "MCOM 2")
Language:add(code, "MCOM 3", "MCOM 3")
Language:add(code, "MCOM 4", "COMM 4")
Language:add(code, "MCOM 5", "COMM 5")
Language:add(code, "MCOM 6", "COMM 6")
Language:add(code, "MCOM 7", "COMM 7")
Language:add(code, "MCOM 8", "COMM 8")
Language:add(code, "MCOM 9", "COMM 9")
Language:add(code, "MCOM 10", "COMM 10")
Language:add(code, "MCOM INTERACT 1", "MCOM INTERAGIR 1")
Language:add(code, "MCOM INTERACT 2", "MCOM INTERAGIR 2")
Language:add(code, "MCOM INTERACT 3", "MCOM INTERAGIR 3")
Language:add(code, "MCOM INTERACT 4", "MCOM INTERAGIR 4")
Language:add(code, "MCOM INTERACT 5", "MCOM INTERAGIR 5")
Language:add(code, "MCOM INTERACT 6", "MCOM INTERAGIR 6")
Language:add(code, "MCOM INTERACT 7", "MCOM INTERAGIR 7")
Language:add(code, "MCOM INTERACT 8", "MCOM INTERAGIR 8")
Language:add(code, "MCOM INTERACT 9", "MCOM INTERAGIR 9")
Language:add(code, "MCOM INTERACT 10", "MCOM INTERAGIR 10")
Language:add(code, "base ru stage 1", "base ru étape 1")
Language:add(code, "base ru stage 2", "base ru étape 2")
Language:add(code, "base ru stage 3", "base ru étape 3")
Language:add(code, "base ru stage 4", "base ru étape 4")
Language:add(code, "base ru stage 5", "base ru étape 5")
Language:add(code, "base us stage 1", "nous baser étape 1")
Language:add(code, "base us stage 2", "nous baser étape 2")
Language:add(code, "base us stage 3", "nous baser étape 3")
Language:add(code, "base us stage 4", "nous baser étape 4")
Language:add(code, "base us stage 5", "nous baser étape 5")
Language:add(code, "Objective", "Objectif")
