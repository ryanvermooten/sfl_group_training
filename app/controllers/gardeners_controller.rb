class GardenersController < ApplicationController

 # GET /groups/:group_id/gardeners
  # GET /groups/:group_id/gardeners.xml
  def index
    #1st you retrieve the group thanks to params[:group_id]
    group = Group.find(params[:group_id])
    #2nd you get all the gardeners of this group
    @gardeners= group.gardeners

    respond_to do |format|
        format.html # index.html.erb
        format.xml {remder :xml => @gardeners}
  end
  end

  def show
#1st you retrieve the group thanks to params[:group_id]
    group = Group.find(params[:group_id])
#2nd you retrieve the comment thanks to params[:id]
    @gardener = group.gardeners.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml {render :xml => @gardener}
    end
  end

# GET /groups/:group_id/gardeners/new
# GET /groups/:group_id/gardeners/new.xml
  def new
    #1st you retrieve the group thanks to params[:group_id]
    group= Group.find(params[:group_id])
    #2nd you build a new comment
    @gardener = group.gardeners.build

    respond_to do |format|
      format.html #new.html.erb
      format.xml {render :xml => @gardener }
    end
  end

# GET /groups/:group_id/gardeners/:id/edit
  def edit
    #1st you retrieve the group thanks to params[:group_id]
    group = Group.find(params[:group_id])
    #2nd you retrieve the comment thanks to params[:id]
    @gardener = group.gardeners.find(params[:id])
  end

# POST /groups/:group_id/group_gardeners
# POST /groups/:group_id/group_gardeners.xml
  def create
    #1st you retrieve the group thanks to params[:group_id]
    group = Group.find(params[:group_id])
    #2nd you create the trainer wih arguments in params [:gardener]
    @gardener = group.gardeners.new(gardener_params)

    respond_to do |format|
      if @gardener.save
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource gardener
      format.html {redirect_to([@gardener.group, @group], :notice => 'Home Gardener was successfully created' )}
      format.xml {render :xml => @gardener, :status => :created, :location => [@gardener.group,@gardener] }
      else
        format.html {render :action => "new"}
        format.xml {render :xml => @gardener.errors, status: :unprocessable_entity}
      end
    end
  end


  def update
    #1st you retrieve the group thanks to params[:group_id]
    group = Group.find(params[:group_id])
    @gardener = group.gardeners.find(params[:id])

    respond_to do |format|
      if @gardener.update_attributes(gardener_params)
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource gardener
     format.html {redirect_to([@gardener.group, @gardener], :notice => 'Gardener was successfully updated')}
     format.xml { head :ok}
      else
        format.html {render :action => "edit"}
        format.xml {render :xml => @gardener.errors, :status => :unprocessable_entity}
      end
    end
  end

  def destroy
    #1st you retrieve the group thanks to params[:group_id]
    group= Group.find(params[:group_id])
    #2nd you retrieve the gardener thanks to params[:id]
    @gardener = group.gardeners.find(params[:id])
    @gardener.destroy

    respond_to do |format|
      #1st argument reference the path /groups/:group_id/gardeners
      format.html {redirect_to(group_gardeners_url)}
      format.xml {head :ok}
    end
  end

  private

  def gardener_params
   params.require(:gardener).permit(:first_name, :last_name, :contact_number, :address, :group_id, :garden_at_home, :document, :id_number, :avatar)
  end

  def group_params
  params.require(:group).permit(:name, :area, :group_id)
  end
end


