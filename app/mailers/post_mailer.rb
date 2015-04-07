class PostMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.post_mail.subject
  #
  default from: "from@example.com"
  
  def post_mail(tweet_id)
  
	user_id = Tweet.find(tweet_id).user_id
	
	@user = User.find(user_id).email
	
	
    mail(to: @user, subject: 'RETWEET')
		   
  end
end
