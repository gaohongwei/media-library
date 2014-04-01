module MediaLibrary
  class VariationsController < MediaLibrary::BaseController
    respond_to :js
    rescue_from ActiveRecord::RecordInvalid, with: :model_invalid
    def destroy
      @variation = MediaLibrary::Variation.find(params[:id])
      @variation.update_attribute(:active, false)
      render json: { status: 200, model: @variation }
    end

    def create
      document = MediaLibrary::Document.find(MediaLibrary::Profile.find(params[:id]).profileable_id)
      @variation = document.variations.build(file: params[:file], size: 1)

      if document.save!
        @variation.update_attribute(:size, @variation.file.file.size)
        render json: {status: 200, item: @variation }
      else
        render json: {status: 406, item: @variation.errors }
      end
    end

    private
    def model_invalid(error)
      render json: { error: error.message, status: 400 }
    end
  end
end
