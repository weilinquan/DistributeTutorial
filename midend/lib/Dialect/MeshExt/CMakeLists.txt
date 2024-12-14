add_mlir_library(MeshExtTransformOps
MeshExtTransformOps.cc

  DEPENDS
  MeshExtTransformOpsIncGen
  
  )

add_mlir_library(MeshExtTransform
  MeshExtTransform.cc

  DEPENDS
  MeshExtTransformOpsIncGen
  )