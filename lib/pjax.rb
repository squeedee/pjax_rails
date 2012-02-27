module Pjax
  extend ActiveSupport::Concern

  included do
    helper_method :pjax_request?
    helper_method :pjax_container

    #before_filter :strip_pjax_param
    around_filter :set_pjax_url

    attr_writer :pjax_container
    cattr_accessor :default_pjax_container
  end

  protected
    def pjax_request?
      env['HTTP_X_PJAX'].present?
    end

    def strip_pjax_param
      params.delete(:_pjax)
      request.env['QUERY_STRING'] = Rack::Utils.build_query(params)
      request.env.delete('rack.request.query_string')
      request.env.delete('rack.request.query_hash')
      request.env.delete('action_dispatch.request.query_parameters')
    end

    def set_pjax_url
      yield
      response.headers['X-PJAX-URL'] = request.url
    end

    def pjax_container
      @pjax_container ||= self.class.default_pjax_container 
    end

end
