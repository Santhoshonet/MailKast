class MailCampController < ApplicationController

  def index
    begin
      cm = CampaignMonitor.new("a46e16fbdebc0c9289a01c80c2a3d025")
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
                          apikey = "a46e16fbdebc0c9289a01c80c2a3d025"
                          cm = CampaignMonitor.new(apikey)
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
                                client["Username"] = contactname
                                client["Password"] = "password@123"
                                client["BillingType"] = "UserPaysOnClientsBehalf"
                                client["Currency"] ="USD"
                                client["DeliveryFee"] = "5"
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
                                    redirect_to :action => "Success"
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
		rescue Exception => exc
			flash[:error] = exc.message #"An unknow error occured while processing your request. Sorry for the inconvenience"
		end
  end

  def Success

  end

end
