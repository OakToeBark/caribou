Rails.configuration.stripe = {
  :publishable_key => 'pk_test_m9C8NlSL3GVo7KUVn9P3AS3A',
  :secret_key => 'sk_test_fK4w86vTf1WmuF7oqL3yp73t'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
