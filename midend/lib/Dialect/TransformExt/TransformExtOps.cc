#include "TransformExt/TransformExtOps.h"
#include "mlir/Dialect/Transform/Interfaces/TransformInterfaces.h"
#include "mlir/IR/Value.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/Support/Casting.h"

#define GET_OP_CLASSES
#include "TransformExt/TransformExtOps.cpp.inc"

mlir::DiagnosedSilenceableFailure
mlir::transform::SelectByOperationAttribute::apply(
    mlir::transform::TransformRewriter &rewriter,
    mlir::transform::TransformResults &transformResults,
    mlir::transform::TransformState &state) {
  auto payloadOp = state.getPayloadOps(getOperandHandle());
  auto attrName = getAttributeName();
  auto attrVal = getAttributeValue();
  llvm::SmallVector<Operation*> results;
  for(auto op: payloadOp){
    op->walk([&](Operation* curOp){
        if(curOp->hasAttr(attrName)&&curOp->getAttr(attrName)==attrVal){
            results.emplace_back(curOp);
        }
    });
  }
  transformResults.set(llvm::cast<OpResult>(getResult()), results);
  return DiagnosedSilenceableFailure::success();
}
