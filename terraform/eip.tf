# Elastic IP 생성
# Hermes 서버에 사용할 고정 Public IP 역할
resource "aws_eip" "hermes_eip" {

  # 생성한 EC2 인스턴스에 Elastic IP 연결
  instance = aws_instance.hermes_server_setup_instance.id

  # Elastic IP 태그 설정
  tags = {

    # Elastic IP 이름
    Name = "hermes-eip"
  }
}
