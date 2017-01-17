class MyMailer < ActionMailer::Base

  def sendgrid_client
    @sendgrid_client ||= SendGrid::API.new(api_key:"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")
  end

  def new_user(user)
    template_id = "1e1e1d4b-9706-4144-9462-cde2d2748f52"

    data = {
      "personalizations": [
        {
          "to": [
            {
              "email": user.email
            }
          ],
          "substitutions": {
            "-name-": "USER_NAME",
            "-content-": user.name
          },
          "subject": "Welcome to the Arcade, Creator"
        }
      ],
      "from": {
        "email": "brock@creatorarcade.com"
      },
      "template_id": template_id
    }

    sendgrid_client.client.mail._("send").post(request_body: data)
  end
end
