class MyMailer < ActionMailer::Base

  def sendgrid_client
    @sendgrid_client ||= SendGrid::API.new(api_key: "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")
  end

  def new_user(user)
    template_id = "e3606fe6-77f2-4ab5-951f-986972a701f8"

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
