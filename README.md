# ifaxapp_api

This gem wraps IFaxapp's API. https://www.ifaxapp.com/docs/api/v1

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ifaxapp_api'
```

And then execute:

    bundle

Or install it yourself as:

    gem install ifaxapp_api

## Usage

If you want to use this its quite simple first create a client object of Cms api:

    @client = IfaxappApi::Client.new(api_key: "API_KEY")

To get send fax

    params = {
      "faxNumber" : "+12345678901",
      "faxData" : [{
            "fileName" : "abc.pdf",
            "fileUrl" : "HTTP url of file"
          },
          {
            "fileName" : "xyz.pdf",
            "fileUrl" : "HTTP url of file"
      }]
    }
    @client.fax.send(params: params)

To resend fax

    params = {"jobId" : 12345}
    @client.fax.resend(params: params)

To Get fax status

    params = {"jobId" : 12345}
    @client.fax.status(params: params)

## Contributing

1. Fork it ( https://github.com/dilkhush/ifaxapp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
