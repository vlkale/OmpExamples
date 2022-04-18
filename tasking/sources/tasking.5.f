! @@name:	tasking.5
! @@type:	F-fixed
! @@compilable:	yes
! @@linkable:	no
! @@expect:	success
! @@version:	omp_3.0
       real*8 item(10000000)
       integer i

!$omp parallel
!$omp single ! loop iteration variable i is private
       do i=1,10000000
!$omp task
         ! i is firstprivate, item is shared
          call process(item(i))
!$omp end task
       end do
!$omp end single
!$omp end parallel

       end
