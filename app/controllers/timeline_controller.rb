class TimelineController < ApplicationController
  before_action :authenticate!

  def index
    @tweets  = current_user.tweets
    @results = monkey_learn(@tweets).result
  end

  private
    def monkey_learn(tweets)
      Monkeylearn.classifiers.classify('cl_qkjxv9Ly', tweets, sandbox: false)
    end
end

