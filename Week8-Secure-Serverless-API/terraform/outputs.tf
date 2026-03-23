output "api_endpoint" {
  description = "API Gateway endpoint"
  value       = aws_apigatewayv2_api.http_api.api_endpoint
}

output "items_table_name" {
  description = "DynamoDB table name"
  value       = aws_dynamodb_table.items.name
}

output "lambda_function_name" {
  description = "Lambda function name"
  value       = aws_lambda_function.api_handler.function_name
}

output "cognito_user_pool_id" {
  description = "Cognito User Pool ID"
  value       = aws_cognito_user_pool.users.id
}

output "cognito_app_client_id" {
  description = "Cognito App Client ID"
  value       = aws_cognito_user_pool_client.client.id
}

output "cognito_issuer_url" {
  description = "Cognito issuer URL"
  value       = "https://cognito-idp.${var.aws_region}.amazonaws.com/${aws_cognito_user_pool.users.id}"
}