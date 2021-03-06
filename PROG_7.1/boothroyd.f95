program boothroyd
    
    use boothroydmod
    implicit none

    integer                              :: n, i
    integer, dimension(:,:), allocatable :: booth, dekk, mul

    do
        write(*,*) "Geben Sie die Dimension ein: "
        read(*,*) n
        if (n<=0) exit

        allocate(booth(n,n), dekk(n,n), mul(n,n))

        booth = generate_matrix(n)          ! normale Matrix
        dekk = generate_matrix(n, .TRUE.)   ! Inverse
        mul = matmul(booth, dekk)

        write(*,*) "Boothroyd-Matrix ="
        do i=1, n
            write(*,*) booth(i,:)
        end do
        write(*,*) "Boothroyd-Matrix * Inverse = "
        do i=1, n
            write(*,*) mul(i,:)
        end do
        
        deallocate(booth, dekk, mul)
    
    end do

end program boothroyd
