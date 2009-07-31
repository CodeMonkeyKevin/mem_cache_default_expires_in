module ActiveSupport
  module Cache
    class Store
      cattr_accessor :default_expires_in
      
    private
      def expires_in(options)
        expires_in = options && options[:expires_in] || default_expires_in
    
        raise ":expires_in must be a number" if expires_in && !expires_in.is_a?(Numeric)
    
        expires_in || 0
      end
    end
  end
end

cache_store_options = Rails.configuration.cache_store
ActiveSupport::Cache::Store.default_expires_in = cache_store_options.extract_options![:expires_in]