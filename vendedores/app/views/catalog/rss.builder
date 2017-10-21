xml.instruct!

xml.rss "version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/" do
  xml.channel do
    xml.title @page_title
    xml.description "Vendedores de historias: librería online"
    xml.link url_for :action => 'index', :only_path => false
    xml.language "en-us"
    xml.ttl "60"

    for book in @books do
      xml.item do
        xml.title book.title
        xml.description "#{book.title} de #{book.author_names}"
        xml.link url_for :action => "show", :id => book, :only_path => false
        xml.guid url_for :action => "show", :id => book, :only_path => false
        xml.pubDate book.created_at.to_s :long
        xml.author book.author_names
      end
    end
  end
end
   
