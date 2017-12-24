class SettingsController < ApplicationController
  def show
    render json: current_account
  end

  def edit
  end

  def update
   if current_account.update(update_params)
     respond_to do |format|
       format.json { render json: current_account }
       format.html { redirect_to edit_setting_path, notice: 'Updated' }
     end
   else
     errors = current_account.errors.to_a
     respond_to do |format|
       format.json { render json: { errors: errors } }
       format.html { render :edit, alert: errors.join(', ') }
     end
   end
  end

  private

  def update_params
    params.require(:account).permit(:password, :name)
  end
end
