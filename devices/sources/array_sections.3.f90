! @@name:	array_sections.3
! @@type:	F-free
! @@compilable:	yes
! @@linkable:	no
! @@expect:	success
! @@version:	omp_4.0
subroutine foo()
integer,target  :: A(30)
integer,pointer :: p(:)
   !$omp target data map( A(1:4) )
     p=>A
     !$omp target map( p(8:27) )
        A(3) = 0
        p(9) = 0
     !$omp end target
   !$omp end target data
end subroutine
