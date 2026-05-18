# EC2 인스턴스 생성
resource "aws_instance" "hermes_server_setup_instance" {

  # Ubuntu 24.04 ARM64 AMI
  # 주의:
  # t4g 계열은 ARM 기반이므로 ARM64 AMI를 사용해야 함
  # us-east-1 리전 기준 AMI ID는 최신 여부를 AWS Console에서 한 번 확인 권장
  ami = "ami-091138d0f0d41ff90"

  # Hermes Agent 안정 운영용 인스턴스
  # m7i-flex.large:
  # 2 vCPU / 4GB RAM / ARM Graviton
  instance_type = "m7i-flex.large"

  # AWS Key Pair 이름
  # SSH 접속 시 사용
  key_name = "hermes-key"

  # 연결할 Security Group
  security_groups = [
    aws_security_group.hermes_sg.name
  ]

  # 루트 디스크 설정
  root_block_device {

    # 디스크 크기
    # Hermes, Docker 이미지, 로그 저장을 고려해 30GB 사용
    volume_size = 30

    # gp3는 기본 SSD 볼륨 타입
    volume_type = "gp3"

    # EC2 삭제 시 EBS도 같이 삭제
    delete_on_termination = true
  }

  # EC2 태그 설정
  tags = {

    # EC2 이름
    Name = "hermes-server"
  }
}
