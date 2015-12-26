class HomeController < ApplicationController
  before_action :set_twitter_client

  def index
    timeline = @client.user_timeline(params[:username])
    @tweets = timeline.map(&:text)
    @results = monkey_learn(@tweets).result
  end

  private
    def set_twitter_client
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = "An6pIZs5xx73j4MDKcNEQLxmA"
        config.consumer_secret     = "OiBDK9m2WCzxLYo6OsXlm0HGfUOvwOk1cNsCgkk0oiuReXoPiv"
        config.access_token        = "1005610910-vgpajqCCW8g8s2P1i7msQVLNalBOpkGb9lnxHYc"
        config.access_token_secret = "O0EoMuMYv9A2TLzYwAnOSU3KQuTaXAFc1aBzC3M7m0bnO"
      end
    end

    def monkey_learn(tweets)
      Monkeylearn.classifiers.classify('cl_qkjxv9Ly', tweets, sandbox: false)
    end
end
