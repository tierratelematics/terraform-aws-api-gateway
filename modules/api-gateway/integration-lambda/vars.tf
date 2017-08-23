/*
 * Required
 */

variable "api_gateway_id" {
  description = "The ID of the REST API."
}

variable "api_gateway_resource_id" {
  description = "The API resource ID where attach the Lambda integration."
}

variable "api_gateway_role_arn" {
  description = "The ARN of the IAM Role used by the API Gateway"
}

variable "api_gateway_lambda_arn" {
  description = "The ARN of the Lambda for the integration"
}

/*
 * Optional
 */

variable "http_method" {
  default = "POST"
}

variable "integration_http_method" {
  default = "POST"
}

variable "integration_type" {
  default = "AWS"
}

variable "authorization" {
  description = "The type of authorization used for the method (NONE, CUSTOM, AWS_IAM)"
  default     = "NONE"
}

variable "method_request_models" {
  type = "map"

  default = {}
}

variable "content_handling" {
  description = "Specifies how to handle request payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT. If this property is not defined, the request payload will be passed through from the method request to integration request without modification, provided that the passthroughBehaviors is configured to support payload pass-through."
  default = ""
}

variable "passthrough_behavior" {
  description = "The integration passthrough behavior (WHEN_NO_MATCH, WHEN_NO_TEMPLATES, NEVER). Required if request_templates is used."
  default     = "NEVER"
}

variable "integration_request_templates" {
  description = "A map of the integration's request templates."
  type        = "map"

  default = {
    "application/json" = ""
  }
}

variable "integration_response_content_handling" {
  description = "Specifies how to handle request payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT. If this property is not defined, the request payload will be passed through from the method request to integration request without modification, provided that the passthroughBehaviors is configured to support payload pass-through."
  default = ""
}

variable "integration_response_templates" {
  type = "map"
  default = {}
}

variable "method_response_models" {
  type = "map"
  default = {}
}

variable "method_response_parameters" {
  type = "map"
  default = {}
}

variable "integration_response_parameters" {
  type = "map"
  default = {}
}
