class ApplicationController < ActionController::Base
layout "main"
    require "test_data"
    include TestData
    helper TestData
end