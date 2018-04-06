program exp

integer :: i,x
!! Choose REAL type with decimal precision >=p and decimal range >=r :
integer, parameter :: real_kind= selected_real_kind(p=15, r=307)
real (kind=real_kind) :: summe, sneu, salt, summealt, vw, diff, xe

write(*,*) 'Geben Sie das Argument x zur Berechnung von e^x ein: x='
read (*,*) x

!do x=-100,100,10

	salt = 1
	sneu = 0
	summe = salt
	i = 1
	summealt=0

	xe=x

	do while ((summe - summealt) /= 0)
		sneu = salt * (xe / i)
		summealt=summe
		summe = summe + sneu
		salt=sneu
		!write(*,*) 'schleife durchlaufen', summe
		i = i + 1
	end do

	write(*,*) 'x= ', xe
	write(*,*) 'TAYLOR. e^x = ', summe

	vw=dexp(xe)
	write(*,*) 'EXP. e^x= ', vw

	diff=summe-vw
	write(*,*) 'Differenz = ', diff

!end do

end program
