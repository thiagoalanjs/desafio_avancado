Dado('abro o navegador no site do google') do
    visit '/'
end
  
Dado('busco por {string}') do |data_amazon|
   busca_produtos.type_field_google_search(data_amazon)
end
  
Então('acesso a página da amazon') do
   busca_produtos.click_link_amazon
end
  
Dado('pesquiso pelo produto Iphone') do
   wait_elements
   busca_produtos.search_amazon
end

Dado('verifico total de produtos na Listagem') do
   wait_elements
   busca_produtos.all_products
end

Dado('verifico o total de Iphones encontrados') do
   @total_item_list = find_all(".a-size-base-plus.a-color-base.a-text-normal").count
   p "Total itens da busca: #{@total_item_list}"
end

Então('valido que {float}% dos itens encontrados devem ser iphone') do |percent_product|
    @total_iphone = find_all(:xpath, "//h2/a/span[contains(text(), 'Apple')]").count
    @res = @total_iphone * 100 / @total_item_list
    p "Total de Iphones do resultado de busca: #{@total_iphone}" 
    p "O percentual de Iphone na listagem da busca é: #{@res.to_f} %"
    expect(@res.to_f ).to be >= percent_product
end

Quando('pesquiso Iphone mais caro') do
    busca_produtos.select_product_by_high_price
    price =  find("div > div:nth-child(1) > a > span > span:nth-child(2) > span.a-price-whole", match: :first).text 
    @br_price = price.delete('.').tr(',', '.').to_f
    p "O valor mais alto do iphone R$ #{ @br_price }"
end
  
Quando('converto o valor para dólar') do
    # Realiza a chamada na api para converter BRL em USD
    url = "https://open.er-api.com/v6/latest/BRL?apikey=0fe2076a30acc7ab76dcd9b52a0f6d01&symbols=USD"
    begin
      response = RestClient.get(url)
      if response.code == 200
        @rate_usd = JSON.parse(response.body)['rates']['USD']
        puts "A taxa para conversão de câmbio de BRL para USD é: #{@rate_usd}"
      else
        puts "Erro na solicitação. Código de resposta: #{response.code}"
      end
    rescue RestClient::ExceptionWithResponse => e
      puts "Erro: #{e.response}"
    rescue RestClient::Exception => e
      puts "Erro: #{e.message}"
    end
end
  
Então('o valor convertido deverá ser menor que US${float}') do |dolar_price|
    price_converted = @rate_usd.to_f * @br_price
    p "Preço final convertivo de BRL para USD: US$#{format("%.2f", price_converted)}"
    @result = format("%.2f", price_converted.to_f)
    expect(@result.to_f).to be <= dolar_price  
end
  
Quando('verifico produtos que não são Iphone') do
    #Realizo a classificação ds produtos do menor para o maior preço
    busca_produtos.select_product_by_low_price
    wait_elements
    p find(:xpath, "//h2/a/span[not(contains(text(), 'Apple'))]", match: :first).text
end

Então('verifico que o valor é menor que o Iphone') do
    
    # Verifica o valor do produto mais caro
    refresh_page
    busca_produtos.select_product_by_high_price
    high_iphone_price =  find("div > div:nth-child(1) > a > span > span:nth-child(2) > span.a-price-whole", match: :first).text 
    @iphone_price = high_iphone_price.delete('.').tr(',', '.').to_f
    p "O valor mais alto do iphone R$ #{ @iphone_price }"
  
    # Valido que o valor de outro é menor do que o Iphone
    # Variavel 'price' pega o primero preço na listagem
    
    refresh_page
    busca_produtos.select_product_by_low_price
    price =  find("div > div:nth-child(1) > a > span > span:nth-child(2) > span.a-price-whole", match: :first).text 
    @other_product_price = price.delete('.').tr(',', '.').to_f
    p "O valor do produto diferente de iPhone R$ #{ @other_product_price }"
    # Compara os valores
    expect(@other_product_price.to_f).to be <  @iphone_price.to_f 
end