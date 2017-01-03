class MyMailer < ActionMailer::Base

  def sendgrid_client
    @sendgrid_client ||= SendGrid::API.new(api_key: "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")
  end

  def new_user(user)
    template_id = "welcome"

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
