;; extends

; await Model.findById(id).populate<{ foo: Foo }>(...)
;                          ^^^^^^^^
(call_expression
  function: (await_expression (member_expression
    property: [
      (property_identifier)
      (private_property_identifier)
    ] @function.method.call)))
