Dir[File.join(File.dirname(__FILE__),
    '../pages/*_page.rb')].each { |file| require file }

def wait_elements
    sleep 2
end

def refresh_page 
    @refresh_page = page.driver.browser.navigate.refresh
end


# Modulos para chamar as classes instanciadas
module Pages
    def busca_produtos
       @busca_produtos || BuscaProdutos.new
    end
end
