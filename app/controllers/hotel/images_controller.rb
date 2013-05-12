class Hotel::ImagesController < EditController
  skip_before_filter :verify_authenticity_token, :only => [:swfupload]

  belongs_to :hotel

  def swfupload
    @image = Hotel::Image.new :image => params[:image]
    @image.save!

    render json: { success: true, path: @image.image.url(:thumb) }
  rescue
    render json: { success: false }
  end
end
