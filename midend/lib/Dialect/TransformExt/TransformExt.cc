#include "TransformExt/TransformExtOps.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/Dialect/Transform/IR/TransformDialect.h"
#include "mlir/IR/DialectRegistry.h"

class TransformExtension : public mlir::transform::TransformDialectExtension<TransformExtension> {
public:
    using Base::Base;
    void init();
};

void TransformExtension::init(){
    registerTransformOps<
    #define GET_OP_LIST
    #include "TransformExt/TransformExtOps.cpp.inc"
    >();
}

namespace mlir {
void registerTransformExtension(DialectRegistry& registry) { registry.addExtensions<TransformExtension>(); }
} // namespace mlir
