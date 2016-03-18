require 'spec_helper'
require 'base64'

describe SimpleKrypto do
  it 'has a version number' do
    expect(SimpleKrypto::VERSION).not_to be nil
  end

  it 'does something useful' do
    data = "shhh"
    encrypted_text = SimpleKrypto.encrypt data
    decrypted_text = SimpleKrypto.decrypt encrypted_text
    expect(decrypted_text).to eq(data)
  end

  it 'encrypts using AES 256 by default' do
    data = "shhh"
    encrypted_text = SimpleKrypto.encrypt data
    key = "a" * 128
    aes = OpenSSL::Cipher::Cipher.new "AES-256-ECB"
    aes.encrypt
    aes.key = key
    expected_text = Base64.encode64(aes.update(data) + aes.final)

    encrypted_text = SimpleKrypto.encrypt data
    expect(encrypted_text).to eq expected_text
  end

  it 'encrypts using supplied cypher type' do
    data = "shhh"
    encrypted_text = SimpleKrypto.encrypt data
    key = "a" * 128
    aes = OpenSSL::Cipher::Cipher.new "AES-128-ECB"
    aes.encrypt
    aes.key = key
    expected_text = Base64.encode64(aes.update(data) + aes.final)

    encrypted_text = SimpleKrypto.encrypt data, cipher_type: "AES-128-ECB"
    expect(encrypted_text).to eq expected_text
  end
end
