Cinder::Application.routes.draw do
  resources :todos, except: [:new, :edit]

  class FormatTest
    attr_accessor :mime_type

    def initialize(format)
      @mime_type = Mime::Type.lookup_by_extension(format)
    end

    def matches?(request)
      request.format == mime_type
    end
  end

  namespace :api, :defaults => {:format => 'json'} do
  end

  get '*foo', :to => 'interface#index', :constraints => FormatTest.new(:html)
  get '/', :to => 'interface#index', :constraints => FormatTest.new(:html)
end
