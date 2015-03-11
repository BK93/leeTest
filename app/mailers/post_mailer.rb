class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.post_mail.subject
  #
  default from: "from@example.com"
  
  def post_mail
	# @user = User.find(user_id).email
	
	@greeting = "Hi"
	
    mail(to: 'zxc3485@naver.com', subject: 'HELLO')
		   
  end
end
