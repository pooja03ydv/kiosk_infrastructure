resource "aws_sqs_queue" "kiosk-sqs" {
  name                      = var.sqs-queue
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10

  tags = {
    Environment = var.Environment
  }
}


resource "aws_lambda_event_source_mapping" "kiosk-sqs-lambdamapping"{
   event_source_arn = aws_sqs_queue.kiosk-sqs.arn 
   function_name = aws_lambda_function.kiosk-lambda.arn 
   }