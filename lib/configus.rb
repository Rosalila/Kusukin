Configus.build Rails.env do
  env :production do
    dogecoin_client do
      host 'localhost'
      port 22555
      protocol :http
      user 'dogecoinrpc'
      password 'D5ZDXKAwUU4N4QF3ScKwyYqtS78f6xUMSiP1PxTUhCSA'
    end

    dragonfly do
      plugin :imagemagick
      secret '34c80e5736e9a99f3ccc6b7dd84a1d5466002064f1b5f3807cd23571b3712069'
      url_format '/media/:job/:name'
    end

    devise do
      secret_key '4e9f40f09c8b2a066515ad7e03f9c28cbe3a695fa4d73ffaf8814fda2c5ab1f08d70c798b31a34b3edefafec7df09a4cba9d3d5b2c53842b87f26f926de96b29'
      mailer_sender 'no-reply@kusuk.in'
    end
  end

  env :development, parent: :production do
  end
  env :test, parent: :development do
  end
end
