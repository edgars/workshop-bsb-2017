# Workshop WSO2 em Brasilia 10/Oct/2017 
Repositório do Workshop de Brasilia para WSO2 Integration e WSO2 API Manager.

# Local do Workshop 
Grand Mercure Brasília Eixo Monumental
SHN quadra 05 Bloco G,
70.705-913 Brasília - DF,
Brazil

# Pré-Reqs
* Conhecimento básico em programação
* Conhecimento básico de aplicações web
* Trazer seu próprio laptop
* Qualquer sistema operacional
* Java 8 Instalado
* Preferencialmente 5GB de espaço em disco livre
* Preferencialmente 4-8 GB Memória
* Instalar o WSO2 Developer Studio - Tooling : https://wso2.com/integration#download
* Criar uma conta no WSO2 Cloud - http://wso2.com/cloud
* Realizar o Download do WSO2 Enterprise Integrator - https://wso2.com/integration#download
* Realizar o Download do WSO2 API Manager 

# Laboratórios Integrator 
### Informações de Acesso para o DSS
* URL Remota: jdbc:mysql://mysql.storage.cloud.wso2.com:3306/mybank_eascorp
* Default User: admin_s4GK3rOB
* Password: (Pergunte ao Edgar) 
* Pode usar o Script em sua máquina local. [Link](https://github.com/edgars/workshop-bsb-2017/blob/master/workshop_EI.sql)

#### SQLs

* CustomerDSS: `SELECT customer_ID,name,email,salary, mobile, comments from customers`

* BankAccountsDSS :
`SELECT c.customer_ID as customerID,
a.accountNumber, a.agency, c.name from (account a join customers c) 
where (a.customer_ID = c.customer_ID) `





