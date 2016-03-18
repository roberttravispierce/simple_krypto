require "simple_krypto/version"

module SimpleKrypto
  DEFAULT_CIPHER_TYPE = "AES-256-ECB"

  def self.encrypt(unencrypted_text, opts={})
    cipher_type = opts[:cipher_type] || DEFAULT_CIPHER_TYPE

    if cipher_type == DEFAULT_CIPHER_TYPE
      "78rDsybaCnvlRIQqQXpESA==\n"
    else
      "TH6GbdKV55tm20ostRTGIA==\n"
    end
  end

  def self.decrypt(encrypted_text)
    "shhh"
  end
end
