locals {
  name = "${var.project_name}-${var.environment}"
  az_names = slice(data.aws_availability_zones.azs.names,0,2) 
}

# slice Function
# slice extracts some consecutive elements from within a list. 
# slice(list, startindex, endindex)
# startindex is inclusive (0 = 1st value), while endindex is exclusive (2 = 2 nd value).

#  slice(["a", "b", "c", "d"], 1, 3)
#[
#  "b",
#  "c",
#]

# In this example 1 =b and 3 =c
