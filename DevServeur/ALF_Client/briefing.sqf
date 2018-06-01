waitUntil {sleep 0.5; !isNull player && player isEqualTo player};
if(player diarySubjectExists "credits") exitWith {};

player createDiarySubject ["credits","Credits"];
player createDiarySubject ["changelog","Mise à jour"];


	player createDiaryRecord ["credits",
		[
			"Arma Life France",
				"
					Arma Life France est un serveur rôleplay développé par ALF Team sur une base de jeu d'Altis Life RPG.<br/><br/>

					L'ensemble des fichiers scriptés par ALF Team sont sous licences.<br/><br/>

					Le vol ou la copie des fonctions créées pour la communauté Arma Life France est interdit.<br/><br/>

					ALF - Nanou<br/>
					Développeur mission.
				"
		]
	];

	player createDiaryRecord["changelog",
		[
			"Mission",
				"
					Alpha<br/>
					par Nanou<br/>
					le: **.**.2017<br/><br/>
					Ouverture et test du développement.
				"
		]
	];