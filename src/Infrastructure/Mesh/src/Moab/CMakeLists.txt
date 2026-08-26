set(SOURCEC
  AdaptiveKDTree.cpp AEntityFactory.cpp AffineXform.cpp AxisBox.cpp
  BitPage.cpp BitTag.cpp BoundBox.cpp BSPTree.cpp BSPTreePoly.cpp BVHTree.cpp
  CartVect.cpp CN.cpp Core.cpp
  DebugOutput.cpp DenseTag.cpp DualTool.cpp
  EntitySequence.cpp ErrorHandler.cpp ErrorOutput.cpp
  Factory.cpp FBEngine.cpp FileOptions.cpp
  GeomQueryTool.cpp GeomTopoTool.cpp GeomUtil.cpp
  HalfFacetRep.cpp HigherOrderFactory.cpp HomXform.cpp
  iMOAB.cpp
  LloydSmoother.cpp
  MergeMesh.cpp MeshGeneration.cpp MeshSet.cpp MeshSetSequence.cpp MeshTag.cpp
  MeshTopoUtil.cpp
  NestedRefine.cpp
  OrientedBox.cpp OrientedBoxTreeTool.cpp
  PolyElementSeq.cpp ProgOptions.cpp
  Range.cpp RangeSeqIntersectIter.cpp ReaderWriterSet.cpp
  ReadUtil.cpp ReorderTool.cpp
  ScdElementData.cpp ScdInterface.cpp ScdVertexData.cpp SequenceData.cpp
  SequenceManager.cpp SetIterator.cpp Skinner.cpp SmoothCurve.cpp
  SmoothFace.cpp SparseTag.cpp SpatialLocator.cpp
  SpectralMeshTool.cpp StructuredElementSeq.cpp
  SweptElementData.cpp SweptElementSeq.cpp SweptVertexData.cpp SysUtil.cpp
  TagInfo.cpp Tree.cpp TupleList.cpp Types.cpp TypeSequenceManager.cpp
  UnstructuredElemSeq.cpp Util.cpp
  VarLenDenseTag.cpp VarLenSparseTag.cpp VertexSequence.cpp
  WriteUtil.cpp)

set(SOURCEF )
set(STOREH  )

set_source_files_properties(${SOURCEC} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES
                            COMPILE_DEFINITIONS "IS_BUILDING_MB;HAVE_VSNPRINTF;LINUX;USE_MPI")

set_source_files_properties(${SOURCEC} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES
                            INCLUDE_DIRECTORIES
                           "${CMAKE_CURRENT_SOURCE_DIR}/.;${CMAKE_CURRENT_SOURCE_DIR}/DiscreteGeometry;${CMAKE_CURRENT_SOURCE_DIR}/IntxMesh;${CMAKE_CURRENT_SOURCE_DIR}/io;${CMAKE_CURRENT_SOURCE_DIR}/io/mhdf/include;${CMAKE_CURRENT_SOURCE_DIR}/LocalDiscretization;${CMAKE_CURRENT_SOURCE_DIR}/parallel;${CMAKE_CURRENT_SOURCE_DIR}/verdict")

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})

add_subdirectory(DiscreteGeometry)
add_subdirectory(IntxMesh)
add_subdirectory(io)
add_subdirectory(LocalDiscretization)
add_subdirectory(parallel)
add_subdirectory(verdict)
