module Extensions
  module ExposeResource
    extend ActiveSupport::Concern

    module ClassMethods
      def expose_resource(name, options = {})
        options.reverse_merge!(as: name, order: 'id DESC')
        exposed_name = options[:as].to_s

        expose(:resource_name) { name.to_s }
        expose(:page_param) { params[:page].present? ? params[:page] : 1 }
        expose(:resource_class) { resource_name.camelcase.constantize }
        expose(:resource_attributes) { resource_class.attribute_names }
        expose(:resources) { send(exposed_name.pluralize) }
        expose(:resource) { send(exposed_name) } 

        expose(exposed_name.pluralize.to_sym) { resource_class.order(options[:order]).page(page_param) }
        expose(exposed_name.to_sym) 

        define_method :index! do
          respond_with resources
        end

        define_method :show! do
          respond_with resource
        end 

        define_method :new! do
          respond_with resource
        end

        define_method :edit! do
          respond_with resource
        end

        define_method :create! do |url|
          flash[:notice] = t(".resource.created") if resource.save
          respond_with resource, location: url
        end

        define_method :update! do |url|
          flash[:notice] = t(".resource.updated") if resource.save
          respond_with resource, location: url
        end
      end
    end
  end
end

