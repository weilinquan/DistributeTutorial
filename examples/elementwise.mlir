mesh.mesh @mesh_2d(shape = 2x4)
func.func @element_wise_on_def(%arg0: tensor<8x16xf32>) -> tensor<8x16xf32> {
  %0 = tosa.sigmoid %arg0 : (tensor<8x16xf32>) -> tensor<8x16xf32>
  %s1 = mesh.sharding @mesh_2d split_axes = [[0], [1]] : !mesh.sharding
  %1 = mesh.shard %0 to %s1  : tensor<8x16xf32>
  return %1 : tensor<8x16xf32>
}