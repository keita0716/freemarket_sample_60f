class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_brands
  before_action :set_categorys

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name,:family_kana_name,:first_kana_name,:birth_year,:birth_month,:birth_day ])
    end

    def set_brands
      @brands = Brand.all
    end
    def set_categorys
      @categorysLeft = Category.group(:category_left_id)
      @categorysCenter = Category.group(:category_left_id,:category_center_id)
      @categorysRight = Category.group(:category_left_id,:category_center_id,:category_right_id)
    end
  end

