#ifdef ESMC_RCS_HEADER
"$Id: ESMC_Conf.h,v 1.2 2004/02/18 01:53:58 eschwab Exp $"
"Defines the configuration for this machine"
#endif

#if 0
Earth System Modeling Framework
Copyright 2002-2003, University Corporation for Atmospheric Research,
Massachusetts Institute of Technology, Geophysical Fluid Dynamics
Laboratory, University of Michigan, National Centers for Environmental
Prediction, Los Alamos National Laboratory, Argonne National Laboratory,
NASA Goddard Space Flight Center.
Licensed under the GPL.
#endif

#if !defined(INCLUDED_CONF_H)
#define INCLUDED_CONF_H

#define PARCH_linux
#define ESMF_ARCH_NAME "linux"

#define ESMC_HAVE_LIMITS_H
#define ESMC_HAVE_PWD_H 
#define ESMC_HAVE_MALLOC_H 
#define ESMC_HAVE_STRING_H 
#define ESMC_HAVE_GETDOMAINNAME
#define ESMC_HAVE_DRAND48 
#define ESMC_HAVE_UNAME 
#define ESMC_HAVE_UNISTD_H 
#define ESMC_HAVE_SYS_TIME_H 
#define ESMC_HAVE_STDLIB_H

#define ESMC_HAVE_FORTRAN_UNDERSCORE 
#define ESMC_HAVE_FORTRAN_UNDERSCORE_UNDERSCORE
#define FTN(func) func##_


#define ESMC_POINTER_SIZE 4
#define ESMC_HAVE_OMP_THREADS 1

#define ESMC_HAVE_MPI 1

#define ESMC_HAVE_READLINK
#define ESMC_HAVE_MEMMOVE
#define ESMC_HAVE_TEMPLATED_COMPLEX

#define ESMC_HAVE_DOUBLE_ALIGN_MALLOC
#define ESMC_HAVE_MEMALIGN
#define ESMC_HAVE_SYS_RESOURCE_H
#define ESMC_SIZEOF_VOIDP 4
#define ESMC_SIZEOF_INT 4
#define ESMC_SIZEOF_DOUBLE 8

#if defined(fixedsobug)
#define ESMC_USE_DYNAMIC_LIBRARIES 1
#define ESMC_HAVE_RTLD_GLOBAL 1
#endif

#define ESMC_HAVE_SYS_UTSNAME_H

#define ESMF_NO_INITIALIZERS 1

#if S32
#define ESMF_IS_32BIT_MACHINE 1
#define ESMF_F90_PTR_BASE_SIZE 44 
#define ESMF_F90_PTR_PLUS_RANK 12
#endif
#if S64
#define ESMF_IS_64BIT_MACHINE 1
#define ESMF_F90_PTR_BASE_SIZE 88 
#define ESMF_F90_PTR_PLUS_RANK 24
#endif

#endif
