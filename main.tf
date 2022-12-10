resource "aws_elasticache_cluster" "main" {
  cluster_id           = "${var.env}-${var.name}-elasticache"
  engine               = var.engine
  engine_version       = var.engine_version
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
}

resource "aws_elasticache_parameter_group" "default" {
  for_each             = var.elasticache
  name   = "cache-params"
  family = "redis6.x"

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