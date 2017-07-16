require 'nokogiri'

require 'open-uri'

   



def get_the_email_of_a_townhal_from_its_webpage(lien)

    lien.each { |x| 

    pageMairie = Nokogiri::HTML(open(x))

    extract = pageMairie.xpath("/html/body").text

    mail = /\w+[\.|\-|\_]*[\w+]*[\.|\-|\_]*[\w+]*[\.|\-|\_]*[\w+]*@\w+[\.|\-|\_]*[\w+]*[\.|\-|\_]*[\w+]*[\.|\-|\_]*[\w+]*\.\w+/.match(extract) 

    puts mail }

end





def get_all_the_urls_of_val_doise_townhalls

    pageDep = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html")) 

    # xpath copié sur inspecteur d'élément : //*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody/tr/td[1]/p/a[1]

    urlFin = pageDep.xpath("///table/tr[2]/td/table/tr/td/p/a/@href").text.gsub(/\.\/95/," /95")

    

    urlFinTab = urlFin.split(" ")

   

    url = []

    urlFinTab.each { |element|

        url << "http://annuaire-des-mairies.com"+element }

   

    get_the_email_of_a_townhal_from_its_webpage(url)

end

 



get_all_the_urls_of_val_doise_townhalls