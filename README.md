
# **IaC-Project_MobEAD**

## **Descrição do Projeto**

Este projeto demonstra como provisionar automaticamente um ambiente Windows Server na AWS usando **Terraform**, configurar o servidor usando **Ansible**, e orquestrar todo o processo com **Jenkins**. O objetivo é provisionar uma infraestrutura que inclui a instalação e configuração do **IIS (Internet Information Services)** em uma instância Windows.

---

## **Arquitetura do Projeto**

O projeto segue o seguinte fluxo:
1. **Terraform** é utilizado para provisionar a infraestrutura na AWS (EC2, Security Groups, etc.).
2. **Ansible** é usado para configurar a instância Windows provisionada, instalando e iniciando o serviço IIS.
3. **Jenkins** automatiza o pipeline para integrar todas as etapas, desde o provisionamento até a configuração.

---

## **Ferramentas Utilizadas**

### **1. Terraform**
- **Versão:** 1.5.0 ou superior
- **Função:** Provisionar infraestrutura (instância Windows EC2 na AWS)
- **Arquivos relacionados**: 
  - `main.tf`
  - `variables.tf`
  - `outputs.tf`
  - `terraform.tfvars`

### **2. Ansible**
- **Versão:** 2.14 ou superior
- **Função:** Configurar a instância Windows provisionada e instalar o IIS
- **Arquivos relacionados**:
  - `inventory.ini`
  - `playbook.yml`
- **Descrição**:
  O Ansible é uma ferramenta de **automação de configuração** que permite instalar, configurar e gerenciar servidores de forma automatizada. Utilizando um **playbook**, você pode definir as tarefas a serem executadas em seus servidores.

### **3. Jenkins**
- **Versão:** 2.387 ou superior
- **Função:** Orquestrar o pipeline CI/CD para provisionar infraestrutura e configurar o servidor.
- **Arquivo relacionado**:
  - `Jenkinsfile`

---

## **Configuração do Ansible**

### **Arquivos Importantes**

#### **1. `inventory.ini`**
#### **2. `playbook.yml`**

### **Como Executar o Ansible**
```bash
cd ansible
ansible-playbook -i inventory.ini playbook.yml
```

## **Considerações de Segurança**

- **.gitignore**:
  ```
  terraform.tfvars
  inventory.ini
  *.pem
  ```
- Nunca compartilhe suas credenciais de acesso da AWS publicamente.
- Certifique-se de que o arquivo `inventory.ini` **não está versionado** se contiver senhas.

---

## **Como Reproduzir o Projeto**

1. Clone o repositório.
2. Configure as variáveis de ambiente da AWS.
3. Execute o Terraform para provisionar a infraestrutura.
4. Use o Ansible para configurar a instância Windows.
5. Verifique o acesso ao servidor IIS via navegador em **http://<ip-publico>**.
