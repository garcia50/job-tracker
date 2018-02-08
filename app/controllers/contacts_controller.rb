class ContactsController < ApplicationController

  def create
    @job = Job.find(params[:job_id])
    @contact = @job.contacts.create(contact_params)

    redirect_to job(@job)
  end 


  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email)
  end
end