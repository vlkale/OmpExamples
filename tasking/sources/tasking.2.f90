! @@name:	tasking.2
! @@type:	F-free
! @@operation:	compile
! @@expect:	success
! @@version:	omp_3.0
      RECURSIVE SUBROUTINE traverse ( P )
         TYPE Node
             TYPE(Node), POINTER :: left, right
         END TYPE Node
         TYPE(Node) :: P
         IF (associated(P%left)) THEN
             !$OMP TASK    ! P is firstprivate by default
                 CALL traverse(P%left)
             !$OMP END TASK
         ENDIF
         IF (associated(P%right)) THEN
             !$OMP TASK    ! P is firstprivate by default
                 CALL traverse(P%right)
             !$OMP END TASK
         ENDIF
         !$OMP TASKWAIT
         CALL process ( P )
      END SUBROUTINE
