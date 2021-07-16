class PatientsController < ApplicationController
    def index
        @patients = Patient.all
    end

    def show
        @patient = Patient.find(params[:id])
    end

    def new
        @patient = Patient.new
    end

    def create
        @patient = Patient.new(patient_params)
    end

    def edit
        @patient = Patient.find(params[:id])
    end

    def patch
        @patient = Patient.find(params[:id])
        if @patient.save
            redirect_to @patient
        else
            render :new
        end
    end

    def delete
        @patient = Patient.find(params[:id])
        @patient.destroy
        redirect_to @patients
    end
    
    private

    def patient_params
        params.require(:patient).permit(:name, :age)
    end
end