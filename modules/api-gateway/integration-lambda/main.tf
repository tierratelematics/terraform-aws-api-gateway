terraform {
  required_version = ">= 0.9, < 0.10"
}

/*
 * Resources
 */

//
// Request phase
//

resource "aws_api_gateway_method" "request_method" {
  rest_api_id   = "${var.rest_api_id}"
  resource_id   = "${var.parent_resource_id}"
  http_method   = "${var.http_method}"
  authorization = "${var.authorization}"
}

resource "aws_api_gateway_integration" "request_integration" {
  rest_api_id             = "${var.rest_api_id}"
  resource_id             = "${var.parent_resource_id}"
  http_method             = "${aws_api_gateway_method.request_method.http_method}"
  integration_http_method = "${var.integration_http_method}"
  type                    = "${var.integration_type}"
  uri                     = "${var.lambda_arn}"
  credentials             = "${var.api_gateway_role_arn}"

  content_handling     = "${var.content_handling}"
  passthrough_behavior = "${var.passthrough_behavior}"

  request_templates    = "${var.integration_request_templates}"
}

//
// Response phase
//

resource "aws_api_gateway_integration_response" "response_integration" {
  rest_api_id = "${var.rest_api_id}"
  resource_id = "${var.parent_resource_id}"
  http_method = "${aws_api_gateway_method.request_method.http_method}"
  status_code = "${aws_api_gateway_method_response.response_method.status_code}"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

  content_handling = "${var.integration_response_content_handling}"

  response_templates = "${var.integration_response_templates}"
}

resource "aws_api_gateway_method_response" "response_method" {
  rest_api_id = "${var.rest_api_id}"
  resource_id = "${var.parent_resource_id}"
  http_method = "${aws_api_gateway_method.request_method.http_method}"
  status_code = "200"

  response_models = "${var.method_response_models}"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = true
  }
}
