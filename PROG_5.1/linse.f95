!linkstura/progmaterial


!====================================================================
!===================== PROGRAM ======================================
!====================================================================

PROGRAM linse

	USE IVALMOD!, ONLY : INTERVAL, pr, MID, INF, SUP, IVAL, GET, PUT,&
! &  OPERATOR(+), OPERATOR(-), OPERATOR(*), OPERATOR(/),&
! &  OPERATOR(==), OPERATOR(.ISECT.), OPERATOR(.IN.), OPERATOR (.SB.), &
! &  OPERATOR(.DJ.), IVAL_ZERO, IVAL_ONE
	USE ERRORS!, ONLY: ERROR, WARNING

	IMPLICIT NONE
	
	REAL (KIND=pr)	:: f0, b0, df, db, g0, dg
	TYPE (INTERVAL)	:: g1, g2, f, b
		
	!=====Input: Brennweite and Bildweite=====!
	WRITE(*,*) 'Geben Sie Werte für f_0, delta f, b_0 und delta b ein:'
	READ(*,*) f0, df, b0, db

	!=====erste Methode:=====!
    g0 = 1 / ((1 / f0) - (1 / b0))		!Mitte und Abweichung!
	dg = (df / (1 - (f0 / b0))**2) + (db / ((b0 / f0)-1)**2)

    g1 = IVAL(g0 - dg , g0 + dg)

	!CALL PUT(g1)
	
	!G2 = IVAL(g0 - dg , g0 + dg)
	
	!=====zweite Methode:=====!
    f = IVAL(f0 - df, f0 + df)
	b = IVAL(b0 - db, b0 + df)
	!s = IVAL (1_pr)
		
	G2 = IVAL_ONE / ((IVAL_ONE/f) - (IVAL_ONE/b))
	
    !=====Output=====!
	WRITE (*,*) 'Für die Brennweite F gilt: F = '
	CALL PUT(f)
	WRITE (*,*) 'Für die Bildweite B gilt: B = '
	CALL PUT(b)
	WRITE (*,*) 'Für die Gegenstandsweite G_1 gilt: G_1 = '
	CALL PUT(g1)
	WRITE (*,*) 'Für die Gegenstandweite G_2 gilt: G_2 = '
	CALL PUT(g2)
	
    !=====Teilmengenbeziehung=====!
	IF (G1 .DJ. G2) THEN
		WRITE(*,*) 'G1 und G2 sind disjunkt - die Schnittmenge ist leer.'
!	ELSEIF (G1 == G2) THEN          !für Teilmenge in beide Richtungen!
!		WRITE(*,*) 'G1 und G2 sind gleich. Schnittmenge: '
!		CALL PUT(G1)
!		!CALL WARNING('Achtung. Rundung kann Gleichheit verursachen.')
	ELSEIF (G1 .SB. G2) THEN
		WRITE(*,*) 'G1 ist Teilmenge von G2.'
	ELSEIF (G2 .SB. G1) THEN
		WRITE(*,*) 'G2 ist Teilmenge von G1.'
	ELSE
		WRITE (*,*) 'Keine Teilmengen. Schnittmenge von G1 und G2: '
		CALL PUT(G1 .ISECT. G2)
	END IF	

	READ(*,*)
			
END PROGRAM linse

!COMPILE: gfortran -Wall -o linse ivalmod.f95 linse.f95
!-Wall überprüft auf unnötige Variablen usw.
