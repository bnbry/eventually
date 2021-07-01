class SettingsController < ::ApplicationController
  def update
    @setting = Setting.find(params[:id])
    @setting.update(update_params)
    SettingsPublisher.call(@setting)

    redirect_to "/?pp=disable"
  end

  private

  def update_params
    params.require(:setting).permit(:fee_enabled, :discount_enabled).merge(version: @setting.version += 1)
  end
end
