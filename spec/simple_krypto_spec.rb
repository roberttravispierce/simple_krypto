require 'spec_helper'

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
end
