set(SOURCEC esmftrc.c ESMCI_Trace.C ESMCI_TraceWrap.C ESMCI_TraceMetadata.C ESMCI_TraceClock.C)
set(SOURCEF	)
set(SOURCEH	esmftrc.h ESMCI_Trace.h ESMCI_TraceUtil.h ESMCI_HashMap.h ESMCI_HashNode.h
            ESMCI_KeyHash.h ESMCI_RegionNode.h ESMCI_ComponentInfo.h ESMCI_TraceRegion.h ESMCI_RegionSummary.h)
set(STOREH  ESMCI_TraceRegion.h ESMF_TraceRegion.inc ESMCI_TraceMacros.h)

copy_storeh()

set_source_files_properties(esmftrc.c ESMCI_Trace.C ESMCI_TraceWrap.C ESMCI_TraceMetadata.C ESMCI_TraceClock.C DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES INCLUDE_DIRECTORIES ${CMAKE_CURRENT_SOURCE_DIR}/../include)

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
