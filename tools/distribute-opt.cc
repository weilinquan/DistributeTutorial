#include "mlir/IR/MLIRContext.h"
#include "mlir/InitAllDialects.h"
#include "mlir/InitAllExtensions.h"
#include "mlir/InitAllPasses.h"
#include "mlir/Support/FileUtilities.h"
#include "mlir/Target/LLVMIR/Dialect/All.h"
#include "mlir/Tools/mlir-opt/MlirOptMain.h"

namespace mlir {
void registerTransformExtension(DialectRegistry &registry);
namespace test {
void registerTestMeshReshardingSpmdizationPass();
}
namespace meshExt {
void registerMeshExtTransformExtension(DialectRegistry &registry);
}

namespace distribute {} // namespace distribute
} // namespace mlir

int main(int argc, char **argv) {
  mlir::test::registerTestMeshReshardingSpmdizationPass();
  // Register all MLIR passes.
  mlir::registerAllPasses();
  mlir::DialectRegistry registry;
  // Register all MLIR core dialects.
  registerAllDialects(registry);
  mlir::registerAllExtensions(registry);
  mlir::registerTransformExtension(registry);
  mlir::meshExt::registerMeshExtTransformExtension(registry);
  // Register dialects in buddy-mlir project.
  // clang-format off
  // clang-format on

  return mlir::failed(
      mlir::MlirOptMain(argc, argv, "buddy-mlir optimizer driver", registry));
}