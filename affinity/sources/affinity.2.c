/*
* @@name:	affinity.2
* @@type:	C
* @@compilable:	yes
* @@linkable:	no
* @@expect:	success
* @@version:	omp_4.0
*/
void work();
void foo()
{
  #pragma omp parallel num_threads(16) proc_bind(spread)
  {
    work();
  }
}
