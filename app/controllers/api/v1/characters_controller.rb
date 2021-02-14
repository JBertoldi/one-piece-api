class Api::V1::CharactersController < Api::V1::BaseController
  before_action :set_characters

  def index
    render json: @characters.to_json, status: :ok
  end

  def show
    if Character.find(params[:id])
      @character = @characters.select { |char| char[:id] == params[:id].to_i }
      render json: @character.to_json, status: :ok
    end
  end

  private

  def set_characters
    @characters = Character.all
    @characters = @characters.map do |char|
      {
        id: char.id,
        english_name: char.en_name,
        japanese_name: char.jp_name,
        epithet: char.epithet,
        bounty: char.bounty,
        status: char.status,
        pirate_crew: get_pirate_crew(char.pirate_crew),
        devil_fruit: get_devil_fruit(char.devil_fruit)
      }
    end
  end

  def get_pirate_crew(crew)
    unless crew.nil?
      {
        name: crew.name
      }
    end
  end

  def get_devil_fruit(fruit)
    unless fruit.nil?
      {
        name: fruit.name,
        power_type: fruit.power_type
      }
    end
  end
end
