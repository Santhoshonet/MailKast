require "net/smtp"

class MailCampController < ApplicationController

  def index

    #SendMail()
    
    begin
      cm = Campaign
      Monitor.new("a46e16fbdebc0c9289a01c80c2a3d025")
    rescue
    end
    begin
        if request.post?
          company = params[:Name]
          if company.empty?
            flash[:error]  = "Please Enter Company name"
          else
			email = params[:Email]
			if email.empty?
		      flash[:error]  = "Please Enter Email ID"
			else
			  contactname = params[:Contact]
			  if contactname.empty?
			    flash[:error]  = "Please Enter Contact name"
              else
                password = params[:Password]
                if password.empty?
                  flash[:error] = "Please Enter Password"
                else
                  apikey = "a46e16fbdebc0c9289a01c80c2a3d025"
                  puts "i am here"
                  cm = CampaignMonitor.new(apikey)
                  puts " i am also here"
                  client = CampaignMonitor::Client.new
                  client["CompanyName"] = company
                  client["ContactName"] = contactname
                  client["EmailAddress"] = email
                  client["Country"] = "India"
                  client["Timezone"] = "(GMT+05:30) Chennai, Kolkata, Mumbai, New Delhi"
                  result = client.Create
                  #puts result.raw["FullError"]
                  rescode = ''
                  doc = REXML::Document.new(result.raw["FullError"])
                  REXML::XPath.each(doc,"//Code") { |e|
                   #   puts e
                      rescode = e.text
                  }
                  #puts rescode
                  if  rescode == ''
                      #puts result.raw["FullError"]
                      doc = REXML::Document.new(result.raw["FullError"])
                      clientid = ''
                      REXML::XPath.each(doc,"//anyType") { |e|
                        clientid = e.text
                      }
                      #puts clientid
                      client = CampaignMonitor::Client.new
                      client["ApiKey"] =  apikey
                      client["ClientID"] = clientid
                      client["AccessLevel"] = "55"
                      client["Username"] = email
                      client["Password"] = password
                      client["BillingType"] = "UserPaysOnClientsBehalf"
                      client["Currency"] ="USD"
                      client["DeliveryFee"] = "0"
                      client["CostPerRecipient"] = "0"
                      client["DesignAndSpamTestFee"] = "0"
                      result = client.UpdateAccessAndBilling
                      rescode = ''
                      doc = REXML::Document.new(result.raw["FullError"])
                      REXML::XPath.each(doc,"//Code") { |e|
                        rescode = e.text
                      }
                      puts rescode
                      if rescode == '' or rescode == "0"
                          flash[:username] = email
                          flash[:password] = password
                          redirect_to "https://santech.createsend.com/login.aspx?username=" + email + "&password=" + password
                      else
                          flash[:error] = "Client has been created successfully, The following error occured while assigning the Account Access <br/> " + result.raw["FullError"]
                      end
                  else
                      flash[:error] = result.raw["FullError"]
                  end
               end
            end
          end
        end
      end
    rescue Exception => exc
      puts exc.backtrace
	  flash[:error] = exc.message #"An unknow error occured while processing your request. Sorry for the inconvenience"
    end
    
  end

  def Success

  end

  def SendMail ()

    # Login credentials
  username = 'santhoshonet@gmail.com'
  password = 'password@123'
    # send the message
  smtp_main = Net::SMTP.start('smtp.sendgrid.net', 25, "santhoshonet@gmail.com",  username, password, :login) do |smtp|
    smtp.open_message_stream('santhoshonet@gmail.com', ['santhosh@itxsolutionsindia.com']) do |f|
            f.puts "Content-type: text/html"
            f.puts 'From: santhoshonet@gmail.com'
            f.puts 'To: santhosh@itxsolutionsindia.com'
            f.puts 'Subject: test message'
            f.puts ""
            f.puts '<b>This is a test message.</b>'
          end
  end

  end

end
