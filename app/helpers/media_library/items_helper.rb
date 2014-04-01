module MediaLibrary::ItemsHelper

  def preview_image_tag
    image_tag("#{asset_path(@item.profileable.file.medium)}") if @item.id? && @item.has_image?
  end

end
