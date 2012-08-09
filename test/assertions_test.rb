require File.expand_path("../test_helper", __FILE__)

def stub_app(status_code)
  lambda { |env| [status_code, {}, [""]] }
end

describe MiniTest::Spec do

  it "should have a spec-style matcher for an ok response" do
    def app; stub_app(200); end

    get "/"
    last_response.must_be_ok
  end

  it "should have a spec-style matcher for a created response" do
    def app; stub_app(201); end

    get "/"
    last_response.must_be_created
  end

  it "should have a spec-style matcher for an unauthorized response" do
    def app; stub_app(401); end

    get "/"
    last_response.must_be_unauthorized
  end

  it "should have a spec-style matcher for a not found response" do
    def app; stub_app(404); end

    get "/"
    last_response.must_be_not_found
  end

end