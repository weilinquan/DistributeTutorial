get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)
get_property(conversion_libs GLOBAL PROPERTY MLIR_CONVERSION_LIBS)
get_property(extension_libs GLOBAL PROPERTY MLIR_EXTENSION_LIBS)

add_executable(distribute-opt distribute-opt.cc)

target_link_libraries(distribute-opt
  PRIVATE
  MLIRMeshTest
  ${dialect_libs}
  ${conversion_libs}
  ${extension_libs}
  TransformExtension
  TransformExtOps
  MLIROptLib
  MLIRTransforms
  MLIRTransformUtils
  MLIRToLLVMIRTranslationRegistration
  )