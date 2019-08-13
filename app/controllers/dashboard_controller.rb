class DashboardController < ApplicationController
  def rate_display
    @fx_pairs = FxPair.all
  end

  def create_rate_display
    latest = FixerService.new.latest(params[:base], params[:target])
    if latest[:errors]
      respond_to do |format|
        format.js do
          flash.now[:danger] = latest[:errors]
          render partial: 'shared/flash_renderer' and return
        end
      end
    end

    latest[:rates].each do |key, rate|
      @fx_pair = FxPair
        .where(base: latest[:base])
        .where(target: key)
        .first

      if @fx_pair
        @fx_pair.update({
          rate: rate,
          last_updated_at: Time.at(latest[:timestamp])
       })
      else
        @fx_pair = FxPair.create({
                        base: latest[:base],
                        target: key,
                        rate: rate,
                        last_updated_at: Time.at(latest[:timestamp])
                      })
      end
    end
  end

  def management
  end

  def import_currencies
    fx = FixerService.new.import_currencies
    respond_to do |format|
      format.js do
        if fx[:errors]
          flash.now[:danger] = fx[:errors]
          render partial: 'shared/flash_renderer' and return
        else
          flash.now[:success] = 'Import successful'
          render partial: 'shared/flash_renderer' and return
        end
      end
    end
  end

  def destroy_fx_pair
    @fx_pair = FxPair.find(params[:id])
    @fx_pair.destroy
  end
end
