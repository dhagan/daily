class PagesController < ApplicationController
  def home
    @greeting = "Home action says: Hello world!"

=begin
    require 'rss'
    feed = RSS::Parser.parse(@URL)
    feed.items.each do |item|
      puts item.title
    end
=end

    require 'nokogiri'
    require 'open-uri'

    @URL = 'http://www.swellinfo.com/rss/surf/hookipa-maui.xml'

    @doc = Nokogiri::XML(open(@URL))
    @greeting = @doc.at_xpath('/rss/channel/item/title').content
    @description =  @doc.at_xpath('/rss/channel/item/description').content
    @description.html_safe
    #@greeting =  "title  = " + @doc.rss.channel.item.title;
    #render html: @description.html_safe

  end

  def send_mail
    puts 'send_mail called'
    #@user = Object.new
    #@user.email = 'djh_sup4@mailinator.com'
    @user = OpenStruct.new
    @user.email = 'dhagan111@gmail.com'
    UserMailer.welcome_email(@user).deliver!
    #head :ok
  end

end
