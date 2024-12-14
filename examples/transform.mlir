module attributes { transform.with_named_sequence } {
  transform.named_sequence @codegen(
      %arg0: !transform.any_op) {

  %0 = transform.select.by_operation_attribute %arg0 {attribute_name = "op_name", attribute_value = "sigmoid1"} : (!transform.any_op) -> !transform.any_op
  transform.print %0 : !transform.any_op
  transform.yield
}
} // module