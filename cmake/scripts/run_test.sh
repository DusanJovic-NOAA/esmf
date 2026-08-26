#!/bin/bash
set -eux

TNAME=${1}
NP=${2}
PRE_RUN_SCRIPT=${3:-}
POST_RUN_SCRIPT=${4:-}

ESMF_MPIRUN=${ESMF_MPIRUN:-mpiexec}

if [[ -e "${PRE_RUN_SCRIPT}" ]]; then
  bash "${PRE_RUN_SCRIPT}"
fi

if [[ "${ESMF_MPIRUN}" == "mpiuni" ]]; then
    "./${TNAME}" 1> "${TNAME}".stdout 2>&1
else
    ${ESMF_MPIRUN} -np "${NP}" "./${TNAME}" 1> "${TNAME}".stdout 2>&1
fi

if [[ "${TNAME}" =~ ^ESMF_* ]]; then
    LOGNAME=${TNAME#'ESMF_'}
elif [[ "${TNAME}" =~ ^ESMCI_* ]]; then
    LOGNAME=${TNAME#'ESMCI_'}
elif [[ "${TNAME}" =~ ^ESMC_* ]]; then
    LOGNAME=${TNAME#'ESMC_'}
else
    LOGNAME=${TNAME}
fi

cat ./PET*"${LOGNAME}"*.Log > "${TNAME}".Log

rm -f ./PET*"${LOGNAME}"*.Log

if [[ -e "${POST_RUN_SCRIPT}" ]]; then
  bash "${POST_RUN_SCRIPT}"
fi
