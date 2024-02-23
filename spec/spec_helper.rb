# Method to update instance variables of Palladium class
def update_instance_vars(palladium)
  palladium.instance_variable_set(:@product_id, 456)
  palladium.instance_variable_set(:@plan_id, 789)
  palladium.instance_variable_set(:@run_id, 123)
  palladium.instance_variable_set(:@result_set_id, 999)
end