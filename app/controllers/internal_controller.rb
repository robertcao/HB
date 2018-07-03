class InternalController < ApplicationController

  before_filter :require_logged_in

  Privileges = {}

  def index
    render 'internal/index'
  end

  def dashboard
    @total_contact = Contact.count
    @your_contact = @total_contact

    @total_deal = Deal.count
    @your_deal = 0

    @total_portfolio = 0
    @your_portfolio = 0

    @total_meeting = 0
    @your_meeting = 0

    render 'internal/dashboard'
  end

  def Portfolio
    @portfolio = Portfolio.order(created_at: :desc)
    render 'internal/portfolio'
  end

  def deal
    @deals = Deal.order(created_at: :desc)
    render 'internal/deal'
  end

  def deal_create
    @new_deal = Deal.new

  end

  def contact
    @contacts = Contact.order(created_at: :desc)
    render 'internal/contact'
  end

  def contact_create_detail(email, fist_name, middle_name, last_name)
    @email = email
    render 'internal/contact_create_detail'
  end

  def contact_create
    @check_msg = ''
    @email = ''
    @first_name = ''
    @middle_name = ''
    @last_name = ''
    @new_contact = Contact.new

    # Check parameters
    if params['email'].blank? or params['first_name'].blank? or params['last_name'].blank?
      @check_msg = 'Email, First Name and Last Name are required!'
    else
      @email = params['email']
      @first_name = params['first_name']
      @middle_name = params['middle_name']
      @last_name = params['last_name']
      @check_contact_result = Contact.where("email = '#{params['email']}' OR (first_name = '#{params['first_name']}' AND last_name = '#{params['last_name']}')")

      if @check_contact_result.size == 0
        @check_msg = 'Welcome new contact, please fill the details!'
      else
        @check_msg = 'Email or Name already exists!'
      end
    end

    # Check action
    if params['add_new']
      @new_contact.email = @email
      @new_contact.first_name = @first_name
      @new_contact.middle_name = @middle_name
      @new_contact.last_name = @last_name
      @new_contact.nickname = params['nickname']
      @new_contact.relationship = params['relationship']
      @new_contact.company = params['company']
      @new_contact.title = params['title']
      @new_contact.area = params['area']
      @new_contact.company_type = params['company_type']
      @new_contact.title = params['title']
      @new_contact.website = params['website']
      @new_contact.company_phone = params['company_phone']
      @new_contact.company_address = params['company_address']
      @new_contact.personal_phone = params['personal_phone']
      @new_contact.personal_address = params['personal_address']
      @new_contact.linkedin = params['linkedin']
      @new_contact.source = params['source']
      @new_contact.created_by_user = current_user.id

      @new_contact.save!

      @check_msg = 'New contact saved!'
    end
  end

  def contact_info
    @current_contact = Contact.find_by(id: params[:id])
  end

  def check_permission
    current_page = params[:action].to_s
    user_roles = logged_in_as_role
    if Privileges[:developer].include?(current_page)
      render text: 'Permission denied. Contact Hemi Admin.' if !user_roles.include?(:developer)
    else
      render text: 'Permission denied. Contact Zepp Admin.' if !user_roles.include?(:hemi_staff)
    end
  end

  def logged_in_as_role
    roles = [:developer]
    roles << :hemi_staff if session[:current_logged_in].ends_with?('@hemi.vc')
    # roles << :customer_manage if ListedEmail.list(ListedEmail::Admin_For_Customer_Management).include?(session[:current_logged_in])
    # roles << :zepp_now_admin if ListedEmail.list(ListedEmail::Admin_For_ZEPP_NOW).include?(session[:current_logged_in])
    # roles << :app_version_manage if ListedEmail.list(ListedEmail::Android_App_Version_Management).include?(session[:current_logged_in])
    roles
  end
end