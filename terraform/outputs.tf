# Terraform 실행 후 출력값 설정
output "public_ip" {

  # Hermes 서버의 고정 Public IP 출력
  value = aws_eip.hermes_eip.public_ip
}
