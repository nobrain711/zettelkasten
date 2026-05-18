# Security Group 생성
# EC2 방화벽 역할
resource "aws_security_group" "hermes_sg" {

  # Security Group 이름
  name = "hermes-sg"

  # Inbound 규칙
  # 외부 -> EC2 접근 허용
  ingress {

    # 규칙 설명
    description = "SSH"

    # 허용 시작 포트
    from_port = 22

    # 허용 종료 포트
    to_port = 22

    # 사용할 프로토콜
    protocol = "tcp"

    # 허용할 IP 대역
    # 현재는 전체 허용
    # 추후 본인 IP만 허용 권장
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound 규칙
  # EC2 -> 외부 접근 허용
  egress {

    # 시작 포트
    from_port = 0

    # 종료 포트
    to_port = 0

    # 모든 프로토콜 허용
    protocol = "-1"

    # 모든 외부 통신 허용
    # 추후 허용하는 IP만 대체 예정
    cidr_blocks = ["0.0.0.0/0"]
  }
}
