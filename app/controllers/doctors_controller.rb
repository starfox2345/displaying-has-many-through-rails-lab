class DoctorsController < ApplicationController
    def index
        @doctors = Doctor.all
    end

    def show
        @doctor = Doctor.find(params[:id])
    end

    def new
        @doctor = Doctor.new
    end

    def create
        @doctor = Doctor.new(doctor_params)
    end

    def edit
        @doctor = Doctor.find(params[:id])
    end

    def patch
        @doctor = Doctor.find(params[:id])
        if @doctor.save
            redirect_to @doctors
        else
            render :new
        end
    end

    def delete
        @doctor = Doctor.find(params[:id])
        @doctor.destroy
        redirect_to @doctors
    end
    
    private
    def doctor_params
        params.require(:doctor).permit(:name, :age)
    end
end