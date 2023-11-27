#language: pt
#encoding: utf-8
@busca
Funcionalidade: Pesquisa de produtos

- Eu como usuário
- Quero acessar o google para pesquisar produtos na atraves da loja da amazon

Contexto: Buscar produto
    Dado abro o navegador no site do google
    Quando busco por "Amazon Brasil"
    E acesso a página da amazon
    Então pesquiso pelo produto Iphone 

Cenário: Listagem de produtos buscado   
    E verifico total de produtos na Listagem
    E verifico o total de Iphones encontrados
    Então valido que 80% dos itens encontrados devem ser iphone

Cenário: Conversão do preço pela api exchangeratesapi
    Quando pesquiso Iphone mais caro
    E converto o valor para dólar
    Então o valor convertido deverá ser menor que US$2000  

@mais_barato
Cenário: Verificação de produtos mais baratos
    Quando verifico produtos que não são Iphone
    Então verifico que o valor é menor que o Iphone
 