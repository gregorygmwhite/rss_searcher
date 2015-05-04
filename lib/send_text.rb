require 'twilio-ruby'
 
account_sid = 'ACa2d607218147d7fefd923c2b1a8f9d11'
auth_token = '38ea477a666c1975c9d3dacbc4b2dfe5'
@client = Twilio::REST::Client.new account_sid, auth_token
 
args = Hash[*ARGV]



content = args.has_key?("-m") ? args["-m"] : nil

if content
  puts "Your message was #{content}" 

  message = @client.account.messages.create(
      :body => content,
      :to => "+15038413886",
      :from => "+19712051238")
  puts message.to

else
  puts "No message given, no action taken"
end