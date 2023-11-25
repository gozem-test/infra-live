include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/cloudwatch-metric-alarm.git"
}

dependency "autoscaling-policy" {
  config_path = "../autoscaling-policy"
}

dependency "asg" {
  config_path = "../asg"
}

inputs = {
  alarm_name = "WebServerCPUAlarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = 2
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = 120
  statistic = "Average"
  threshold = 70
  asg_name = dependency.asg.outputs.name
  alarm_description = "This metric monitors the web server CPU utilization"
  alarm_actions = [dependency.autoscaling-policy.outputs.arn]
}
