resource "aws_db_instance" "tech-challenge-db" {
  engine               = "postgres"
  identifier           = "tech-challenge-db"
  allocated_storage    =  20
  engine_version       = "15.2"
  instance_class       = "db.t3.micro"
  username             = "postgres"
  password             = "postgrespassword123"
  vpc_security_group_ids = ["${aws_security_group.tech-challenge-db-group.id}"]
  skip_final_snapshot  = true
  publicly_accessible =  true
  storage_encrypted    = false
}

resource "aws_security_group" "tech-challenge-db-group" {
  name = "tech-challenge-db-group"
  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
