set(SOURCEC mpi.c)
set(STOREH  mpi.h mpif.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC})
