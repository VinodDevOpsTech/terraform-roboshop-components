locals {
    sg_id= data.aws_ssm_parameter.sg_id.value
    ami = data.aws_ami.DevOps.id
    common_name = "${var.project}-${var.environment}-${var.component}"
    private_subnet_ids = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    alb_listener_arn = var.component == "frontend" ? data.aws_ssm_parameter.frontend_alb_listener_arn.value : data.aws_ssm_parameter.backend_alb_listener_arn.value
    common_tags ={
        Project = "${var.project}"
        Environment = "${var.environment}"
    }
    host_header = var.component == "frontend" ? "robohsop-${var.environment}.${var.domain_name}" : "${var.component}.backend_alb-${var.environment}.${var.domain_name}"
}