class BuscaProdutos < SitePrism::Page
    element :field_google_search, '#APjFqb'
    element :link_amazon, :xpath, '//*[@id="tads"]/div/div/div/div/div[1]/a/div[1]/span'
    element :search_field_amazon, "#twotabsearchtextbox"
    element :btn_search_amazon, "#nav-search-submit-button"
    element :selec_price, "#a-autoid-0"
    element :selec_by_high_price, "#s-result-sort-select_2"
    element :selec_by_low_price, "#s-result-sort-select_1"

    def type_field_google_search(data_amazon)
        field_google_search.send_keys(data_amazon, :enter)
    end

    def click_link_amazon
        link_amazon.click
    end

    def search_amazon
        search_field_amazon.send_keys("Iphone")
        btn_search_amazon.click
    end

    def all_products
        total_product_result = find(".a-section.a-spacing-small.a-spacing-top-small", match: :first).text
        p "Total de produtos listados: " + total_product_result
    end 

    def select_product_by_high_price
        selec_price.click
        selec_by_high_price.click
    end

    def select_product_by_low_price
        selec_price.click
        selec_by_low_price.click
    end
end