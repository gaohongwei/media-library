module MediaLibrary
  class ItemsController < MediaLibrary::BaseController
    before_filter :find_one, only: [:edit, :update, :destroy]
    before_filter :find_galleries, only: [:new, :edit]

    def index
      @items = MediaLibrary::Profile.active.all#(include: :user)
    end

    def new
      @gallery = MediaLibrary::Gallery.where(title: params[:gallery]).first
      if @gallery
          @item = MediaLibrary::Profile.new(user_id: authorized_user.id, gallery_ids: [@gallery.id])
          session[:new_item_back] = gallery_path(@gallery)
      else
        session[:new_item_back] = profiles_path
        @item = MediaLibrary::Profile.new(user_id: authorized_user.id)
      end
    end

    def create
      if params[:upload_id].nil? || params[:upload_id].blank?
        flash[:error] = "Please upload some media before saving."
        return redirect_to new_profile_path
      end

      upload = Uploader.return_media_model(params)
      
      if upload.class == MediaLibrary::Variation
        document = Document.where(id: upload.document_id).first
        #document.update_attributes(params[:profile])
        upload.build_profile(params[:profile]) unless upload.nil?
        upload.update_attributes(params[:item])
      else
        upload.build_profile(params[:profile]) unless upload.nil?
        upload.update_attributes(params[:item]) if params[:item]
      end

      if upload.class == MediaLibrary::Image
        upload.alt_tag = params[:profile][:alt_tag] if params[:profile][:alt_tag]
      end

      respond_to do |f|
        if upload.save!
          f.html { redirect_to session[:new_item_back] ? session[:new_item_back] : profiles_path }
          f.json { render json: { upload: upload, redirect: session[:new_item_back] ? session[:new_item_back] : profiles_path} }
        else
          flash[:error] = "There was a problem creating item's profile."
          f.html { redirect_to new_profile_path }
          f.json { render json: { status: 400, error: upload.errors } }
        end
      end
    end

    def edit

    end

    def update
      params[:profile][:gallery_ids] ||= []

      unless params[:upload_id].blank?
        upload = Uploader::return_media_model(params)
        params[:profile][:profileable_id] = upload.id if upload.save
      end

      @item.update_attributes(params[:profile])
      @item.profileable.update_attributes(alt_tag: params[:alt_tag]) if params[:alt_tag]
      respond_to do |f|
        if @item.save
          flash[:notice] = "Your media has been successfully created."
          f.html { redirect_to session[:new_item_back] ? session[:new_item_back] : profiles_path }
          f.json { render json: { status: 200, item: @item, redirect: session[:new_item_back] ? session[:new_item_back] : profiles_path} }
        else
          f.html { redirect_to edit_profile_path }
          f.js { render json: { status: 400, error: @item.errors.full_messages }}
        end
      end
    end

    def destroy
      @item.update_attributes(active: false)

      respond_to do |f|
        if @item.save
          f.html{ redirect_to profiles_path }
          f.js { render json: { status: 200, model: @item } }
        else
          f.html{ redirect_to profiles_path }
          f.js { render json: { status: 400, error: @item.errors } }
        end
      end
    end

    private
    def find_one
      @item =  MediaLibrary::Profile.where(id: params[:id], active: true).first
    end

    def find_galleries
      @galleries = MediaLibrary::Gallery.all#(include: :user)
    end
  end
end
