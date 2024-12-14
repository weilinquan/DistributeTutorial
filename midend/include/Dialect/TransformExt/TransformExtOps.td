#ifndef TRANSFORMEXT_OPS_TD
#define TRANSFORMEXT_OPS_TD

include "mlir/Dialect/Transform/IR/TransformDialect.td"
include "mlir/Dialect/Transform/Interfaces/TransformInterfaces.td"
include "mlir/IR/OpBase.td"
include "mlir/IR/CommonAttrConstraints.td"
include "mlir/Interfaces/SideEffectInterfaces.td"

def SelectByOperationAttribute : Op<Transform_Dialect, "select.by_operation_attribute", 
    [DeclareOpInterfaceMethods<TransformOpInterface>,
     NavigationTransformOpTrait, MemoryEffectsOpInterface]> {
        let summary = "select a single operation of given attribute";
        let arguments = (ins TransformHandleTypeInterface:$operand_handle, 
                        StrAttr:$attribute_name,
                        AnyAttr:$attribute_value);
        let results = (outs TransformHandleTypeInterface:$result);
        let assemblyFormat = "$operand_handle attr-dict `:` functional-type(operands, results)";
        let cppNamespace = "::mlir::transform";
}

#endif
