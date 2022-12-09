resource "aws_elasticache_cluster" "example" {
  for_each             = var.elasticache
  cluster_id           = "${var.env}-${each.key}-elasticache"
  engine               = each.value.engine
  node_type            = each.value.node_type
  num_cache_nodes      = each.value.num_cache_nodes
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
}

resource "aws_elasticache_parameter_group" "default" {
  for_each             = var.elasticache
  name   = "cache-params"
  family = "redis2.8"

  parameter {
    name  = "activerehashing"
    value = "yes"
  }

  parameter {
    name  = "min-slaves-to-write"
    value = "2"
  }
}
Argu