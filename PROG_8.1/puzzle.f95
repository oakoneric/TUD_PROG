PROGRAM PUZZLEPROG

    USE PUZZLEMOD
    IMPLICIT NONE

    CHARACTER(LEN=50) :: filename
    
    WRITE(*,*) "Geben Sie die Eingabedatei ein: "
    READ(*,*) filename
    
    CALL LIES_PUZZLE (TRIM(filename))
    !WRITE(*,*) "erfolgreich gelesen"
    CALL LOESE_PUZZLE
    !WRITE(*,*) "erfolgreich gelöst"
    CALL SCHREIBE_LOESCHE_PUZZLE

    ! Testing FUNCTION CYCLE_ADD
    ! CALL TEST_CYCLE_ADD

    ! Testing FUNCTION DREH
    ! CALL TEST_DREH

    ! Testing FUNCTION PASSENDES_TEIL
    ! CALL TEST_PASSENDES_TEIL

END PROGRAM PUZZLEPROG
