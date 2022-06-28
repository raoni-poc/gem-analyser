class IndexController < ApplicationController
  def index
    @content = search_rubygems
  end

  private

  def search_rubygems
    uri = URI('https://rubygems.org/gems')

    params = {
      :letter => 'A',
      :page => 1,
    }

    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)
    doc = Nokogiri::HTML(res.body)

    result = []
    doc.search(".gems__gem").map { |line|
      line = [
        'count': get_download_count(line),
        'gem_name': get_name(line),
        'gem_url': get_url(line),
        'gem_description': get_description(line),
        'gem_version': get_version(line),
      ]
      result.push(line)
    }
    result

  end

  def get_download_count (line)
    count_line = line.search(".gems__gem__downloads__count")[0].text.split("\n")
    count_line[1].strip.sub(',', '.')
  end

  def get_name (line)
    name_line = line.search(".gems__gem__name")[0].text.split("\n")
    name_line[1].strip
  end

  def get_url (line)
    line.attributes['href'].value
  end

  def get_description (line)
    line.search(".gems__gem__desc")[0].text
  end

  def get_version (line)
    line.search(".gems__gem__version")[0].text
  end
end
