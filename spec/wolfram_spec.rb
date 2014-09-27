require 'spec_helper'
require 'ally/io/test'

require_relative '../lib/ally/render/wolfram'

describe Ally::Render::Wolfram do

  let(:io) { Ally::Io::Test.new }
  subject { Ally::Render::Wolfram }

  it 'get cool' do
    ans = io.pass('cool', subject)
    ans.should match(/^[0-9]+ °F  \(wind chill: [0-9]+ °F\)/i)
  end

end
