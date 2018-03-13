MODULE type_repert 
	IMPLICIT NONE 
	INTEGER, PARAMETER :: long_nom = 50, long_prenom = 50, nb_f_max = 100
	
	TYPE FICHE
		CHARACTER(LEN=long_nom) :: nom
		CHARACTER(LEN=long_prenom) :: prenom
		INTEGER :: tel
	END TYPE FICHE
	
	TYPE REPERTOIRE 
		TYPE(FICHE), DIMENSION(nb_f_max) :: tab_f
		INTEGER :: nb_f_rem = 0
	END TYPE REPERTOIRE
	
	CONTAINS
	SUBROUTINE nb_f(rep)
		TYPE(REPERTOIRE), INTENT(IN) :: rep
		PRINT*, 'Il reste', nb_f_max - rep%nb_f_rem, 'fichiers disponibles'
	END SUBROUTINE nb_f
	
	SUBROUTINE saisie_f(rep)
		TYPE(REPERTOIRE), INTENT(INOUT) :: rep
		IF(rep%nb_f_rem < nb_f_max)THEN
			rep%nb_f_rem = rep%nb_f_rem + 1
			PRINT*, 'Entrez le nom'
			READ*, rep%tab_f(rep%nb_f_rem)%nom
			PRINT*, 'Entrez le prenom'
			READ*, rep%tab_f(rep%nb_f_rem)%prenom
			PRINT*, 'Entrez le numero de telephone'
			READ*, rep%tab_f(rep%nb_f_rem)%tel
		ELSE
			PRINT*, "Il n'existe plus de fiches libres dans le repertoire"
		END IF 
	END SUBROUTINE saisie_f
	
	SUBROUTINE modif_f(rep)
		TYPE(REPERTOIRE), INTENT(INOUT) :: rep
		INTEGER :: i
		PRINT*, "Entrez le numero de la fiche que vous souhaitez modifier"
		READ*, i
		IF(i <= rep%nb_f_rem)THEN
			PRINT*, 'Entrez le nouvel nom'
			READ*, rep%tab_f(i)%nom
			PRINT*, 'Entrez le nouvel prenom'
			READ*, rep%tab_f(i)%prenom
			PRINT*, 'Entrez le nouvel numero de telephone'
			READ*, rep%tab_f(i)%tel
		ELSE
			PRINT*, 'Fiche vide'
		END IF 
	END SUBROUTINE modif_f
	
	SUBROUTINE aff_rep(rep)
		TYPE(REPERTOIRE), INTENT(IN) :: rep
		INTEGER :: i
		IF(rep%nb_f_rem /= 0)THEN
			DO i=1, rep%nb_f_rem
				PRINT*, 'Affichage du fichier', i
				PRINT*, 'Le nom: ', rep%tab_f(i)%nom
				PRINT*, 'Le prenom: ', rep%tab_f(i)%prenom
				PRINT*, 'Le numero de telephone: ', rep%tab_f(i)%tel
			END DO
		ELSE
			PRINT*, 'Le repertoire est vide'
		END IF
	END SUBROUTINE aff_rep
	
	SUBROUTINE ech_f(rep)
		TYPE(REPERTOIRE), INTENT(INOUT) :: rep
		TYPE(FICHE) :: temp
		INTEGER :: i, j
		PRINT*, "Entrez les numeros des deux fichiers que vous voulez echanger"
		READ*, i, j
		IF(i > rep%nb_f_rem .OR. j > rep%nb_f_rem)THEN
			PRINT*, 'Fichier(s) vide(s)!'
		ELSE
			temp = rep%tab_f(i)
			rep%tab_f(i) = rep%tab_f(j)
			rep%tab_f(j) = temp
		END IF
	END SUBROUTINE ech_f
	
	SUBROUTINE supp_f(rep)
		TYPE(REPERTOIRE), INTENT(INOUT) :: rep
		INTEGER :: i, j
		PRINT*, 'Entrez le numero de la fiche a supprimer'
		READ*, i
		IF(i <= rep%nb_f_rem .AND. i > 0)THEN
			DO j = i, rep%nb_f_rem-1
				rep%tab_f(j) = rep%tab_f(j+1)
			END DO
		ELSE
			PRINT*, 'Numero non valide'
		END IF
	END SUBROUTINE supp_f
END MODULE type_repert

PROGRAM ges_repert
	USE type_repert 
	IMPLICIT NONE
	
	TYPE(REPERTOIRE) :: mon_rep
	INTEGER :: choix
	
	DO	
		!PRINT*, '\nMenu:'
		PRINT*, 
		PRINT*, 'Menu:'
		PRINT*, '0 - Quitter'
		PRINT*, '1 - Affichage du nombre de fiches disponibles'
		PRINT*, "2 - Saisie d'une fiche"
		PRINT*, "3 - Modification d'une fiche"
		PRINT*, "4 - Affichage du repertoire"
		PRINT*, '5 - Echange de deux fichier'
		PRINT*, "6 - Suppression d'une fiche"
		PRINT*, "Votre choix:"
		READ*, choix
		
		SELECT CASE(choix)
			CASE(0)
				PRINT*, 'Sortie du program'
				EXIT
			CASE(1)
				PRINT*, 'Affichage du nombre de fiches disponibles'
				CALL nb_f(mon_rep)
			CASE(2)
				PRINT*, "Saisie d'une fiche"
				CALL saisie_f(mon_rep)
			CASE(3)
				PRINT*, "Modification d'une fiche"
				CALL modif_f(mon_rep)
			CASE(4)
				PRINT*, 'Affichage du repertoire'
				CALL aff_rep(mon_rep)
			CASE(5)
				PRINT*, 'Echange de deux fiches'
				CALL ech_f(mon_rep)
			CASE(6)
				PRINT*, "Suppresion d'une fiche"
				CALL supp_f(mon_rep)
			CASE DEFAULT
				PRINT*, 'Choix invalide'
		END SELECT
	END DO
END PROGRAM ges_repert
