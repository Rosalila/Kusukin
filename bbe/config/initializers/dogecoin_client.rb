DogecoinClient.configure do |config|
    config.host = 'localhost'
    config.port = 22555
    config.protocol = :http
    config.user = 'dogecoinrpc'
    config.password = ''
end
