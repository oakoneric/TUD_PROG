module boothroydmod
    implicit none
    
    private
    public operator (.ueber.), generate_matrix
    
    !=========== INTERFACES ===========
    interface operator (.ueber.)
        module procedure binocoeff
    end interface

    contains
    
    !=========== FUNCTIONS / SUBROUTINES ===========
    
    ! Binomialkoeffizient
    function binocoeff(n,k)
        integer, intent(in) :: n,k
        integer             :: i, c, binocoeff

        c = 1

        do i = 1, min(k,n-k), 1
            c = c * (n-i+1)/i
        end do

        binocoeff = c
    end function binocoeff

    !Boothroyd-Matrix generieren
    function generate_matrix(n, inv) result (boothroyd)
        integer, intent(in)                  :: n
        logical, optional                    :: inv
        integer, dimension(n,n)              :: boothroyd
        integer                              :: i,j

        if (present(inv)) then
                if (inv) then
                    !Inverse
                    do i=1, n, 1
                        do j=1, n, 1
                            boothroyd(i,j) = (-1)**(i+j) * ((n+i-1) .ueber. (i-1)) * ((n-1) .ueber. (n-j)) * n / (i+j-1)
                        end do
                    end do
                else 
                    !normale Matrix
                    do i=1, n, 1
                        do j=1, n, 1
                            boothroyd(i,j) = ((n+i-1) .ueber. (i-1)) * ((n-1) .ueber. (n-j)) * n / (i+j-1)
                        end do
                    end do
                end if
        else
            !normale Matrix
            do i=1, n, 1
                do j=1, n, 1
                    boothroyd(i,j) = ((n+i-1) .ueber. (i-1)) * ((n-1) .ueber. (n-j)) * n / (i+j-1)
                end do
            end do
        end if

    end function generate_matrix

end module boothroydmod
