mesh.mesh @mesh_1d(shape = 2)
func.func @element_wise_on_def(%arg0: tensor<8x16xf32>) -> tensor<8x16xf32> {
  %0 = tosa.sigmoid %arg0 {op_name = "sigmoid1"}: (tensor<8x16xf32>) -> tensor<8x16xf32>
  return %0 : tensor<8x16xf32>
}
