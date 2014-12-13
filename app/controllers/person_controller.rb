class PersonController < ApplicationController

  layout "application"

  #before_action :confirm_logged_in, :except => [:index]
  def list_of_players
    @players ||= Array.new
    @players << @person
  end

  def index
    @people = Person.all
    #@gifts = Gift.all 
  end

  # def shuffled
  #   @players.shuffle!
  # end   

  def show
    @person = Person.find(params[:id])
    #@gift = Gift.order("name ASC")
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.create(person_params)

    if @person.save
      flash[:notice] = "#{@person.name} was created."
      redirect_to(:action => "index")
    else
      render("new")
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    if @person.update_attributes(person_params)
      flash[:notice] = "#{@person.name} was updated."
      redirect_to(:action => 'show', :id => @person.id)
    else
      render('edit')
    end
  end

  def delete
    @person = Person.find(params[:id])
  end

  def destroy
    person = Person.find(params[:id]).destroy
    flash[:notice] = "#{person.name} was deleted."
    redirect_to(:action => 'index')
  end

  private
    def person_params
      params.require(:person).permit(:name)
    end

end
