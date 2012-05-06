class JobsController < ApplicationController

  # GET /jobs
  # GET /jobs.xml
  def index
    conditions = ["title LIKE ?", "%#{params[:term]}%"] unless params[:term].nil?
    limit = 10 if params[:term].nil?
    @job_pages,@jobs  = paginate(:jobs,
                                 :per_page   =>  10,
                                 :order      =>  "created_at DESC",
                                 :conditions => conditions)
    
    respond_to do |format|
      format.html
      format.js   { render(:partial => 'jobs')}
      format.xml  { render :xml => @jobs.to_xml }
    end
  end

  # GET /jobs/1
  # GET /jobs/1.xml
  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @job.to_xml }
    end
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1;edit
  def edit
    @job = Job.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.xml
  def create
    @job = Job.new(params[:job])

    respond_to do |format|
      if @job.save
        flash[:notice] = 'Job was successfully created.'
        format.html { redirect_to job_url(@job) }
        format.xml  { head :created, :location => job_url(@job) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job.errors.to_xml }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.xml
  def update
    @job = Job.find(params[:id])

    respond_to do |format|
      if @job.update_attributes(params[:job])
        flash[:notice] = 'Job was successfully updated.'
        format.html { redirect_to job_url(@job) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job.errors.to_xml }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.xml
  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to jobs_url }
      format.xml  { head :ok }
    end
  end
end
