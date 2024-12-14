#ifndef MESHEXTTRANSFORMOPS_TD
#define MESHEXTTRANSFORMOPS_TD

include "mlir/Dialect/Transform/IR/TransformDialect.td"
include "mlir/Dialect/Transform/Interfaces/TransformInterfaces.td"
include "mlir/Dialect/Mesh/IR/MeshBase.td"
include "mlir/IR/OpBase.td"
include "mlir/IR/CommonAttrConstraints.td"
include "mlir/Interfaces/SideEffectInterfaces.td"

def OpSharding : Op<Transform_Dialect, "meshExt.op_sharding", 
    [DeclareOpInterfaceMethods<TransformOpInterface>,AttrSizedOperandSegments,
     NavigationTransformOpTrait, MemoryEffectsOpInterface]> {
        let summary = "sharding an op with given axes and mesh";
        let arguments = (ins TransformHandleTypeInterface:$operand_handle, 
                        FlatSymbolRefAttr:$mesh,
                        Mesh_MeshAxesArrayAttr:$split_axes,
                        OptionalAttr<Mesh_MeshAxesAttr>:$partial_axes,
                        OptionalAttr<Mesh_ReductionKindAttr>:$partial_type,
                        DefaultValuedAttr<DenseI64ArrayAttr, "{}">:$static_sharded_dims_offsets,
                        Variadic<I64>:$dynamic_sharded_dims_offsets,
                        DefaultValuedAttr<DenseI64ArrayAttr, "{}">:$static_halo_sizes,
                        Variadic<I64>:$dynamic_halo_sizes);
        let assemblyFormat = [{
    $operand_handle
    $mesh
    `split_axes` `=` $split_axes
    (`partial` `=` $partial_type $partial_axes^)?
    (`halo_sizes` `=` custom<DynamicIndexList>($dynamic_halo_sizes, $static_halo_sizes)^)?
    (`sharded_dims_offsets` `=` custom<DynamicIndexList>($dynamic_sharded_dims_offsets, $static_sharded_dims_offsets)^)?
    attr-dict `:` functional-type(operands, results)
    }];
        let cppNamespace = "::mlir::meshExt::transform";
}

#endif
