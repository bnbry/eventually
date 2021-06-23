class SettingsController < ::ApplicationController
  def update
    @setting = Setting.find(params[:id])

    @setting.update(update_params)

    SettingsPublisher.call(@setting)

    redirect_to "/"
  end

  private

  def update_params
    params.require(:setting).permit(:foo_enabled, :bar_enabled).merge(version: @setting.version += 1)
  end
end
