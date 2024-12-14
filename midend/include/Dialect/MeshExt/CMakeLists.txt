set(LLVM_TARGET_DEFINITIONS MeshExtTransformOps.td)
mlir_tablegen(MeshExtTransformOps.h.inc -gen-op-decls)
mlir_tablegen(MeshExtTransformOps.cpp.inc -gen-op-defs)
add_public_tablegen_target(MeshExtTransformOpsIncGen)
