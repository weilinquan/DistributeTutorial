#include "MeshExt/MeshExtTransformOps.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/Dialect/Transform/IR/TransformDialect.h"
#include "mlir/IR/DialectRegistry.h"

class MeshExtTransformExtension
    : public mlir::transform::TransformDialectExtension<
          MeshExtTransformExtension> {
public:
  using Base::Base;
  void init();
};

void MeshExtTransformExtension::init() {
  registerTransformOps<
#define GET_OP_LIST
#include "MeshExt/MeshExtTransformOps.cpp.inc"
      >();
}

namespace mlir {
namespace meshExt {
void registerMeshExtTransformExtension(DialectRegistry &registry) {
  registry.addExtensions<MeshExtTransformExtension>();
}
} // namespace mesh
} // namespace mlir
