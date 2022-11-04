! @@name:	fort_sa_private.2
! @@type:	F-fixed
! @@operation:	run
! @@expect:	unspecified
! @@version:	pre_omp_3.0
      PROGRAM PRIV_RESTRICT2
        COMMON /BLOCK2/ X
        X = 1.0

!$OMP   PARALLEL PRIVATE (X)
          X = 2.0
          CALL SUB()
!$OMP   END PARALLEL

       CONTAINS

          SUBROUTINE SUB()
          COMMON /BLOCK2/ Y

          PRINT *,X               ! X is undefined
          PRINT *,Y               ! Y is undefined
          END SUBROUTINE SUB

       END PROGRAM PRIV_RESTRICT2
