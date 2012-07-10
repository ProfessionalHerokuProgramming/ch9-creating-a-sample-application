class EmployeesController < ApplicationController
    include Databasedotcom::Rails::Controller

    # GET /employee__cs
    def index
        @employees = Employee__c.all
    end

    # GET /employee__cs/1
    def show
        @employee = Employee__c.find(params[:id])
    end

    # GET /employee__cs/new
    def new
        @employee = Employee__c.new
    end

    # POST /employee__cs
    def create
        @employee = Employee__c.new(params[:employee__c])
      @employee['OwnerId'] = User.first.Id

        if @employee.save
            redirect_to employees_url, notice: 'Employee was successfully created.'
        else
            render action: "new"
        end
    end

    # DELETE /employee__cs/1
    def destroy
        @employee = Employee__c.find(params[:id])
        @employee.delete

        redirect_to employees_url
    end
end
