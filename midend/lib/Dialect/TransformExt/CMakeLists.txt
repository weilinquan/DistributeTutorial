add_mlir_library(TransformExtOps
  TransformExtOps.cc

  DEPENDS
  TransformExtOpsIncGen
  
  )

add_mlir_library(TransformExtension
  TransformExt.cc

  DEPENDS
  TransformExtOpsIncGen
  )