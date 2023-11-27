## Projeto de automação de teste com Ruby, Cucumber e o framework capybara ##

Esse repositório contém um projeto de automação de testes que roda a feature no site do google a amazon:

 "busca_produtos.feature" - Realiza testes buscando por produtos 

### Instalação do ruby e dependências no Windows ###

Seguir o passo a passo nos tutoriais

https://ftstblog.wordpress.com/2018/03/27/cucumber-configuracao-windows/

OU também:

https://papito.medium.com/instalando-ruby-cucumber-e-capybara-no-windows-10-acb1fe833a95

### Instalação do Rbenv e dependências no Ubuntu ou qualquer outro baseado no Debian ###

1) Rodar o comando para atualização de pacotes
```shell
sudo apt update
```
2) Rodar o comando intalação das dependencias
```shell
sudo apt install git curl autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev
```
3) Instalação Rbenv
```shell
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
```
4) Executar os comandos abaixo e ver

```shell
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
```
5) Executar o comando para ver a versão instalada do rbenv
```shell
rbenv -v
```
6) Para instalação do ruby devemos ver as versões disponíveis 
```shell
rbenv install -l
```
7) Escolher uma versão por exemplo 3.0.6
```shell
rbenv install 3.0.6
```
8) Deixando a versão disponível no projeto ou pasta da aplicação
```shell
rbenv local 3.0.6
```
9) Verificando a se a instalação deu certo
```shell
ruby --version

RESULTADO

ruby 3.0.6p216 (2023-03-30 revision 23a532679b) [x86_64-linux]
```

#### Executando o projeto ####

1) Após a instalação do ruby vamos na pasta do projeto e executamos o comando 'bundle' para instalação das dependências dele na máquina, veja o exemplo abaixo:
```shell
~/Desktop/ruby_demoblazer$ bundle
Fetching gem metadata from http://rubygems.org/.........
Resolving dependencies...
Using ast 2.4.2
Using mini_mime 1.1.5
Using bundler 2.2.33
Using racc 1.7.3
Using mini_portile2 2.8.5
Using public_suffix 5.0.4
Using builder 3.2.4
Fetching matrix 0.4.2
Using byebug 11.1.3
Using cucumber-cucumber-expressions 17.0.1
Using diff-lcs 1.5.0
Using rack 3.0.8
Using regexp_parser 2.8.2
Using cucumber-ci-environment 9.2.0
Using multi_test 1.1.0
Using language_server-protocol 3.17.0.3
Using rainbow 3.1.1
Using cucumber-tag-expressions 5.0.6
Using ffi 1.16.3
Using json 2.6.3
Using unicode-display_width 2.5.0
Using cucumber-messages 22.0.0
Using rexml 3.2.6
Fetching site_prism-all_there 2.0.2
Using ruby-progressbar 1.13.0
Using nokogiri 1.15.5 (x86_64-linux)
Using addressable 2.8.5
Using websocket 1.2.10
Using syntax 1.2.2
Using rspec-support 3.12.1
Using parallel 1.23.0
Using rubyzip 2.3.2
Using rack-test 2.1.0
Using xpath 3.2.0
Using sys-uname 1.2.3
Using rspec-mocks 3.12.6
Using cucumber-html-formatter 20.4.0
Using parser 3.2.2.4
Using rspec-core 3.12.2
Using rspec-expectations 3.12.3
Using rubocop-ast 1.30.0
Using cucumber-gherkin 26.2.0
Using selenium-webdriver 4.15.0
Using cucumber-core 12.0.0
Using rspec 3.12.0
Using rubocop 1.57.2
Using cucumber 9.1.0
Installing site_prism-all_there 2.0.2
Installing matrix 0.4.2
Fetching capybara 3.39.2 (was 3.2.1)
Installing capybara 3.39.2 (was 3.2.1)
Fetching site_prism 4.0.3 (was 2.15.1)
Installing site_prism 4.0.3 (was 2.15.1)
Bundle updated!
```

2) Devemos baixar também o chromedriver no site https://chromedriver.chromium.org/downloads, após descompactar o arquivo deverá ficar na pasta /usr/local/bin/

3) Enfim para executar a automação é só executar o comando 'cucumber' para rodar todos os cenários ou também cucumber -t<@cenário_da_feature> para rodar alguma cenário separado
```shell
    cucumber -t@busca
```
![image](https://github.com/thiagoalanjs/demoblazer_bdd_ruby/assets/32438113/b19ec85c-a648-4cfa-8bc5-f981c518a376)

#### Analisando o relatório de testes ####

Para ver o relatório de testes e checar os cenários que passaram ou não é só abrir o arquivo report.html que está está na pasta /result :

![image](https://github.com/thiagoalanjs/desafio_avancado/assets/32438113/f2fd3dfb-963c-437a-8c80-6b1d717b3c32)


#### Observações ####

OBS 1.: No cenário que avaliamos o percentual de prondutos e tem que retornar 80% de produto Iphone está quebrando pois só retorna certa de 55%

![image](https://github.com/thiagoalanjs/desafio_avancado/assets/32438113/c9fd2ec3-70d1-433c-8c63-512425eeae57)

OBS.: No cenário da conversão de de BRL para USD onde não deveria passar de U$2000 o teste também quebra pelo motivo de um valor creio eu que cadastrado erroneamente em produto da amazon conforme imagens abaixo:

![image](https://github.com/thiagoalanjs/desafio_avancado/assets/32438113/fcd7689a-5014-4fe2-abca-d5afb6a082da)

![image](https://github.com/thiagoalanjs/desafio_avancado/assets/32438113/2ec75a7f-d519-4508-802e-bb550b41ccfa)


