 Terraform AWS Webserver
Projeto de infraestrutura como código (IaC) que provisiona automaticamente um servidor web Apache na AWS utilizando Terraform e User Data.

 Sobre o Projeto
Este projeto cria e configura automaticamente uma instância EC2 na AWS com o servidor Apache instalado e em execução, sem nenhuma intervenção manual após o terraform apply. A página inicial customizada já é servida assim que a instância sobe.

 Arquitetura
Internet
    │
    ▼
[Security Group]
  ├── Porta 22 (SSH)  ──► Acesso administrativo
  └── Porta 80 (HTTP) ──► Tráfego web
    │
    ▼
[EC2 t3.micro - Ubuntu 24.04]
  └── Apache2 (instalado via User Data)
        └── /var/www/html/index.html

 Pré-requisitos

Terraform >= 1.0
AWS CLI configurado com credenciais válidas
Conta AWS com permissões para EC2 e Security Groups


 Como Usar
1. Clone o repositório
bashgit clone https://github.com/Rodrigo-CloudEngineer/terraform-aws-webserver.git
cd terraform-aws-webserver
2. Inicialize o Terraform
bashterraform init
3. Visualize o plano de execução
bashterraform plan
4. Aplique a infraestrutura
bashterraform apply
Confirme com yes quando solicitado. Ao final, o IP público do servidor será exibido no output:
Outputs:

ip_do_servidor = "X.X.X.X"
5. Acesse o servidor
Abra o navegador e acesse http://<ip_do_servidor>.

 Recursos Criados
RecursoNomeDescriçãoaws_security_groupwebserver-sg-p4Libera portas 22 (SSH) e 80 (HTTP)aws_instanceWebserver-Projeto-4EC2 Ubuntu 24.04 com Apache via User Data

 Configuração
ParâmetroValorRegião AWSus-east-1AMIUbuntu 24.04 (ami-04b4f1a9cf54c11d0)Tipo de instânciat3.microPorta HTTP80Porta SSH22

 Destruir a Infraestrutura
Para evitar cobranças desnecessárias, destrua os recursos quando não precisar mais:
bashterraform destroy


Estrutura do Projeto
terraform-aws-webserver/
├── main.tf         # Configuração principal da infraestrutura
├── .gitignore      # Arquivos ignorados pelo Git
└── README.md       # Documentação do projeto

👨‍💻 Autor
Rodrigo — Cloud Engineer em formação
