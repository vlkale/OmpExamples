! @@name:	reduction.6
! @@type:	F-fixed
! @@compilable:	yes
! @@linkable:	yes
! @@expect:	rt-error
! @@version:    omp_5.1
      INTEGER A, I

!$OMP PARALLEL SHARED(A) PRIVATE(I)

!$OMP MASKED
      A = 0
!$OMP END MASKED

      ! To avoid race conditions, add a barrier here.

!$OMP DO REDUCTION(+:A)
      DO I= 0, 9
         A = A + I
      END DO

!$OMP SINGLE
      PRINT *, "Sum is ", A
!$OMP END SINGLE

!$OMP END PARALLEL

      END
