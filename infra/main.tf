module "cadastro_alunos_service" {
  source       = "../modules/lambda_service"
  project_name = var.project_name
  environment  = var.environment
  aws_region   = var.aws_region


  lambda_function_name    = var.project_name
  sqs_queue_name          = "fila-cadastro-alunos-${var.environment}"
  sqs_queue_arn           = "arn:aws:sqs:..."
  s3_bucket_name          = "${var.project_name}-idempotency-${var.environment}"
  glue_job_name           = "job-processamento-alunos"
  data_output_bucket_name = "bucket-dados-finais"

  aws_statefile_s3_bucket = "lbd-cadastro-alunos-state"
  aws_lock_dynamodb_table = "lock-table"
}
